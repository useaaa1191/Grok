#!/usr/bin/env bash
# Dump every on-disk routine across the fleet: bot, routine, schedule/trigger, enabled, quiet-rule.
# Routines may be server-side only; if nothing prints, audit via each bot's routine list in-app.
set -uo pipefail
python3 - <<'PY'
import json,glob,os
rows=0
for a in sorted(glob.glob("/home/box/agent-data/agents/*/")):
    try: name=json.load(open(a+"profile.json")).get("name","?")
    except Exception: continue
    for f in glob.glob(a+"automations/*/automation.json"):
        try: j=json.load(open(f))
        except Exception: continue
        prompt=json.dumps(j).lower()
        quiet="yes" if ("quiet" in prompt or "nothing changed" in prompt) else "NO"
        sched=j.get("schedule") or j.get("cron") or j.get("trigger") or "?"
        print(f"{name}\t{os.path.basename(os.path.dirname(f))}\t{sched}\tenabled={j.get('enabled','?')}\tquiet={quiet}")
        rows+=1
if not rows: print("no on-disk routines found; routines are stored server-side. audit them from each bot's routine list.")
PY
