# Changelog

## 1.1.0 — 2026-07-27

- New: `/confirm` — restates what it understood from your request (goal, scope, assumptions) and waits, before touching anything
- New: `/is-done` — Yes/No completion check answered from the conversation, no re-reading files
- New: `/research` — deep web research with a sources list
- New: `/table` — any answer formatted as a markdown table
- New: `/latest` — injects the real current date so "last week"/"latest" resolve correctly (git ranges, fresh web results)
- `/research` now injects the real date and prefers sources from the last 30 days
- New: `/like-this` — build something by mirroring an existing pattern in the codebase, no redesign
- New: `/strict` — do the task strictly inside project conventions (docs, structure, patterns); stop rather than improvise
- New: `/use-context` — do the task from code already shown in the conversation; open files only for genuinely unseen regions
- `/why` now answers questions about Claude's own recent changes from the conversation, zero re-reading
- README: install commands split into separate copyable blocks

## 1.0.0 — 2026-07-27

Initial release.

- 29 slash commands: quick answers (/short, /yn, /easy, /summary, /cmd, /steps, /example, /compare, /regex, /where, /name, /ops), behavior control (/nocode, /quick, /tell-me-first, /todos, /patch-only, /diff-only, /deepthink, /consult), understand & decide (/explain, /why, /errfix, /options, /risks), writing (/commit-msg, /pr-desc, /issue, /polish)
- consult second-opinion agent (Sonnet)
- All commands per-turn with `disable-model-invocation` — zero idle context cost
- Cheap commands routed to Haiku; /deepthink to Opus
- Tool-call caps on codebase-facing commands (benchmark-driven)
- A/B benchmark script (`scripts/ab-test.sh`); measured 25–55% time/token savings
