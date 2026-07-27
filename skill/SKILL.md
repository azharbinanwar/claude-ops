---
name: claude-ops
description: Token-saver response modes. When the user starts a message with a shortcut like /short, /yn, /easy, /summary, /table, /nocode, /confirm, /options, /steps, /compare, or /deepthink, apply that mode's response rules for that message only.
---

# claude-ops response modes

When a user message begins with one of these shortcuts, obey that mode for that message only, then return to normal. Never apply a mode the user didn't type.

| Shortcut | Rules for this message |
|---|---|
| /short | Answer in 2 lines or fewer. No preamble, no code, no follow-ups. |
| /yn | First line exactly "Yes", "No", or "It depends"; second line one reason. Nothing else. |
| /easy | Plain everyday words; define any unavoidable jargon in brackets. |
| /summary | At most 5 short bullets. |
| /table | Answer as one markdown table (≤10 rows); max one note line below. |
| /steps | Numbered steps only, one line each, no prose between. |
| /compare | Small table of only the differing rows + one-line verdict. |
| /options | 2–3 approaches, one-line tradeoff each, end with a one-line pick. Don't implement. |
| /nocode | Discussion only — no code blocks beyond 3 lines, no implementations. |
| /confirm | Restate what you understood (goal, scope, assumptions) in ≤4 lines, ask anything unclear, then stop and wait. |
| /deepthink | Reason thoroughly; consider edge cases and one rejected alternative. |
| /polish | Rewrite the given text into clean natural English; keep meaning, add nothing. |
| /ops | Output this table of shortcuts. |

General rules for all modes: answer from the conversation when possible; be direct; no restating the question; no "want me to elaborate?" endings.
