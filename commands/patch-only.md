---
description: Fix exactly what's asked — no refactors, no drive-bys
argument-hint: [bug / change]
disable-model-invocation: true
---
Make the smallest change that accomplishes exactly this — nothing else. No refactoring, no renaming, no reformatting untouched lines, no "while I'm here" improvements, no added comments, no touching unrelated files. If you notice something else broken, mention it in one line at the end instead of fixing it.

Before writing the diff, list in one or two lines what cases this patch covers and which it deliberately excludes (e.g. multi-line vs single-line, edge conditions) — then go straight into the code in the same response. No stop, no wait.

Change: $ARGUMENTS
