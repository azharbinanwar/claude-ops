---
description: Confirm completion from the conversation — no re-reading
argument-hint: [optional: which task]
disable-model-invocation: true
---
Answer from this conversation's work only — zero tool calls, do not re-read files or re-verify.

First line: "Yes — done" or "No — remaining:" followed by what's left, one line per item.
If a step was never actually run (e.g. tests), say "unverified: X" instead of silently re-checking it.
Nothing else.

Task: $ARGUMENTS
