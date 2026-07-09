#!/usr/bin/env bash
# Activate the FE8J git hooks (points git at the tracked githooks/ directory).
# Run once per clone:  ./githooks/install.sh
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
chmod +x githooks/pre-commit
git config core.hooksPath githooks
echo "Installed: core.hooksPath=githooks"
echo "The pre-commit hook now runs 'make compare' + 'make shiftcheck' on build-relevant commits."
echo "Bypass a single commit with: git commit --no-verify   (or FE8J_SKIP_HOOK=1 git commit)"
echo "Uninstall with: git config --unset core.hooksPath"
