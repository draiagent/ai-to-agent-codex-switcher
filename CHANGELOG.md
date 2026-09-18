# 變更日誌

所有重要改動均記錄於此，遵循 [Semantic Versioning](https://semver.org/)。

## [1.0.0] - 2026-09-18

### Added
- ✨ Bash 腳本 (`bin/codex-switch`) 支援 macOS 與 Linux
- ✨ PowerShell 腳本 (`bin/codex-switch.ps1`) 支援 Windows
- ✨ 官方 OpenAI 配置模板 (`templates/config.official.json`)
- ✨ Gemini/Antigravity 反向代理配置模板 (`templates/config.gemini.json`)
- ✨ 完整的中文說明文檔 (README.md)
- ✨ 快速安裝腳本 (install.sh)
- ✨ 自動發布 GitHub Action Workflow

### Features
- 快速切換官方模式與本地反代模式
- 支援 3 種命令：`official`, `gemini`, `status`
- 跨平台支援 (macOS, Linux, Windows)
- 輕量級、無依賴設計

### Changed
- 優化錯誤提示訊息的清晰度

### Fixed
- 修正 Windows 上 PowerShell 執行權限問題

---

## 規劃中的功能

- [ ] 自動代理服務健康檢查
- [ ] 支援更多模型服務商（Claudeflare, Together.ai）
- [ ] 配置檔案驗證工具
- [ ] GUI 切換面板 (Electron)
- [ ] 多語言支援 (English, 简体中文)

---

**維護者**: Codex-Switcher Contributors  
**License**: MIT
