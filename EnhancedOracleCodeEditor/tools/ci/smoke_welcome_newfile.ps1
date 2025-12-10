<#
Smoke test: verify Welcome "NewFile" creates a new editor tab and removes homescreen.
Usage: run from repo root. Assumes `app_run.log` is being written by the running app.
Exits 0 on success, 2 on failure.
#>

$ErrorActionPreference = 'Stop'
$logPath = Join-Path $PSScriptRoot '..\app_run.log'
$timeoutSeconds = 30

Write-Output "Smoke test: looking for CreateNewEditorTab / RemoveHomescreenPanel / tabPages=1 in $logPath"

if (-not (Test-Path $logPath)) {
    Write-Output "$logPath not found — trying repo root app_run.log"
    $alt = Join-Path (Get-Location) 'app_run.log'
    if (Test-Path $alt) { $logPath = $alt } else { Write-Error 'No app_run.log found; ensure the app is running with ORACLE_DEBUG_FEATURES=true and writing logs to app_run.log'; exit 2 }
}

$patterns = @(
    'CreateNewEditorTab invoked',
    'RemoveHomescreenPanel invoked',
    'AddNewTabWithEditor.*tabPages=1'
)

$deadline = (Get-Date).AddSeconds($timeoutSeconds)
while ((Get-Date) -lt $deadline) {
    try {
        $content = Get-Content -Path $logPath -Raw -ErrorAction Stop
    } catch {
        Start-Sleep -Seconds 1
        continue
    }

    $allFound = $true
    foreach ($p in $patterns) {
        if ($content -notmatch $p) { $allFound = $false; break }
    }

    if ($allFound) {
        Write-Output 'Smoke test passed: expected log lines detected.'
        exit 0
    }

    Start-Sleep -Seconds 1
}

Write-Error "Smoke test failed: expected log lines not found within $timeoutSeconds seconds"
exit 2
