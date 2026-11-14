# Bot-building tools (cursor namespace)

Live schemas pulled 2026-11-14. Call each with CallDynamicTool, namespace `cursor`, after GetDynamicTools.

| tool | args | use |
|---|---|---|
| CreateAgent | `name` (req), `description`, `section_id` | make the bot. description = whole persona. returns the new id |
| UpdateAgent | `agent_id` (req, snake_case: `agentId` fails), `name`, `description` | edit an existing bot; only passed fields change |
| ListSections | none | sidebar section ids for CreateAgent `section_id` |
| SendToAgent | `target_id`, `message`, `priority` (all req), `images` | hand the new bot its first task or routine-create instruction (priority true) |

No delete tool. The user deletes from the sidebar: right-click the bot, then Delete.

## Recipe

1. Fill `templates/persona-template.md`.
2. CreateAgent `{"name": "...", "description": "<filled template>"}` and note the returned id.
3. `scripts/verify-bot.sh <id> "ONE JOB"`. profile.json can take a few seconds to appear.
4. If it needs a routine: SendToAgent `{"target_id": "<id>", "priority": true, "message": "create a routine with UpdateRoutine: name X, schedule <cron>, prompt <...>, stay quiet when nothing changed"}`. You can't write another bot's routines yourself.
5. Edits later: UpdateAgent `{"agent_id": "<id>", "description": "..."}`, then verify again.
