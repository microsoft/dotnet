## WPF Touch Stops Working After Rapid/Prolonged Use Of Popups

### Symptoms
On a touch or stylus enabled machine, WPF applications may see a loss of touch or stylus after rapid or prolonged use of Popups (e.g. ComboBoxes, DropDown Menus)

### Cause
A change to disposal of HwndSource in .NET 4.7 caused Popups to not correctly cleanup touch resources.  This eventually can lead to loss of touch/stylus interaction.

### Resolution
The fix for this is expected in future servicing update for Windows 10.

### More information