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
- Last commit on this branch: !`git log -1 --format="%h %s (%cr)" 2>/dev/null || true`

## Task
1. If "Commits since base" above is empty, report the "Last commit on this branch" (hash, message, how long ago) and say there's nothing new to open a PR for. Stop — do not write a title/description or show the picker.
2. Output exactly these four labeled sections, in this order, nothing else:
   - **Change list** — one line per changed file, vertical, as `Added: path` / `Modified: path` / `Deleted: path`.
   - **AI check** — one line per flagged file, "better excluded (add to .git/info/exclude): path" for anything that reads like an AI-tracking artifact (scratch notes, `PLAN.md`/`NOTES.md`/`SUMMARY.md`-style files, anything not clearly part of the real source tree). If none, say "None flagged."
   - **pr-title** — the PR title, from the real diff/commits.
   - **pr-body** — a Summary section and a Test plan checklist. Never mention AI, Claude, or "generated with" anywhere.
   `pr-title` + `pr-body` together are the exact text passed to `gh pr create` — Change list and AI check are review-only.
3. Present two real selectable options using the option-picker tool, not plain-text yes/no:
   - **Create** — pushes the current branch if needed (`git push -u origin <branch>` if no upstream yet), then runs `gh pr create --title "<pr-title>" --body "<pr-body>"` against the base branch (default `main`, or $ARGUMENTS if given), using your logged-in gh identity, no AI attribution. Report the PR URL. Nothing else.
   - **Fix something first** — ends the turn immediately, no PR created. Do not guess what's wrong, do not ask follow-ups. Wait for the next message.

Base branch override (optional): $ARGUMENTS
