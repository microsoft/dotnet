# QA/CI Guidance — CreateNewEditorTab & RemoveHomescreenPanel

Summary
- Purpose: Provide evidence and a CI-friendly smoke test to assert that the Welcome action `NewFile` causes
  the application to create a new editor tab and remove the homescreen.
- Files added:
  - `Diagnostics/evidence_CreateNewEditorTab_RemoveHomescreenPanel.txt` — log excerpts showing the flow.
  - `Tools/ci/smoke_welcome_newfile.ps1` — small PowerShell smoke test script suitable for CI.

Acceptance Criteria
- When executing the smoke script, the runtime logs must contain the following sequences:
  - `CreateNewEditorTab invoked`
  - `RemoveHomescreenPanel invoked`
  - `AddNewTabWithEditor ... tabPages=1`

Run steps (developer / CI)
1. Start the app with diagnostics enabled (CI should run a headless or background app). Example:

```powershell
$env:ORACLE_DEBUG_FEATURES = 'true'
Start-Process -FilePath dotnet -ArgumentList 'run','--project','.\EnhancedOracleCodeEditor.csproj','-c','Debug' -NoNewWindow -WorkingDirectory $PWD
# Allow the app to produce logs to app_run.log (see smoke script)
```

2. Run the smoke test (this script polls the log for a short timeout):

```powershell
.\Tools\ci\smoke_welcome_newfile.ps1
```

CI integration notes
- The smoke script is intentionally small and only requires that the app writes the diagnostic
  strings to `app_run.log` (or to diagnostics logs) within a timeout. This makes it fast and robust
  for a pipeline build acceptance test.
- For stronger guarantees (UI verification), use a UI automation tool (WinAppDriver, Playwright for Desktop, or Win32 automation) to assert the editor tab exists visually.

Maintenance
- Keep the expected log strings in sync with code: `CreateNewEditorTab`, `RemoveHomescreenPanel`, and
  `AddNewTabWithEditor.*tabPages=`. If logging changes, update this report and the smoke script accordingly.
