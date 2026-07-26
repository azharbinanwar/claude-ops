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
Write one commit message covering ALL open changes above (staged + unstaged + untracked) — the diff is the truth, not this conversation. Match the repo's existing message style (conventional commits if the log uses them). Subject ≤72 chars; body only if the diff genuinely needs one.

Never include AI attribution of any kind (no "Co-Authored-By: Claude", no "Generated with" lines).

Output only the message in a code block. Do NOT run git commit.
