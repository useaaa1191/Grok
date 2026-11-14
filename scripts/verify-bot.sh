#!/usr/bin/env bash
# Prove a bot was created/updated: print its live name and description length.
# usage: verify-bot.sh <agent-id> [expected-substring]
set -euo pipefail
id="${1:?usage: verify-bot.sh <agent-id> [expected-substring]}"
f="/home/box/agent-data/agents/$id/profile.json"
for i in 1 2 3 4 5; do [ -f "$f" ] && break; sleep 1; done   # folder can lag a few seconds after create
[ -f "$f" ] || { echo "FAIL: $f not found"; exit 1; }
python3 - "$f" "${2:-}" <<'PY'
import json,sys
p=json.load(open(sys.argv[1])); d=p.get("description","") or ""
print(f"name: {p.get('name')}\ndescription chars: {len(d)}\nfirst line: {d.splitlines()[0] if d else '(empty)'}")
if sys.argv[2]:
    ok = sys.argv[2] in d; print("expected text:", "FOUND" if ok else "MISSING"); sys.exit(0 if ok else 1)
PY
