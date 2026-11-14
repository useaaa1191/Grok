# grok — Design a Grok Bot bundle

Everything the Design a Grok Bot skill points to.

- `skills/design-grok-bot/SKILL.md`: the main rubric (one job, anti-jobs, voice, wake).
- `skills/transcript-healthcheck/SKILL.md`: weekday friction scan (routine `44 8 * * 1-5`).
- `skills/routine-healthcheck/SKILL.md`: Monday token/waste audit (routine `49 8 * * 1`).
- `skills/pstack/`: full pstack pack (poteto-mode with its playbooks/references/scripts, setup-pstack, create-verification-skill, unslop, principle-* and the rest). poteto-mode loads sibling skills from `../<name>/`, so keep this folder intact.
- `skills/writing-for-agents/`: house style for personas and skills.
- `templates/persona-template.md`: fill-in CreateAgent description.
- `scripts/verify-bot.sh <id> [text]`: prove a create/update landed in profile.json.
- `scripts/list-transcripts.sh [hours]`: transcript corpus for transcript-healthcheck.
- `scripts/check-routines.sh <id>`: healthcheck routine presence (falls back to in-app check; routines live server-side).
- `scripts/scan-routines.sh`: fleet routine table for routine-healthcheck.

Flow: intake (job, voice/name, wake, audience) -> fill template -> CreateAgent -> verify-bot.sh -> tell user name + one-job line -> if it needs a routine, SendToAgent the new bot to create it.

## Dots Default

The `DOTS_DEFAULT.md` file describes a general-purpose, proactive personal agent profile. It is a persona specification, not a deployed Grok bot or ChatGPT Dot.
