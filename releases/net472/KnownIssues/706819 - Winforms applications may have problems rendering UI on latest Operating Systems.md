 # WinForms applications may have problems rendering the application UI and instead may render a white screen with a red ‘X’ symbol. The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2.

## Symptoms
WinForms applications may have problems rendering the application UI and instead may render a white screen with a red ‘X’ symbol. The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2.

## Cause
The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2. The Windows 10 October 2018 Update adds a new flag to VisualStyle state when the application UI launches a child  dialog (i.e., a FileSaveDialog or PrintpreviewDialog) that causes .NET Framework to fail its VisualStyleState check and thus throw an exception while rendering the application UI.

## Resolution
A .NET 4.7.2 servicing fix for this will be released in near future and will also be included in the next version (4.8) of .NET Framework. This known issue will be updated with more details when that happens.
