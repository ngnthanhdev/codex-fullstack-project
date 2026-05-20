param(
  [string]$ProjectName
)

$ErrorActionPreference = "Stop"
$TemplateDir = Resolve-Path (Join-Path $PSScriptRoot "..")

if (-not $ProjectName) {
  $ProjectName = Read-Host "Project name"
}

if (-not $ProjectName) {
  throw "Project name is required."
}

$TargetDir = Join-Path (Get-Location) $ProjectName

if (Test-Path $TargetDir) {
  throw "Target already exists: $TargetDir"
}

New-Item -ItemType Directory -Path $TargetDir | Out-Null

Get-ChildItem $TemplateDir -Force | Where-Object {
  $_.Name -notin @(".git", "node_modules", ".expo")
} | Copy-Item -Destination $TargetDir -Recurse -Force

$HasSpec = Read-Host "Do you have a requirements/spec file? (y/n)"

if ($HasSpec -eq "y" -or $HasSpec -eq "Y") {
  $SpecPath = Read-Host "Path to requirements/spec file"
  if (-not (Test-Path $SpecPath)) {
    throw "Spec file not found: $SpecPath"
  }
  Copy-Item $SpecPath (Join-Path $TargetDir "docs/SPECIFICATIONS.md") -Force
  "# Project Brief`n`nGenerated from: $SpecPath`n`nRead docs/SPECIFICATIONS.md for full requirements." |
    Set-Content (Join-Path $TargetDir "docs/BRIEF.md")
} else {
  $Brief = Read-Host "Short project brief"
  "# Project Brief`n`n$Brief" | Set-Content (Join-Path $TargetDir "docs/BRIEF.md")
}

Push-Location $TargetDir
git init
git branch -M main
Pop-Location

Write-Host ""
Write-Host "Project created: $TargetDir"
Write-Host "Next: open this folder in Codex IDE and ask Codex to read AGENTS.md."
