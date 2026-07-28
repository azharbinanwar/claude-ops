---
description: List changes + message, pick Commit & Push or Fix first — commits locally then pushes
argument-hint: [optional: anything to emphasize]
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git add:*), Bash(git commit:*), Bash(git push:*), Bash(git rev-parse:*), Bash(git branch:*)
disable-model-invocation: true
---
## Context
- Status: !`git status --short`
- Changes: !`git diff HEAD --stat 2>/dev/null || git diff --cached --stat 2>/dev/null || true`
- Recent style: !`git log --oneline -10 2>/dev/null || true`
- Current branch: !`git branch --show-current 2>/dev/null || true`
- Upstream: !`git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo "none set"`

## Task
1. List the open changes above, grouped as New / Modified / Deleted, one line each.
2. If any file reads like an AI-tracking artifact (scratch notes, `PLAN.md`/`NOTES.md`/`SUMMARY.md`-style files, anything not clearly part of the real source tree), flag it in one line as "better excluded (add to .git/info/exclude): path" — a note, not a question.
3. Write ONE commit message covering ALL open changes (staged + unstaged + untracked) — the diff is the truth, not this conversation. Match the repo's existing message style. Subject ≤72 chars; body only if the diff genuinely needs one. Never include AI attribution of any kind (no "Co-Authored-By: Claude", no "Generated with" lines).
4. Present two real selectable options using the option-picker tool, not plain-text yes/no:
   - **Commit & Push** — stages exactly the files listed above (never `git add -A` or `git add .`), runs `git commit` with the exact message shown via heredoc, then pushes (use the existing upstream if set, otherwise `git push -u origin <current branch>`). Report the commit hash and confirm the push. Nothing else.
   - **Fix something first** — ends the turn immediately, nothing committed, nothing pushed. Do not guess what's wrong, do not ask follow-ups. Wait for the next message.

Emphasis (optional): $ARGUMENTS
