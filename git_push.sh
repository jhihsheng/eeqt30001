#!/usr/bin/env bash
# 提交並推送書源；之後 GitHub Actions 自動建置＋部署（不再使用 ghp-import / gh-pages 分支）
set -euo pipefail
cd "$(dirname "$0")"

git add .
msg="${1:-update course book}"
git commit -m "$msg" || echo "(nothing to commit)"
git push origin main
echo "pushed — 建置進度：https://github.com/jhihsheng/eeqt30001/actions"
echo "完成後網站：https://jhihsheng.github.io/eeqt30001/"
