---
description: Yes/No answer plus one-line reason
argument-hint: [question]
model: haiku
disable-model-invocation: true
---
First line: exactly "Yes", "No", or "It depends".
Second line: one sentence of reason (for "It depends": the one condition it depends on).
Nothing else — no code, no elaboration.

Answer from the conversation or knowledge when you can. If you must check the code, use at most 3 targeted tool calls — verify the deciding fact, not the whole picture.

Question: $ARGUMENTS
