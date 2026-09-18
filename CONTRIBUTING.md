# 貢獻指南

感謝您對 **Codex-Switcher** 的興趣！本指南說明如何參與貢獻。

## 行為守則

請尊重所有使用者與貢獻者，維持友善、包容的社群環境。

## 回報問題

### 發現 Bug
1. **檢查現有 Issue** — 避免重複報告
2. **提供詳細資訊**：
   - 複現步驟
   - 預期行為 vs 實際行為
   - 系統環境 (OS, Bash/PowerShell 版本)
   - Codex 版本
   - 錯誤訊息或 Log

### 功能請求
- 說明使用場景和期望的行為
- 解釋為何對你很重要

## 提交修改

### 開發流程

1. **Fork 本專案**
   ```bash
   git clone https://github.com/your-username/Codex-Switcher.git
   cd Codex-Switcher
   ```

2. **建立功能分支**
   ```bash
   git checkout -b feature/your-feature
   # 或修復 Bug:
   git checkout -b fix/issue-description
   ```

3. **修改代碼**
   - 遵循現有代碼風格
   - 添加說明註解（如非顯而易見）
   - 測試所有平台 (Bash on macOS/Linux, PowerShell on Windows)

4. **本地測試**
   ```bash
   # macOS/Linux
   chmod +x bin/codex-switch
   ./bin/codex-switch status
   ./bin/codex-switch official
   
   # Windows
   .\bin\codex-switch.ps1 status
   .\bin\codex-switch.ps1 official
   ```

5. **提交與推送**
   ```bash
   git add .
   git commit -m "feat: 清晰描述改動"
   git push origin feature/your-feature
   ```

6. **建立 Pull Request**
   - 標題簡潔明確
   - 描述改動理由
   - 關聯相關 Issue（如有）
   - 註明測試環境

## 代碼風格

### Bash Script (`bin/codex-switch`)
- 使用 `#!/usr/bin/env bash`
- 縮進：2 空格
- 變數大寫（如 `CONFIG_DIR`）
- 添加錯誤處理

### PowerShell Script (`bin/codex-switch.ps1`)
- 使用 PowerShell v5+ 風格
- 使用 `param()` 定義參數
- 駝峰命名法函數（如 `Show-Help`）
- 使用 `Write-Host` 帶顏色輸出

### JSON 設定檔
- 使用 2 空格縮進
- 註解放在 `.example.json` 檔案中

## 文件要求

- 繁體中文為主
- 清晰、簡潔的說明
- 包含完整的指令範例

## 發布流程

版本發布由維護者執行，遵循 [Semantic Versioning](https://semver.org/)：
- `MAJOR.MINOR.PATCH` (如 v1.2.3)

### 變更日誌 (CHANGELOG.md)
每個合併的 PR 都應該在 `CHANGELOG.md` 中記錄相應的變更。

## License

所有貢獻均須同意採用 [MIT License](LICENSE)。

---

**感謝您的貢獻！** 🎉
