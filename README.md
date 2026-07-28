# claude-ops

**Stop retyping "be brief, no code, plain words please" — type `/short` once.**

Typed, per-turn slash commands for [Claude Code](https://claude.com/claude-code) that cut tokens, latency, and over-eager coding. Every command applies to **one message only** and auto-reverts — your session model, effort level, and settings are never touched.

## Why

Every Claude Code user retypes the same corrections:

- *"Just answer, don't write code"* → over-explaining and unwanted code is a [known complaint](https://github.com/anthropics/claude-code/issues/29769)
- *"Don't refactor unrelated stuff"* → one of the most common CLAUDE.md rules devs write
- *"Short answer please"* → thinking + verbose output is where your tokens go

Putting these in CLAUDE.md makes them **always-on** (and costs context every turn). Switching `/model` is **sticky** for the whole session. These commands are the missing third option: **on-demand, one turn, then gone.** Cheap asks route to Haiku (~10× cheaper per token) with terse output (output tokens cost ~5× input) — a tagged simple question costs ~90% less than the default behavior.

## Install

Add the marketplace:

```
/plugin marketplace add azharbinanwar/claude-ops
```

Install the plugin:

```
/plugin install claude-ops@claude-ops
```

Or straight from a local clone: `/plugin marketplace add ./claude-ops`

Then run `/reload-plugins` (or restart Claude Code) and type `/ops` to see the cheat sheet. Type `/` anytime for the autocomplete list — no memorizing needed.

### Update

```
/plugin marketplace update claude-ops
```

Then `/reload-plugins`. New versions are listed in [CHANGELOG.md](CHANGELOG.md).

## Commands

### Quick answers
| Command | What you get |
|---|---|
| `/ops` | This whole cheat sheet, in chat |
| `/short <question>` | ≤2 lines, no code, no preamble |
| `/yn <question>` | Yes/No + one-line reason |
| `/easy [topic]` | Plain human words, jargon defined in brackets |
| `/summary [target]` | ≤5 bullets |
| `/cmd <goal>` | Just the shell/git command |
| `/steps <goal>` | Numbered steps only |
| `/example <api>` | One minimal working example |
| `/compare <x vs y>` | Small table + one-line verdict |
| `/regex <pattern>` | Regex + one match + one non-match |
| `/table <anything>` | The answer as a markdown table |
| `/is-done` | Yes/No completion check from the conversation — no re-reading |
| `/research <topic>` | Deep web research with a sources list |
| `/practice <topic>` | Industry standard practice: What / Why / adoption Table |
| `/latest <question>` | Time-aware answer — today's real date auto-injected, "last week" resolved correctly |
| `/where <thing>` | Clickable `file:line` locations only |
| `/name <thing>` | 3–5 name suggestions |

### Control how it works
| Command | What it does |
|---|---|
| `/nocode <question>` | Answer only — zero file edits this turn |
| `/quick <task>` | Act now, skip exploration, no narration |
| `/use-context <task>` | Work from what's already in the conversation — no re-reading files |
| `/fyi <note>` | Acknowledge a mid-task note, then keep going where you left off |
| `/fresh-take <problem>` | Ignore my framing — design it fresh, from scratch |
| `/confirm <request>` | Restate what it understood, then wait — no code |
| `/tell-me-first <task>` | Plan in ≤5 lines, stop, wait for your OK |
| `/todos <task>` | Show numbered checklist first, then execute |
| `/patch-only <fix>` | Exactly the fix — no refactors, no drive-bys |
| `/like-this <new> like <existing>` | Build it by mirroring an existing pattern — no redesign |
| `/strict <task>` | Follow project structure/docs/conventions exactly — nothing out of the box |
| `/diff-only <change>` | Unified diff shown, not applied |
| `/deepthink <problem>` | Opposite of /short: Opus + max reasoning |
| `/consult <proposal>` | Fresh-eyes second-opinion agent |

### Understand & decide
| Command | What you get |
|---|---|
| `/explain <thing>` | Brief explanation, no fix, no edits |
| `/why <error>` | Root cause only |
| `/errfix <error>` | One-line cause + smallest fix |
| `/options <decision>` | 2–3 approaches + tradeoffs, not implemented |
| `/risks [change]` | ≤6 bullets of what could break |

### Write it for me
| Command | What you get |
|---|---|
| `/commit-msg` | Short + detailed message from your real open changes, flags AI-artifact files worth excluding, never commits, no AI sign |
| `/commit-only` | Lists changes + message, then a real Commit/Fix-first picker — commits locally, never pushes |
| `/commit-and-push` | Same flow, but the picker's Commit & Push option pushes too |
| `/create-release` | Shows the version + release notes, then Create/Fix-first — actually creates the GitHub release |
| `/create-pr` | Shows the branch diff + title/description, then Create/Fix-first — actually opens the PR |
| `/pr-desc` | PR title + description from the branch diff |
| `/issue [bug]` | Ready-to-paste GitHub issue |
| `/polish <text>` | Your rough words → clean English, meaning kept |

## Measured results

Same questions, fresh headless sessions, plain vs command — real numbers from `scripts/ab-test.sh` (run on a Kotlin Multiplatform codebase, July 2026):

| Question type | Plain | With claude-ops | Saved |
|---|---|---|---|
| Knowledge Q (`/short`) | 9.9s · 437 out-tok | 4.6s · 307 out-tok | 53% time |
| Symbol lookup (`/where`) | 13.2s · 3 tool turns | 10.8s · 2 turns | 40% input tok |
| Yes/no Q (`/yn`) | 33.5s · 9 tool turns | 20.6s · 4 turns | 38% time, 56% input tok |
| Explain Q (`/explain`) | 11.4s | 13.2s | ~tie |

**Overall: 28% less time, 24% fewer output tokens, 40% fewer input tokens** — measured against a baseline that already ran terseness tooling. Stock setups should see more. Reproduce it yourself: `./scripts/ab-test.sh <your-project>`.

## Does having 29 commands cost tokens?

No. Every command sets `disable-model-invocation: true`, so none of them are loaded into Claude's context until the moment you type one — then only that command's few lines are added, for that turn. Idle cost: ~zero. Use the five you love, ignore the rest.

## Use it on claude.ai too

The `skill/SKILL.md` file packages the response-style modes (/short, /yn, /easy, /table, ...) as a claude.ai skill. Zip it (`cd skill && zip claude-ops-skill.zip SKILL.md`) — or grab the zip from the latest GitHub Release — and upload it in claude.ai → Settings → Skills. Same shortcuts, web chats. (Model routing, tool caps, and git commands are Claude Code-only.)

## Rules vs commands — where should your habit go?

- Want it **always**? → one line in `CLAUDE.md` (e.g. *"Never add comments narrating changes"*). Note: CLAUDE.md is paid every turn — keep it short.
- Want it **sometimes**? → a command like these. Copy any file in `commands/`, edit, done.
- Never want AI sign-offs in commits? → `"includeCoAuthoredBy": false` in `~/.claude/settings.json`.

## License

MIT
