---
description: Time-aware answer — real today's date injected, no date guessing
argument-hint: [question with relative time, e.g. "git changes last week"]
allowed-tools: Bash(date:*)
disable-model-invocation: true
---
Today's real date: !`date +%F` (!`date +%A`)

Answer using this real date — never guess or imagine the date. Interpret all relative times against it: "last week" = the 7 days before today, "last month" = the 30 days before today, and say the resolved date range in your answer. For git questions use --since/--until with real dates. For web lookups prefer the newest sources and mention their dates.

Question: $ARGUMENTS
