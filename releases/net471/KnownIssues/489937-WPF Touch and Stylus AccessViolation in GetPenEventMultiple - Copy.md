## WPF Touch/Stylus Generates AccessViolations and Heap Corruption in GetPenEventMultiple

### Symptoms
On a touch or stylus enabled machine WPF applications may sometimes corrupt memory and crash in GetPenEventMultiple.

### Cause
This is due to an eager release of a COM object that is later used in the WPF touch stack.

### Resolution
The fix for this is expected in future servicing update for Windows 10.

### More information