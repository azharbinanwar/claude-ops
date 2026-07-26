---
description: Locations only — clickable file:line paths, no code dumps
argument-hint: [what to find]
disable-model-invocation: true
---
Find where this lives in the codebase. Output only locations, one per line, in the exact format `path/to/file.ext:123` (clickable) followed by a label of 5 words or fewer. No code blocks, no explanations, no file contents. Max 10 locations; if more exist, say "+N more" on the last line.

If the target is a module/feature/folder rather than a single symbol, lead with the root directory, then only the 3–5 key entry-point files.

Prefer one targeted search (grep/glob) — no graph traversals, no reading file contents beyond confirming a match.

Find: $ARGUMENTS
