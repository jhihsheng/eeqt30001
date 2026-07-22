#!/usr/bin/env bash
# 同步公開產物＋本機語法檢查。
# 正式 HTML 建置與部署由 GitHub Actions 完成（.github/workflows/deploy.yml，push main 即觸發）。
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

# ---- 本機檢查（解析全部頁面、驗交叉引用；不做 HTML 匯出——本伺服器擋 localhost）----
if command -v myst >/dev/null 2>&1; then
  cd "$HERE" && myst build --site
  echo "OK: 語法檢查通過；push 後由 Actions 建置部署"
else
  echo "（未裝 myst：pip install mystmd 可啟用本機檢查；不影響 CI 建置）"
fi
