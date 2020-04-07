 # WinForms applications may have problems rendering the application UI and instead may render a white screen with a red ‘X’ symbol. The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2.

## Symptoms
WinForms applications may have problems rendering the application UI and instead may render a white screen with a red ‘X’ symbol. The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2.

## Cause
The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2. The Windows 10 October 2018 Update adds a new flag to VisualStyle state when the application UI launches a child  dialog (i.e., a FileSaveDialog or PrintpreviewDialog) that causes .NET Framework to fail its VisualStyleState check and thus throw an exception while rendering the application UI.

## Resolution
A .NET 4.7.2 servicing fix [KB4481031](https://support.microsoft.com/en-us/help/4481031/january-22-2019-kb4481031) for this issue has been released and is also included in the version (4.8) of .NET Framework.
