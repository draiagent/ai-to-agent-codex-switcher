param (
    [Parameter(Position=0)]
    [ValidateSet("official", "gemini", "status")]
    [string]$Mode
)

$configDir = Join-Path $HOME ".codex"
$targetConfig = Join-Path $configDir "config.json"
$officialSrc = Join-Path $configDir "config.official.json"
$geminiSrc = Join-Path $configDir "config.gemini.json"

function Show-Help {
    Write-Host "======================================" -ForegroundColor Cyan
    Write-Host "    Codex Switcher (PowerShell)       " -ForegroundColor Cyan
    Write-Host "======================================" -ForegroundColor Cyan
    Write-Host "用法: .\codex-switch.ps1 [official | gemini | status]" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  official : 切換為官方 OpenAI 端點設定"
    Write-Host "  gemini   : 切換為本地反代 (Gemini / Antigravity) 設定"
    Write-Host "  status   : 檢查目前作用中的設定檔"
    Write-Host "======================================" -ForegroundColor Cyan
}

if (-not $Mode) {
    Show-Help
    exit
}

switch ($Mode) {
    "official" {
        if (-not (Test-Path $officialSrc)) {
            Write-Error "[錯誤] 找不到官方設定檔: $officialSrc"
            return
        }
        Copy-Item -Path $officialSrc -Destination $targetConfig -Force
        Write-Host "[✓] 已成功套用【官方 OpenAI 模式】" -ForegroundColor Green
        Write-Host "提示: 請完全重啟 Codex 客戶端以載入原生設定。" -ForegroundColor Yellow
    }
    "gemini" {
        if (-not (Test-Path $geminiSrc)) {
            Write-Error "[錯誤] 找不到 Gemini 設定檔: $geminiSrc"
            return
        }
        Copy-Item -Path $geminiSrc -Destination $targetConfig -Force
        Write-Host "[✓] 已成功套用【Gemini / 反向代理模式】" -ForegroundColor Green
        Write-Host "提示: 請確認本地反代服務已啟動，並完全重啟 Codex 客戶端。" -ForegroundColor Yellow
    }
    "status" {
        if (Test-Path $targetConfig) {
            Write-Host "[狀態] 目前使用中的設定檔: $targetConfig" -ForegroundColor Green
            Get-Content -Path $targetConfig -TotalCount 10
        } else {
            Write-Host "[狀態] 未偵測到使用中的 config.json" -ForegroundColor Red
        }
    }
}
