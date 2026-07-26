---
description: Ultra-short answer — 2 lines max, no code
argument-hint: [question]
model: haiku
disable-model-invocation: true
---
Answer in 2 lines or fewer. No preamble, no code blocks, no follow-up suggestions, no restating the question. If 2 lines are truly impossible, give the single most important line and say "ask /deepthink for the full picture".

Answer from knowledge or the existing conversation when you can. If a lookup is unavoidable, use at most 2 targeted tool calls — no broad exploration, no graph traversals.

Example shape — Q: "is retrofit kmp-compatible?" → "No — Retrofit is JVM/Android only. Use Ktor client for KMP."

Question: $ARGUMENTS
