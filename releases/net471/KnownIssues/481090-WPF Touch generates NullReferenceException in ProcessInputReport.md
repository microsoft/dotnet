## WPF Touch generates a NullReferenceException in WispLogic.ProcessInputReport

### Symptoms
WPF throws a NullReferenceException in WispLogic.ProcessInputReport and the application may crash.

### Cause
In WPF applications running on touch or stylus enabled machines, specific hardware and timing issues can cause touch messages to arrive without associated StylusDevices.  When this occurs WPF tries to access this null StylusDevice, causing the error.

### Resolution
The fix for this is expected in future servicing update for Windows 10.

### More information