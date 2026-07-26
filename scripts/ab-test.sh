#!/usr/bin/env bash
# A/B test: same question plain vs with a claude-ops command.
# Each run is a fresh headless session; prints actual tokens/time from Claude Code's JSON output.
# Usage: ./ab-test.sh [project-dir]
set -u
cd "${1:-.}"

# headless mode needs the full plugin prefix for slash commands
PAIRS=(
  "is sqldelight better than room for kotlin multiplatform?|/claude-ops:short is sqldelight better than room for kotlin multiplatform?"
  "where is setTheme handled?|/claude-ops:where setTheme"
  "can the qibla feature work offline?|/claude-ops:yn can the qibla feature work offline?"
  "what does QuranStore do?|/claude-ops:explain what does QuranStore do?"
)

run() {
  local out
  out=$(claude -p "$1" --output-format json 2>/dev/null)
  echo "$out" | jq -r 'if type=="array" then map(select(.type=="result"))[0] else . end
    | [.duration_ms, (.usage.output_tokens // 0),
       ((.usage.input_tokens // 0) + (.usage.cache_creation_input_tokens // 0) + (.usage.cache_read_input_tokens // 0)),
       .num_turns] | @tsv' 2>/dev/null || echo "-	-	-	-"
}

printf "%-45s %10s %8s %8s %6s\n" "PROMPT" "ms" "out_tok" "in_tok" "turns"
for pair in "${PAIRS[@]}"; do
  plain="${pair%%|*}"; cmd="${pair##*|}"
  IFS=$'\t' read -r ms ot it nt <<< "$(run "$plain")"
  printf "%-45s %10s %8s %8s %6s\n" "${plain:0:44}" "$ms" "$ot" "$it" "$nt"
  IFS=$'\t' read -r ms ot it nt <<< "$(run "$cmd")"
  printf "%-45s %10s %8s %8s %6s\n" "${cmd:0:44}" "$ms" "$ot" "$it" "$nt"
  echo
done
