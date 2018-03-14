# WPF Touch/Stylus Generates AccessViolations and Heap Corruption in GetPenEventMultiple

## Symptoms
On a touch or stylus-enabled machine, WPF applications may sometimes corrupt memory and crash in the internal function GetPenEventMultiple in the PenIMC2_v0400 DLL.

## Cause
This is due to the release of a COM object that is later used in the WPF touch stack.

## Resolution
This issue is fixed for all supported OS platforms prior to Windows 10 Fall Creators Update. The fix for Windows 10 Fall Creators Update is expected in a future servicing update. 
