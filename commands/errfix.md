---
description: One-line root cause + smallest possible fix
argument-hint: [paste error / describe failure]
disable-model-invocation: true
---
First line: the root cause in one sentence.
Then: the smallest fix that works — a few lines of code or one command, nothing more. No refactors, no "you should also", no explanation beyond the one cause line. If you cannot determine the cause from what's given, ask for the one missing thing (one line).

Example shape — "NPE at UserRepo.kt:42" → "Cause: `user.profile` is null before first sync. Fix: `user.profile?.name ?: ""` at line 42."

Error: $ARGUMENTS
