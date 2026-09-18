# Codex-Switcher 發布檢查清單

> **作者**: AI Coach 益力康陳董 | 2026 AI to Agent  
> **最後更新**: 2026-09-18

## 📋 發布前檢查

### 代碼品質檢查

- [x] **Bash 腳本語法驗證**
  ```bash
  bash -n bin/codex-switch
  ```

- [x] **PowerShell 語法驗證**
  ```powershell
  [System.Management.Automation.PSParser]::Tokenize((Get-Content bin\codex-switch.ps1 -Raw), [ref]$null)
  ```

- [x] **JSON 配置檔驗證**
  ```bash
  python3 -m json.tool templates/config.official.json > /dev/null
  python3 -m json.tool templates/config.gemini.json > /dev/null
  ```

### 文件完整性檢查

- [x] **核心文件**
  - [x] README.md（詳細說明 + 架構圖）
  - [x] CONTRIBUTING.md（貢獻指南）
  - [x] CHANGELOG.md（版本紀錄）
  - [x] LICENSE（MIT 授權）

- [x] **可執行文件**
  - [x] bin/codex-switch（Bash 腳本）
  - [x] bin/codex-switch.ps1（PowerShell 腳本）
  - [x] install.sh（自動化安裝）

- [x] **配置範本**
  - [x] templates/config.official.json
  - [x] templates/config.gemini.json

- [x] **GitHub 集成**
  - [x] .github/workflows/release.yml（自動發布）
  - [x] .github/workflows/test.yml（自動測試）
  - [x] .github/ISSUE_TEMPLATE/bug_report.md
  - [x] .github/ISSUE_TEMPLATE/feature_request.md
  - [x] .github/pull_request_template.md

- [x] **安全配置**
  - [x] .gitignore（排除敏感檔案）

### 功能測試清單

#### macOS / Linux 測試

- [ ] 執行 `bash install.sh` 自動安裝
  ```bash
  bash install.sh
  ```

- [ ] 驗證 `codex-switch` 全域可用
  ```bash
  which codex-switch
  codex-switch status
  ```

- [ ] 測試所有模式切換
  ```bash
  codex-switch official
  codex-switch gemini
  codex-switch status
  ```

#### Windows 測試

- [ ] 複製配置檔
  ```powershell
  New-Item -ItemType Directory -Force -Path "$HOME\.codex"
  Copy-Item templates\config.*.json "$HOME\.codex\"
  ```

- [ ] 測試 PowerShell 腳本
  ```powershell
  .\bin\codex-switch.ps1 official
  .\bin\codex-switch.ps1 gemini
  .\bin\codex-switch.ps1 status
  ```

### 文檔質量檢查

- [x] README.md
  - [x] 清楚的功能說明
  - [x] 架構圖示
  - [x] 快速開始指南
  - [x] 平台特定說明
  - [x] FAQ
  - [x] 進階用法

- [x] CONTRIBUTING.md
  - [x] 行為守則
  - [x] Bug 回報流程
  - [x] 功能請求流程
  - [x] 代碼風格指南
  - [x] 測試要求
  - [x] 發布流程

- [x] CHANGELOG.md
  - [x] Semantic Versioning 格式
  - [x] v1.0.0 初始版本記錄
  - [x] 功能清單
  - [x] 已知問題

---

## 🎯 版本發布流程（GitHub Action 自動化）

### Step 1: 準備新版本

```bash
# 編輯 CHANGELOG.md，新增版本條目
# 格式:
# ## [x.y.z] - YYYY-MM-DD
# ### Added
# - 新功能描述
```

### Step 2: 建立版本標籤

```bash
# 推送到 GitHub
git push origin main

# 建立並推送版本標籤 (觸發 Release Action)
git tag v1.0.0
git push origin v1.0.0
```

### Step 3: GitHub Action 自動執行

當推送標籤時，`.github/workflows/release.yml` 會：
1. ✅ 檢出代碼
2. ✅ 提取版本號
3. ✅ 建立 Release 資源
   - `codex-switcher-v1.0.0-macos-linux.tar.gz`
   - `codex-switcher-v1.0.0-windows.zip`
4. ✅ 建立 GitHub Release
5. ✅ 上傳資源附件

---

## 📦 發布時的檔案結構驗證

確保發布包中包含：

```
codex-switcher-v1.0.0/
├── README.md
├── CONTRIBUTING.md
├── CHANGELOG.md
├── LICENSE
├── install.sh
├── bin/
│   ├── codex-switch
│   └── codex-switch.ps1
└── templates/
    ├── config.official.json
    └── config.gemini.json
```

---

## ✅ 最終檢查清單

### 發布前 (Pre-Release)

- [ ] 所有代碼已審查並通過測試
- [ ] CHANGELOG.md 已更新
- [ ] 所有平台已本地測試
- [ ] 文件無誤別字
- [ ] 沒有敏感資訊提交到版本控制

### 發布時 (Release)

- [ ] 標籤格式正確 (v1.x.x)
- [ ] GitHub Action 已成功執行
- [ ] Release Notes 清楚完整
- [ ] 資源附件正確上傳

### 發布後 (Post-Release)

- [ ] 在官方社群公告
- [ ] 監控 Issue & PR
- [ ] 蒐集使用者回饋
- [ ] 規劃下一版本

---

## 🔗 重要連結

| 項目 | URL |
|------|-----|
| **GitHub Repository** | https://github.com/draiagent/ai-to-agent-codex-switcher |
| **Release Page** | https://github.com/draiagent/ai-to-agent-codex-switcher/releases |
| **Issue Tracker** | https://github.com/draiagent/ai-to-agent-codex-switcher/issues |

---

## 📞 聯絡資訊

- **作者**: AI Coach 益力康陳董
- **Email**: dr.aiagent@gmail.com
- **社群**: GitHub Issues 與 Discussions

---

**祝你發布順利！🚀**
