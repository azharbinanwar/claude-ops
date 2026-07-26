# Changelog

## 1.0.0 — 2026-07-27

Initial release.

- 29 slash commands: quick answers (/short, /yn, /easy, /summary, /cmd, /steps, /example, /compare, /regex, /where, /name, /ops), behavior control (/nocode, /quick, /tell-me-first, /todos, /patch-only, /diff-only, /deepthink, /consult), understand & decide (/explain, /why, /errfix, /options, /risks), writing (/commit-msg, /pr-desc, /issue, /polish)
- consult second-opinion agent (Sonnet)
- All commands per-turn with `disable-model-invocation` — zero idle context cost
- Cheap commands routed to Haiku; /deepthink to Opus
- Tool-call caps on codebase-facing commands (benchmark-driven)
- A/B benchmark script (`scripts/ab-test.sh`); measured 25–55% time/token savings
