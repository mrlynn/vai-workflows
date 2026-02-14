#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Usage: $0 <new-min-version>"
  echo "Example: $0 1.29.0"
  exit 1
fi

VERSION="$1"
echo "Bumping minVaiVersion to $VERSION across all packages..."

for dir in packages/vai-workflow-*/; do
  node -e "
    const fs = require('fs');
    const path = './$dir/package.json';
    const pkg = JSON.parse(fs.readFileSync(path, 'utf8'));
    if (pkg.vai) {
      pkg.vai.minVaiVersion = '$VERSION';
      fs.writeFileSync(path, JSON.stringify(pkg, null, 2) + '\n');
      console.log('  ✅ ' + pkg.name);
    }
  "
done

echo "Done."
