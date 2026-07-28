---
description: Show version + notes, pick Create or Fix first — actually creates the GitHub release
argument-hint: [optional: version override, e.g. 1.4.0]
allowed-tools: Bash(git tag:*), Bash(git log:*), Bash(git describe:*), Bash(gh release create:*)
disable-model-invocation: true
---
## Context
- Latest tag: !`git describe --tags --abbrev=0 2>/dev/null || echo "none yet"`
- Commits since latest tag: !`git log $(git describe --tags --abbrev=0 2>/dev/null)..HEAD --oneline 2>/dev/null || git log --oneline -15`

## Task
1. Work out the version: prefer a version field already in the repo (`plugin.json`, `package.json`, etc.) or the top dated section of `CHANGELOG.md`. If truly ambiguous, ask for it in one line instead of guessing. Use $ARGUMENTS as an override if given.
2. Build the release notes from the matching `CHANGELOG.md` section (or the commits above if there's no changelog entry yet). Never mention AI, Claude, or "generated with" anywhere in the notes.
3. Present two real selectable options using the option-picker tool, not plain-text yes/no:
   - **Create** — runs `gh release create v<version> --title "v<version>" --notes "<notes>"` using your logged-in gh identity, no AI attribution. Report the release URL. Nothing else.
   - **Fix something first** — ends the turn immediately, no tag or release created. Do not guess what's wrong, do not ask follow-ups. Wait for the next message.

Version override (optional): $ARGUMENTS
