---
description: Show branch diff + title/description, pick Create or Fix first — actually opens the PR
argument-hint: [optional: base branch, defaults to main]
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git branch:*), Bash(git push:*), Bash(gh pr create:*)
disable-model-invocation: true
---
## Context
- Current branch: !`git branch --show-current 2>/dev/null || true`
- Commits since base: !`git log main..HEAD --oneline 2>/dev/null || true`
- Diff stat: !`git diff main...HEAD --stat 2>/dev/null || true`

## Task
1. List the commits and changed files above.
2. If any file reads like an AI-tracking artifact (scratch notes, `PLAN.md`/`NOTES.md`/`SUMMARY.md`-style files, anything not clearly part of the real source tree), flag it in one line as "better excluded (add to .git/info/exclude): path" — a note, not a question.
3. Write the PR title and description from the real diff/commits — a Summary section and a Test plan checklist. Never mention AI, Claude, or "generated with" anywhere in the body.
4. Present two real selectable options using the option-picker tool, not plain-text yes/no:
   - **Create** — pushes the current branch if needed (`git push -u origin <branch>` if no upstream yet), then runs `gh pr create --title "<title>" --body "<body>"` against the base branch (default `main`, or $ARGUMENTS if given), using your logged-in gh identity, no AI attribution. Report the PR URL. Nothing else.
   - **Fix something first** — ends the turn immediately, no PR created. Do not guess what's wrong, do not ask follow-ups. Wait for the next message.

Base branch override (optional): $ARGUMENTS
