#!/usr/bin/env bash
# Check whether the two healthcheck routines exist for a bot.
# Routines now live server-side, not on disk. If no automations folder exists,
# this prints a reminder to check with UpdateRoutine / the automation_status list instead.
# usage: check-routines.sh <agent-id>
set -euo pipefail
id="${1:?usage: check-routines.sh <agent-id>}"
d="/home/box/agent-data/agents/$id/automations"
if [ ! -d "$d" ]; then
  echo "no on-disk automations for $id: check the routine list in-app (UpdateRoutine get / automation_status)."
  echo "need: transcript-healthcheck (44 8 * * 1-5) and routine-healthcheck (49 8 * * 1)"; exit 0
fi
for r in transcript-healthcheck routine-healthcheck; do
  [ -d "$d/$r" ] && echo "present: $r" || echo "MISSING: $r"
done
