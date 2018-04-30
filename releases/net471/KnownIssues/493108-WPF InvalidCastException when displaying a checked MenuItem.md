# WPF InvalidCastException when displaying a checked MenuItem

## Symptoms
WPF throws an InvalidCastException when an application displays a MenuItem,
provided the following conditions are all met:

	* The application is running on a server.
	* The MenuItem is checked (MenuItem.IsChecked = true).
	* The MenuItem is a sub-menu item (MenuItem.Role = SubmenuItem).
	* The MenuItem is a descendant of a RibbonWindow.
	* The RibbonWindow comes from the out-of-band ("toolkit") version of the WPF ribbon control library.

The InvalidCastException's message is akin to

	Unable to cast object of type 'System.Windows.Style' to type 'System.Windows.Media.Geometry'

and the callstack begins with

	at System.Windows.Shapes.Path.get_Data()
	at System.Windows.Shapes.Path.get_DefiningGeometry()
	at System.Windows.Shapes.Shape.GetNaturalSize()
	at System.Windows.Shapes.Shape.MeasureOverride()

## Cause
The exception is due to a resource key conflict between the ribbon library and the theme
file for server machines (PresentationFramework.AeroLite.dll).  Both declare resources
using the same key.  The theme file includes a DynamicResource reference intended to find
the Geometry describing the MenuItem's checkmark, but in the circumstances described above
the reference resolves to the ribbon library's resource.  This effectively sets the value
of Path.Data to an object of type Style.  The next measure pass then encounters the exception.

## Resolution
This issue is fixed for all supported OS platforms prior to Windows 10 Fall Creators Update. The fix for Windows 10 Fall Creators Update is expected in a future servicing update. 
