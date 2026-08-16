<#
.SYNOPSIS
    Install FlyClip extensions into the user's FlyClip extensions folder.
.DESCRIPTION
    Copies extensions from the `extensions/` directory to `%APPDATA%\flyclip\extensions`.
.EXAMPLE
    .\scripts\install.ps1
    Installs all extensions.
.EXAMPLE
    .\scripts\install.ps1 GoogleTranslate, DeepLTranslate
    Installs only the specified extensions.
#>
param(
    [string[]]$Names
)

$targetDir = "$env:APPDATA\flyclip\extensions"
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    Write-Host "[INFO] Created extensions folder: $targetDir" -ForegroundColor Cyan
}

$sourceRoot = Join-Path $PSScriptRoot "..\extensions"
if (-not (Test-Path $sourceRoot)) {
    Write-Error "[ERROR] Extensions directory not found at $sourceRoot"
    exit 1
}

$extensions = Get-ChildItem -Path $sourceRoot -Directory -Filter "*.flyclipext"

if ($Names -and $Names.Count -gt 0) {
    $extensions = $extensions | Where-Object {
        $baseName = $_.Name -replace '\.flyclipext$', ''
        $Names -contains $_.Name -or $Names -contains $baseName
    }
}

if (-not $extensions -or $extensions.Count -eq 0) {
    Write-Warning "[WARN] No matching extensions found to install."
    exit 0
}

Write-Host "========================================" -ForegroundColor Green
Write-Host " Installing FlyClip Extensions" -ForegroundColor Green
Write-Host " Target: $targetDir" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

$installedCount = 0
foreach ($ext in $extensions) {
    $dest = Join-Path $targetDir $ext.Name
    Copy-Item -Path $ext.FullName -Destination $dest -Recurse -Force
    Write-Host " [OK] Installed: $($ext.Name)" -ForegroundColor Green
    $installedCount++
}

Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host " Successfully installed $installedCount extension(s)!" -ForegroundColor Cyan
Write-Host " Tip: Restart FlyClip or open Settings -> Extensions to see and configure them." -ForegroundColor Yellow
