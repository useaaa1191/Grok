#!/usr/bin/env bash
# List bot transcripts modified in the last N hours (default 24), newest first, with bot names.
# usage: list-transcripts.sh [hours]
set -euo pipefail
hours="${1:-24}"; root=/home/box/agent-data/agent-transcripts
find "$root" -mindepth 2 -maxdepth 2 -name '*.jsonl' -mmin -$((hours*60)) -printf '%T@ %p\n' 2>/dev/null \
 | grep -v '/sand-subagent-' | sort -rn | while read -r _ path; do
  id=$(basename "$(dirname "$path")")
  name=$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1])).get("name","?"))' "/home/box/agent-data/agents/$id/profile.json" 2>/dev/null || echo "?")
  printf '%s\t%s\t%s\n' "$(date -r "$path" '+%F %H:%M')" "$name" "$path"
done
