#!/usr/bin/env bash
set -euo pipefail

FAILED=0
for dir in packages/vai-workflow-*/; do
  name=$(basename "$dir")
  echo -n "Validating $name... "

  # Check package.json has vai field
  if ! node -e "const p=require('./$dir/package.json'); if(!p.vai) throw new Error('missing vai field')" 2>/dev/null; then
    echo "❌ missing vai field in package.json"
    FAILED=1
    continue
  fi

  # Check workflow.json exists and is valid JSON
  if [ ! -f "$dir/workflow.json" ]; then
    echo "❌ missing workflow.json"
    FAILED=1
    continue
  fi

  if ! node -e "JSON.parse(require('fs').readFileSync('./$dir/workflow.json','utf8'))" 2>/dev/null; then
    echo "❌ invalid workflow.json"
    FAILED=1
    continue
  fi

  echo "✅"
done

if [ $FAILED -ne 0 ]; then
  echo ""
  echo "Some packages failed validation!"
  exit 1
fi

echo ""
echo "All packages validated successfully."
