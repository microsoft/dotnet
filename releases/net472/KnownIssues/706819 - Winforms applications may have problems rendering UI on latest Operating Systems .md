 # Winforms application may have problems rendering application UI and instead, may render a white screen with a red ‘X’ mark across.

## Symptoms
Winforms application may have problems rendering application UI and instead, may render a white screen with a red ‘X’ mark across.
## Cause
The issue is caused by a latest change in windows OS that exposed a bug in .NET 4.7.2 source code. Latest Windows operating system is now adding a new flag to VisualStyle state when application UI launches a child  dialog (i.e  FileSaveDialog or PrintpreviewDialog etc) that cause .NET framework source to fail on VisualStylestate check and thus throw an exception while rendering the UI.

## Resolution
A proper fix of the check for   VisualStyle state will ship in coming versions of .NET Framework. This known issue will be updated with more details when that happens.


