#!/usr/bin/env bash
# 提交書源並部署（仿 em/git_push.sh：main 分支＋ghp-import 推 gh-pages）
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
cd "$HERE"

git add .
msg="${1:-update course book}"
git commit -m "$msg" || echo "(nothing to commit)"
git push origin main
ghp-import -n -p -f _build/html
echo "deployed: https://jhihsheng.github.io/eeqt30001/"
