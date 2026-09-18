# Codex-Switcher

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![GitHub Release](https://img.shields.io/github/v/release/draiagent/ai-to-agent-codex-switcher?logo=github)

輕量級的 **Codex AI Agent 編程輔助工具**模型設定快速切換工具。支援在 **OpenAI 官方端點**與**自訂本地反向代理**（如 Gemini / Antigravity 外接模型）之間秒速切換，讓你彈性運用不同的 AI 模型服務商，優化成本與算力配置。

---

## 🎯 核心功能

| 功能 | 說明 |
|------|------|
| 🔄 **快速切換** | 一行指令在官方模式與代理模式間切換 |
| 🌍 **跨平台支援** | macOS / Linux (Bash) · Windows (PowerShell) |
| 💾 **輕量設計** | 無依賴、無背景程序，完全基於配置檔切換 |
| 📋 **模型彈性** | 支援 GPT、Gemini、Claude 等多個模型服務商 |
| ⚡ **快速安裝** | 自動化安裝腳本，一鍵完成環境配置 |

---

## 📊 架構流程

```
┌─────────────────────────────────────────────────────────────┐
│                     Codex Client                            │
│  (IDE / VS Code / Terminal Integration)                     │
└──────────────────────┬──────────────────────────────────────┘
                       │ 讀取 ~/.codex/config.json
                       │
        ┌──────────────┴──────────────┐
        │                             │
        ▼                             ▼
┌──────────────────────┐    ┌──────────────────────────┐
│  Official Mode       │    │  Proxy Mode (Gemini)     │
│  ↓                   │    │  ↓                       │
│ OpenAI API v1        │    │ Local Proxy Service      │
│ (gpt-4, gpt-4o...)   │    │ (http://127.0.0.1:8080) │
│ ↓                    │    │ ↓                        │
│ https://api.openai.  │    │ Google Antigravity       │
│ com/v1               │    │ (Gemini, Claude Code...) │
└──────────────────────┘    └──────────────────────────┘
```

**切換流程**:
1. 執行 `codex-switch gemini` 或 `codex-switch official`
2. 腳本自動將對應的配置檔複製到 `~/.codex/config.json`
3. **重啟 Codex 客戶端**，新配置生效
4. 模型下拉選單自動更新為對應的模型列表

---

**🔗 GitHub 倉庫**: [draiagent/ai-to-agent-codex-switcher](https://github.com/draiagent/ai-to-agent-codex-switcher)

---

## 📁 專案結構

```text
Codex-Switcher/
├── README.md                          # 本檔案
├── CONTRIBUTING.md                    # 貢獻指南
├── CHANGELOG.md                       # 版本變更紀錄
├── LICENSE                            # MIT 開源授權
├── install.sh                         # 快速安裝腳本 (macOS/Linux)
├── bin/
│   ├── codex-switch                   # Bash 切換腳本 (macOS/Linux)
│   └── codex-switch.ps1               # PowerShell 切換腳本 (Windows)
├── templates/
│   ├── config.official.json           # OpenAI 官方配置範本
│   └── config.gemini.json             # Gemini 反代配置範本
└── .github/
    ├── workflows/
    │   ├── release.yml                # 自動發布 Release
    │   └── test.yml                   # 腳本測試 CI
    ├── ISSUE_TEMPLATE/
    │   ├── bug_report.md
    │   └── feature_request.md
    └── pull_request_template.md
```

---

## 🚀 快速開始

### 方案 A：自動化安裝（推薦）

**macOS / Linux:**
```bash
# 複製整個專案
git clone https://github.com/draiagent/ai-to-agent-codex-switcher.git
cd ai-to-agent-codex-switcher

# 執行安裝腳本
bash install.sh

# 編輯配置檔 (設定本地反代埠位)
nano ~/.codex/config.gemini.json
```

**Windows (PowerShell):**
```powershell
# 複製專案並進入目錄
git clone https://github.com/draiagent/ai-to-agent-codex-switcher.git
cd ai-to-agent-codex-switcher

# 手動複製配置檔
New-Item -ItemType Directory -Force -Path "$HOME\.codex"
Copy-Item templates\config.official.json "$HOME\.codex\config.official.json"
Copy-Item templates\config.gemini.json "$HOME\.codex\config.gemini.json"
```

### 方案 B：手動安裝

**Step 1: 建立 .codex 資料夾**

macOS / Linux:
```bash
mkdir -p ~/.codex
```

Windows (PowerShell):
```powershell
New-Item -ItemType Directory -Force -Path "$HOME\.codex"
```

**Step 2: 複製配置範本**

macOS / Linux:
```bash
cp templates/config.official.json ~/.codex/config.official.json
cp templates/config.gemini.json ~/.codex/config.gemini.json
```

Windows (PowerShell):
```powershell
Copy-Item templates\config.official.json "$HOME\.codex\config.official.json"
Copy-Item templates\config.gemini.json "$HOME\.codex\config.gemini.json"
```

**Step 3: 編輯 Gemini 配置檔**

確保 `baseUrl` 符合你的本地反代監聽埠（預設 `http://127.0.0.1:8080`）：
```json
{
  "baseUrl": "http://127.0.0.1:8080/v1",
  "apiKey": "local-proxy-token"
}
```

---

## 📌 使用方式

### macOS / Linux (Bash)

```bash
# 方案 A: 全域安裝後（安裝腳本已完成）
codex-switch gemini      # 切換至 Gemini 反代模式
codex-switch official    # 切換回官方 OpenAI 模式
codex-switch status      # 查看目前配置狀態

# 方案 B: 手動執行腳本
chmod +x bin/codex-switch
./bin/codex-switch gemini
```

### Windows (PowerShell)

```powershell
# 必須進入專案目錄或給定完整路徑
.\bin\codex-switch.ps1 gemini      # 切換至 Gemini 反代模式
.\bin\codex-switch.ps1 official    # 切換回官方 OpenAI 模式
.\bin\codex-switch.ps1 status      # 查看目前配置狀態
```

### ⚠️ 重要提醒

**每次切換配置後，必須完全重啟 Codex 客戶端**（不是最小化，要完全關閉並重新開啟），才能讓新的模型列表生效！

---

## 🔧 配置檔說明

### config.official.json (官方 OpenAI 模式)
```json
{
  "apiType": "openai",
  "baseUrl": "https://api.openai.com/v1",
  "models": ["gpt-4o", "gpt-4o-mini", "o1-preview"],
  "defaultModel": "gpt-4o"
}
```

### config.gemini.json (本地反代模式)
```json
{
  "apiType": "openai-compatible",
  "baseUrl": "http://127.0.0.1:8080/v1",
  "apiKey": "local-proxy-token",
  "models": ["gemini-1.5-pro", "gemini-2.0-flash-exp", "claude-3-5-sonnet"],
  "defaultModel": "gemini-1.5-pro"
}
```

> 💡 **提示**: 根據你的需求和模型服務商，編輯上述檔案以新增或移除模型。

---

## ❓ 常見問題

### Q1: 如何知道目前是哪種模式？
```bash
codex-switch status
```

### Q2: 切換後模型列表沒更新？
**A**: 確認已**完全重啟 Codex**（關閉所有視窗並重新啟動），不是只按最小化。

### Q3: 本地反代服務掛了怎麼辦？
**A**: 自動切換回官方模式，或檢查代理服務狀態並重新啟動。

### Q4: 可以同時支援多個代理嗎？
**A**: 目前設計是單一配置切換。若需多代理，可複製 `config.*.json` 並編輯多份設定檔。

### Q5: 支援哪些系統？
**A**: macOS 10.12+, Linux (任何發行版), Windows 10+

---

## 📚 進階用法

### 新增自訂模型配置

編輯 `~/.codex/config.gemini.json`，添加你支援的模型：

```json
{
  "models": [
    "gemini-1.5-pro",
    "claude-3-5-sonnet",
    "mistral-large",
    "your-custom-model-id"
  ]
}
```

### 建立多個配置檔

例如支援多個服務商：

```bash
# 為 Claude 代理建立額外配置
cp ~/.codex/config.gemini.json ~/.codex/config.claudeflare.json
# 編輯 config.claudeflare.json，改變 baseUrl 和模型列表
```

然後擴展腳本邏輯或建立別名：
```bash
alias codex-claudeflare="cp ~/.codex/config.claudeflare.json ~/.codex/config.json"
```

---

## 🤝 貢獻指南

歡迎提交 Issue 或 Pull Request！詳見 [CONTRIBUTING.md](CONTRIBUTING.md)

### 開發者快速開始
```bash
# Fork 並 Clone 本專案
git clone https://github.com/YOUR-USERNAME/ai-to-agent-codex-switcher.git
cd ai-to-agent-codex-switcher

# 建立功能分支
git checkout -b feature/your-feature

# 測試所有平台
bash bin/codex-switch status

# 提交 PR
```

---

## 📝 版本歷史

詳見 [CHANGELOG.md](CHANGELOG.md)

最新版本: **v1.0.0** (2026-09-18)

---

## 📄 授權條款

本專案採用 [MIT License](LICENSE) 開源授權。可自由使用、修改與分發。

---

## 👨‍💼 關於作者

**AI Coach 益力康陳董 | 2026 AI to Agent**

血糖教練益力康陳董是一位集「科技、商管、大健康、體育、藝術」於一身的跨界實踐者，致力於將 AI 技術融入日常工作與生活決策，打造高效率的人機協作生態。

---

## ⭐ 如果這個專案對你有幫助，請給個 Star！

```
      ⭐
     ⭐⭐⭐
    ⭐⭐⭐⭐⭐
   GitHub Star Me!
```

---

**最後更新**: 2026-09-18  
**維護者**: Codex-Switcher Contributors
