Title: CreateNewEditorTab and RemoveHomescreenPanel Evidence

Summary
-------
The investigation confirms that `CreateNewEditorTab` runs, `RemoveHomescreenPanel` is invoked, and a new editor tab is created (observed `tabPages=1`). The following QA/CI report collects the exact file paths, timestamps, and suggested assertions to add to smoke tests.

Evidence
--------
- magnetic_debug.log
  - File path: `tools/diagnostics_20251203_190811/logs/magnetic_debug.log`
  - Key timestamps / lines:
    - `2025-12-03T09:33:20.2826447-06:00 | CreateNewEditorTab invoked: title=(null), filePath=(null)`
    - `2025-12-03T09:33:20.2859285-06:00 | MagneticGrid.SuppressDisplay set to False`
    - `2025-12-03T09:33:20.2971516-06:00 | ShowAttachedTextEditor: adding editor panel`
    - Additional context: multiple `UpdateTaskBar` and `AttachedPanel` lines showing the panel being added and visible.

- oracle_debug.log
  - File path: `tools/diagnostics_20251203_190811/logs/oracle_debug.log`
  - Key timestamps / lines (excerpt):
    - `CreateNewEditorTab invoked: title=(null), filePath=(null)`
    - `AddNewTabWithEditor: title= filePath=(null)`
    - `Creating tab: (untitled)` → `TabPage added: Untitled 1`
    - `AddNewTabWithEditor: created tab idx=0, tabPages=1`
    - These show the tab creation flow completed successfully.

- startup_progress.txt
  - File path: `tools/diagnostics_20251203_190811/logs/startup_progress.txt`
  - Key timestamps / lines:
    - `2025-12-03T18:15:21.1875697-06:00 - Homescreen repro: invoking ShowWelcomePanelNow (1)`
    - `2025-12-03T18:15:22.3970726-06:00 - Homescreen repro: invoking RemoveHomescreenPanel via magneticGrid`
    - `2025-12-03T18:15:23.2022605-06:00 - Homescreen repro: re-invoking ShowWelcomePanelNow (2)`
    - These show the startup repro invoked the homescreen removal.

Suggested Assertions for CI / Smoke Test
--------------------------------------
Add one or more of the following checks to your smoke test harness (ordered by robustness):

1. Log-based assertions (fast, non-invasive):
   - Assert that the runtime log (console or file) contains the literal `CreateNewEditorTab invoked` within N seconds of starting with the welcome injection.
   - Assert that the same log contains `AddNewTabWithEditor` and `created tab idx=0, tabPages=1`.
   - Assert that startup logs contain `Homescreen repro: invoking RemoveHomescreenPanel` (or `RemoveHomescreenPanel` traces) for the repro path.

   Example (pseudo):
   - Assert( TailLog(app_run.log, timeout=10s).contains("CreateNewEditorTab invoked"))
   - Assert( TailLog(app_run.log).contains("tabPages=1"))

2. File-based assertions (if diagnostics files are written):
   - After triggering `Diagnostics/welcome_inject.txt` with `NewFile`, wait up to X seconds and assert `tools/diagnostics_*/logs/oracle_debug.log` contains `CreateNewEditorTab invoked` with a recent timestamp.

3. UI-based assertions (most robust):
   - Launch the app in an automated interactive session (UI test runner or WinAppDriver), then check that the homescreen control (the homescreen panel control) is no longer present or is hidden and that a new editor tab with title `Untitled 1` exists and is focused.

Suggested CI steps to add to your smoke pipeline
------------------------------------------------
- Step 1: Build (existing `dotnet build`).
- Step 2: Start the app with env `ORACLE_DEBUG_FEATURES=true` and tee console to `app_run.log`.
  - Example command (PowerShell):
    ```powershell
    $env:ORACLE_DEBUG_FEATURES='true'
    Start-Process powershell -ArgumentList '-NoProfile','-NoExit','-Command','& { $env:ORACLE_DEBUG_FEATURES="true"; dotnet "<path-to-dll>" 2>&1 | Tee-Object -FilePath "app_run.log" }' -Wait
    ```
- Step 3: Inject `Diagnostics/welcome_inject.txt` containing `NewFile`.
- Step 4: Tail `app_run.log` and assert the strings listed in "Suggested Assertions".
- Step 5 (optional): If UI runner is available, open GUI and assert homescreen panel hidden and editor tab exists.

Commit message suggestion
-------------------------
- "Add QA evidence + CI assertions recommendations for CreateNewEditorTab / RemoveHomescreenPanel smoke test"

Draft PR title suggestion
------------------------
- "chore(ci): add evidence and suggested smoke assertions for New File welcome flow"

Notes & caveats
---------------
- The logs used in this report are from `tools/diagnostics_20251203_190811`. If diagnostics roll or are generated per run, adjust the path pattern or produce a run-specific diagnostics snapshot as part of CI.
- If console output differs when the app runs in GUI vs. background, prefer tee'ing the visible run to `app_run.log` in CI so you always capture the same output.

Prepared by: assistant (on behalf of investigation)

