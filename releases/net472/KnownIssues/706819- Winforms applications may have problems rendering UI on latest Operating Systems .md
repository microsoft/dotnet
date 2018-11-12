 # Winforms application may have problems rendering application UI and instead, may render a white screen with a red ‘X’ mark across. The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2.

## Symptoms
Winforms application may have problems rendering application UI and instead, may render a white screen with a red ‘X’ mark across. The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2.
## Cause
The issue is caused by a change in Windows 10 October 2018 Update that exposed a bug in .NET Framework 4.7.2. Latest Windows 10 October 2018 Update is now adding a new flag to VisualStyle state when application UI launches a child  dialog (i.e  FileSaveDialog or PrintpreviewDialog etc) that cause .NET Framework source to fail on VisualStylestate check and thus throw an exception while rendering the UI.

## Resolution
A .NET 4.7.2 servicing fix for this will be released in near future and will also be included in the next version (4.8) of .NET Framework. This known issue will be updated with more details when that happens.