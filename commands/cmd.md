---
description: Just the shell/git command, nothing else
argument-hint: [what you want to do]
model: haiku
disable-model-invocation: true
---
Output only the command in a single code block. No explanation, no alternatives, no warnings unless the command is destructive (then one warning line above it). Assume macOS + zsh unless the context says otherwise.

Example shape — "undo last commit keep changes" → ```git reset --soft HEAD~1```

I want to: $ARGUMENTS
