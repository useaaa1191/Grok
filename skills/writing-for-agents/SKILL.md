---
name: writing-for-agents
description: >-
  Use when creating or editing skills, agent profiles, AGENTS.md / CLAUDE.md, or
  any document an agent consumes — apply writing-for-agents levers (pointers,
  hierarchy, completion criteria, leading words, pruning).
---
# writing-for-agents

Source of truth (pinned commit c55ee460): `/home/box/writing-for-agents/`

1. Read `/home/box/writing-for-agents/SKILL.md` in full before drafting or editing any agent-facing document.
2. If the artifact is a **skill**, also read `/home/box/writing-for-agents/SKILL-MECHANICS.md` (frontmatter, model- vs user-invocation, router skills).
3. Apply the levers in order of need: context pointers → information hierarchy / progressive disclosure → steps with clear completion criteria → leading words → pruning (single source of truth, no caches of the environment, no no-ops, positive framing over negation).
4. On Grok Bot, save reusable skills with `update_state` (target `skill`): required `name`, when-to-use `description` (the context pointer), and generic `body`. Keep assistant-specific details out of the shared skill.
5. On Grok Bot, agent personas live in CreateAgent / UpdateAgent `description` — treat that field like an always-loaded pointer + body: front-load triggers, one job, explicit anti-jobs, completion-shaped wake behavior.
6. Deliver the artifact itself first (SKILL.md draft or profile description). After it, one short note: which levers you changed and why.

Do not invent skill APIs or frontmatter Grok Bot does not support. Leave foreign Cursor-only keys alone when editing existing skills.
