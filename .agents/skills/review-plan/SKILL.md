---
name: review-plan
description: Review a plan.
---
Review & critique thoroughly. 

If asked to propose improvements, respond inline.  If asked to improve, then edit the plan directly.

## Output layout
1. Verdict in 2-3 sentences.
2. Findings (format above).
3. Questions only the author can answer (Q1, Q2...).
4. A **pre-populated response template** in a single code block, so the
   user can copy it, edit it, and paste it back.

## Response template (generate exactly this shape)
- One line per finding, in ID order, with the short title as a comment
  so the user doesn't have to scroll up.
- Pre-fill each line with Claude's recommended response. Use `ok` only
  when confidence is high; use `why` or `?` where Claude is unsure.
- One line per question, left blank after the colon.
- End with a free-text line for anything not tied to a finding.

Template shape:

    F1: ok          # Short title of F1
    F2: ok          # Short title of F2
    F3: edit -      # Short title of F3 (blank = user fills the new fix)
    F4: ?           # Short title of F4
    Q1:             # Question text, abbreviated
    Q2:             # Question text, abbreviated
    General:

Rules for the template:
- Options: ok | no | edit | why | defer | ?  (anything after a comma
  or dash is a comment, e.g. "F4: no, legal already signed off")
- Tell the user: "Pre-filled lines are my recommendations, not your
  answers. Edit what you disagree with and send the whole block back."
- Never treat the template as answered until the user sends it back.
- Add a status marker next to any finding where Claude is unsure the
  user will agree, e.g. "# F5 (judgment call)".

## Phase 2: Processing the returned template
1. Parse line by line. A line left as `?` or a blank Q is unanswered:
   ask about those, don't assume.
2. Echo a one-line-per-ID summary of your interpretation before acting.
3. Handle `why` with fuller explanations, then re-issue a fresh
   template containing ONLY the open items (same IDs, no renumbering).
4. Apply `ok` and `edit`, with a changelog mapping each change to its ID.
5. Keep a running list of `defer` items.