<#
.SYNOPSIS
    Pack one or more `.flyclipext` folders into standalone `.flyclipextz` archive packages.
.EXAMPLE
    .\scripts\pack.ps1
    Packs all extensions in `extensions/` into `dist/`.
#>
param(
    [string[]]$Names,
    [string]$OutputDir = (Join-Path $PSScriptRoot "..\dist")
)

Add-Type -AssemblyName System.IO.Compression.FileSystem

if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

$sourceRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\extensions")).Path
$extensions = Get-ChildItem -Path $sourceRoot -Directory -Filter "*.flyclipext"

if ($Names -and $Names.Count -gt 0) {
    $extensions = $extensions | Where-Object {
        $baseName = $_.Name -replace '\.flyclipext$', ''
        $Names -contains $_.Name -or $Names -contains $baseName
    }
}

Write-Host "Packing extensions into $OutputDir..." -ForegroundColor Cyan
$count = 0
foreach ($ext in $extensions) {
    $baseName = $ext.Name -replace '\.flyclipext$', ''
    $zipPath = Join-Path $OutputDir "$baseName.flyclipextz"
    if (Test-Path $zipPath) {
        Remove-Item $zipPath -Force
    }
    [System.IO.Compression.ZipFile]::CreateFromDirectory(
        $ext.FullName,
        $zipPath,
        [System.IO.Compression.CompressionLevel]::Optimal,
        $false
    )
    Write-Host " [PACKED] $($ext.Name) -> $baseName.flyclipextz" -ForegroundColor Green
    $count++
}

Write-Host "Done! Successfully packed $count packages into $OutputDir" -ForegroundColor Green
