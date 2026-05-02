/**
 * Powerline Footer Extension for pi
 *
 * A powerline-style status bar showing:
 * - Turn count
 * - Token usage (input/output/cache)
 * - Cost
 * - Git branch
 * - Current model
 * - Extension status indicators
 *
 * Toggle with /powerline command
 */

import type { AssistantMessage } from "@mariozechner/pi-ai";
import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@mariozechner/pi-tui";

// Powerline separator characters
const SEP_RIGHT = "\ue0b0";  //  filled
const SEP_LEFT = "\ue0b2";   //  filled
const SEP_RIGHT_THIN = "\ue0b1"; //  thin
const SEP_LEFT_THIN = "\ue0b3";  //  thin

interface Segment {
  text: string;
  fg: string;
  bg: string;
}

export default function (pi: ExtensionAPI) {
  let enabled = false;
  let turnCount = 0;

  pi.on("turn_start", async () => {
    turnCount++;
  });

  pi.registerCommand("powerline", {
    description: "Toggle powerline footer",
    handler: async (_args, ctx) => {
      enabled = !enabled;

      if (enabled) {
        ctx.ui.setFooter((tui, theme, footerData) => {
          const unsubBranch = footerData.onBranchChange(() => tui.requestRender());
          
          // Helper for number formatting
          const fmt = (n: number): string => {
            if (n === 0) return "0";
            if (n < 1000) return `${n}`;
            if (n < 1000000) return `${(n / 1000).toFixed(1)}k`;
            return `${(n / 1000000).toFixed(1)}M`;
          };

          return {
            dispose: unsubBranch,
            invalidate() {},
            render(width: number): string[] {
              // Gather data
              let input = 0;
              let output = 0;
              let cacheRead = 0;
              let cacheWrite = 0;
              let cost = 0;

              for (const e of ctx.sessionManager.getBranch()) {
                if (e.type === "message" && e.message.role === "assistant") {
                  const m = e.message as AssistantMessage;
                  input += m.usage.input;
                  output += m.usage.output;
                  cacheRead += m.usage.cacheRead ?? 0;
                  cacheWrite += m.usage.cacheWrite ?? 0;
                  cost += m.usage.cost.total;
                }
              }

              const branch = footerData.getGitBranch();
              const model = ctx.model?.id || "no-model";
              const modelShort = model.split("/").pop() || model;
              
              // Build left-side segments
              const leftSegments: string[] = [];
              
              // Turns segment (accent)
              if (turnCount > 0) {
                leftSegments.push(theme.fg("accent", theme.bg("selectedBg", ` ${turnCount} `)));
              }
              
              // Tokens segment (dim)
              const tokenText = `↑${fmt(input)} ↓${fmt(output)}`;
              leftSegments.push(theme.fg("muted", theme.bg("toolPendingBg", ` ${tokenText} `)));
              
              // Cache segment (if any cache usage)
              if (cacheRead > 0 || cacheWrite > 0) {
                const cacheText = `⚡${fmt(cacheRead + cacheWrite)}`;
                leftSegments.push(theme.fg("success", theme.bg("toolSuccessBg", ` ${cacheText} `)));
              }
              
              // Cost segment
              const costText = `$${cost.toFixed(2)}`;
              leftSegments.push(theme.fg("dim", theme.bg("userMessageBg", ` ${costText} `)));
              
              // Build right-side segments
              const rightParts: string[] = [];
              
              // Extension statuses
              const statuses = footerData.getExtensionStatuses();
              for (const [, statusText] of statuses) {
                if (statusText && !statusText.includes("Turn")) {
                  rightParts.push(statusText);
                }
              }
              
              // Model and branch
              const branchDisplay = branch ? `(${branch})` : "";
              rightParts.push(`${modelShort} ${branchDisplay}`);
              
              const rightText = rightParts.filter(Boolean).join(" ");
              
              // Calculate padding
              const leftText = leftSegments.join("");
              const leftWidth = visibleWidth(leftText);
              const rightWidth = visibleWidth(rightText);
              const padding = Math.max(1, width - leftWidth - rightWidth);
              
              // Assemble line
              const line = leftText + " ".repeat(padding) + rightText;
              
              return [truncateToWidth(line, width)];
            },
          };
        });
        
        ctx.ui.notify("Powerline footer enabled", "info");
      } else {
        ctx.ui.setFooter(undefined);
        ctx.ui.notify("Default footer restored", "info");
      }
    },
  });
}
