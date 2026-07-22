#!/usr/bin/env bash
# 建置課程書（仿 em/build_jbook.sh；改為 repo 內執行、先同步教材產物）
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
DEV="$HOME/eeqt30001"   # 私有工作 repo（教材源；GitHub 名 eeqt30001-dev，本地目錄不改名）

# ---- 同步公開產物（僅講義 PDF＋公式卡＋starter；投影片走 E3 不入站）----
mkdir -p "$HERE/assets"
for w in 07 08 09 10; do
  cp "$DEV/notes/week$w.pdf" "$HERE/assets/week$w.pdf"
done
cp "$DEV/exam/formula_card.pdf" "$HERE/assets/formula_card.pdf"
cp "$DEV/notebook/starter.ipynb" "$HERE/assignment/starter.ipynb"

# ---- 建置 ----
rm -rf "$HERE/_build"
jupyter-book build "$HERE"
echo "OK: $HERE/_build/html/index.html"
