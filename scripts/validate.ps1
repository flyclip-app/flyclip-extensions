<#
.SYNOPSIS
    Validate all extensions in `extensions/` using FlyClip's parser and compiler.
#>
param()

$extRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\extensions")).Path
$flyclipRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\flyclip")).Path

Write-Host "Validating extensions in $extRoot using FlyClip engine..." -ForegroundColor Cyan

cargo run --manifest-path "$flyclipRoot\Cargo.toml" -p flyclip-ext --example corpus $extRoot
