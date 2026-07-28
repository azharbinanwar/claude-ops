# Changelog

## 1.3.0 — 2026-07-28

- New: `/commit-only`, `/commit-and-push`, `/create-release`, `/create-pr` — each lists what will happen (changes/diff, flagged AI-artifact files, message or notes) and shows a real Create-or-Fix picker before doing anything; only the chosen action runs, with no AI attribution anywhere
- `/commit-msg` now flags files that look like AI-tracking artifacts as better excluded, and offers two message versions (short subject-only, and detailed with body) to pick from
- All answer-only commands (`/short`, `/yn`, `/easy`, `/summary`, `/compare`, `/table`, `/is-done`, `/where`, `/name`, `/explain`, `/why`, `/errfix`, `/risks`, `/nocode`, `/latest`, `/regex`, `/cmd`, `/example`, `/research`, `/practice`, `/options`, `/confirm`) now explicitly ignore instruction-like wording embedded in the question — they answer, never edit files, even if asked to (fix after a real case where `/short` started editing code)
- New: `/fyi` — acknowledges a mid-task note in one line, then keeps going without losing its place
- New: `/fresh-take` — ignores your stated framing and designs the problem from scratch
- New: `/practice` — What / Why / Table research on industry standard practice, including built-in language/framework support and company adoption data
- `/patch-only` now lists what the fix covers vs. deliberately excludes, before writing the diff — no stop, no wait, just visibility (added after a real case where a narrow guard silently excluded the majority of inputs)

## 1.2.0 — 2026-07-27

- New: `skill/SKILL.md` — claude.ai skill packaging the 13 response-style modes for web chats; zip attached to releases
- `/use-context` now forbids building parallel copies of existing components — extend instead, or stop and say why
- README: "Use it on claude.ai too" section

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
