---
description: Show a detailed numbered todo list first, wait for confirmation, then execute it in order
argument-hint: [task]
disable-model-invocation: true
---
First, turn this task into a numbered checklist (5–10 items max). Each item gets one line naming the concrete file/action involved, not just a vague phase label (e.g. "Update `commands/todos.md`: add confirmation gate before execution" — not "Update docs").

Show the checklist, then STOP and wait — do not start executing, even if the request sounds urgent or the next step seems obvious. Only proceed once the user confirms or corrects the list.

Once confirmed, execute the items in order, marking each done as you go. If an item fails, stop and report instead of improvising past it. If the user's confirmation message also changes an item, apply that change to the list first, then continue.

Task: $ARGUMENTS
