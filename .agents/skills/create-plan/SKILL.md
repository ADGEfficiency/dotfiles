---
name: create-plan
description: Guidance for creating and maintaining implementation plans. Read this skill when the user asks to create a plan, write a plan, start planning, or when beginning a complex multi-step task that needs a structured plan.
---

## Creating Plans

### When to Create a Plan

If it's not obvious whether a task needs a plan, ask the user.

### Where Plan Files are Stored

Plans should be organized by date — use `YYYY-MM` to group plans.

Default path: `./docs/ai/YYYY-MM/plan-$NAME.md`. Always start filename with `plan-`.

Old plans may exist in `./ai/plan-$NAME.md` or `./ai/docs/plan-$NAME.md` — if found, ask if it's OK to migrate.

Check for existing plans before starting a planning task — read and edit if found.

### When Executing a Plan

Update the plan as the last step when making code changes from a plan.

### Plan Template

Use this template verbatim when creating a new plan:

````markdown
# Plan: $TITLE

$SHORT_DESCRIPTION — one or two sentences on the goal.

## Step Details

### Step one

Details, context, function/class stubs, file paths.

### Step two

Details.

### Step three

Details.

## Open Questions

- [ ] Question about X — needs decision before step 2
- [X] ~~Question about Y~~ — resolved: chose option A

## Logbook

- 2025-01-15: Created plan. Initial scope is X, Y, Z.
- 2025-01-16: Completed step one. Discovered edge case in date parsing — added handling.
- 2025-01-16: Step two blocked — waiting on access to `catalog.schema.table`. Asked in Slack.

## Background

Longer context: why this work is needed, relevant architecture, links to docs or threads.

## Decision Register

- **Use polars over pandas** — better performance for the 2M-row dataset; consistent with other project code.
- **Separate config into its own module** — keeps main entry point clean; matches existing pattern in `src/config.py`.

## Step Tracker

- [ ] Step one
- [ ] Step two
- [ ] Step three
````

### Formatting Rules

- The Steps section ALWAYS starts with a flat checkbox list showing all steps and their status
- Use `[X]` for done, `[ ]` for not done, `[-]` for skipped/deferred (add reason)
- Each step gets its own `###` heading below the list for details
- Mark the checkbox in the summary list as the single source of truth for status
- Favour markdown bullet lists over tables; use multiple levels
- Include stubs of functions and classes in step details
- Separate refactors from features — often want refactors done first
- Look for opportunities to refactor and clean up before adding features
- Order steps outside-in — do `main` first

### Logbook Format

One line per entry, prefixed with `YYYY-MM-DD`. Record:
- What was done
- Anything surprising or worth remembering
- Blockers encountered

### Decision Register Format

One bullet per decision: **bold the choice**, then explain the reasoning after a dash. Keep it to one or two sentences. Add decisions as they're made during implementation, not just at plan creation.

### Open Questions

Use checkboxes. When resolved, check the box and strikethrough the question, appending the resolution. This keeps a visible history of what was decided.
