## WPF Touch/Stylus Generates AccessViolations and Heap Corruption in GetPenEventMultiple

### Symptoms
On a touch or stylus-enabled machine, WPF applications may sometimes corrupt memory and crash in the internal function GetPenEventMultiple in the PenIMC2_v0400 DLL.

### Cause
This is due to the release of a COM object that is later used in the WPF touch stack.

### Resolution
The fix for this is expected in future servicing update for Windows 10.

### More information