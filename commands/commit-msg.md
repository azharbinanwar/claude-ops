---
description: Commit message from real open changes — never commits, no AI sign
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*)
disable-model-invocation: true
---
## Context
- Status: !`git status --short`
- Changes: !`git diff HEAD --stat 2>/dev/null || git diff --cached --stat 2>/dev/null || true`
- Recent style: !`git log --oneline -10 2>/dev/null || true`

## Task
First, if any open file reads like an AI-tracking artifact (scratch notes, `PLAN.md`/`NOTES.md`/`SUMMARY.md`-style files, anything not clearly part of the real source tree) — list it in one line as "better excluded (add to .git/info/exclude): path". This is a flag, not a question — don't wait for an answer, just note it and move on.

Then write TWO versions of the commit message covering ALL open changes above (staged + unstaged + untracked) — the diff is the truth, not this conversation. Match the repo's existing message style (conventional commits if the log uses them):
1. **Short** — one line, subject only, ≤72 chars.
2. **Detailed** — subject + body explaining what changed and why, only as long as the diff actually warrants.

Never include AI attribution of any kind (no "Co-Authored-By: Claude", no "Generated with" lines).

Output only the flagged files (if any) and the two messages in code blocks. Do NOT run git commit.
