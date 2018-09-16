# WPF Touch Stops Working After Rapid/Prolonged Use Of Popups

## Symptoms
On a touch or stylus-enabled machine, WPF applications may see a loss of touch or stylus after rapid or prolonged use of popups (e.g. ComboBoxes, DropDown Menus).

## Cause
A change to disposal of HwndSource in .NET 4.7 caused Popups to not correctly cleanup touch resources.  This eventually can lead to loss of touch/stylus interaction.

## Resolution
This issue is fixed for all supported OS platforms prior to Windows 10 Fall Creators Update. The fix for Windows 10 Fall Creators Update is expected in a future servicing update. 
