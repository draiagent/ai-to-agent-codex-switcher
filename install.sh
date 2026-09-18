#!/usr/bin/env bash
# Codex-Switcher 快速安裝腳本 (macOS / Linux)
# 用法: bash install.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${HOME}/.codex"
INSTALL_PATH="/usr/local/bin/codex-switch"

echo "======================================"
echo "  Codex-Switcher 安裝程式 (macOS/Linux)"
echo "======================================"
echo ""

# 1. 建立 .codex 目錄
echo "[1/4] 建立 .codex 設定目錄..."
mkdir -p "${CONFIG_DIR}"
echo "✓ 已建立: ${CONFIG_DIR}"

# 2. 複製設定範本
echo "[2/4] 複製設定檔範本..."
cp -f "${SCRIPT_DIR}/templates/config.official.json" "${CONFIG_DIR}/config.official.json"
echo "✓ 已複製: config.official.json"

cp -f "${SCRIPT_DIR}/templates/config.gemini.json" "${CONFIG_DIR}/config.gemini.json"
echo "✓ 已複製: config.gemini.json"

# 3. 安裝可執行腳本
echo "[3/4] 安裝 codex-switch 到系統路徑..."

# 檢查是否需要 sudo
if [ -w /usr/local/bin ]; then
    cp "${SCRIPT_DIR}/bin/codex-switch" "${INSTALL_PATH}"
else
    echo "需要 sudo 權限來安裝至 /usr/local/bin"
    sudo cp "${SCRIPT_DIR}/bin/codex-switch" "${INSTALL_PATH}"
fi

chmod +x "${INSTALL_PATH}"
echo "✓ 已安裝: ${INSTALL_PATH}"

# 4. 驗證安裝
echo "[4/4] 驗證安裝..."
if command -v codex-switch &> /dev/null; then
    echo "✓ 安裝成功！"
    echo ""
    echo "======================================"
    echo "  接下來的步驟"
    echo "======================================"
    echo ""
    echo "1. 編輯 ${CONFIG_DIR}/config.gemini.json"
    echo "   確認 baseUrl 符合你的本地反代監聽埠"
    echo ""
    echo "2. 切換至 Gemini 反代模式："
    echo "   $ codex-switch gemini"
    echo ""
    echo "3. 確認本地反代服務已啟動，並完全重啟 Codex 客戶端"
    echo ""
    echo "4. 查看目前狀態："
    echo "   $ codex-switch status"
    echo ""
else
    echo "✗ 安裝驗證失敗"
    echo "請確認 /usr/local/bin 在 \$PATH 中"
    exit 1
fi
