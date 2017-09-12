## 195: Accessibility improvements in Windows Forms controls

### Scope
Major

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
Windows Forms Framework is improving how it works with accessibility technologies to better support Windows Forms customers. These include the following changes:
- Changes to improve display during High Contrast mode.
- Changes to improve the property browser experience. Property browser improvements include: 
  - Better keyboard navigation through the various drop-down selection windows.
  - Reduced unnecessary tab stops.
  - Better reporting of control types.
  - Improved narrator behavior.
- Changes to implement missing UI accessibility patterns in controls.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__
  
In order for the application to benefit from these changes, it must run on the .NET Framework 4.7.1 or later. The application can benefit from these changes in either of the following ways:
- It is recompiled to target the .NET Framework 4.7.1.
- It opts out of the legacy accessibility behaviors by adding the following [AppContext Switch](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the ```<runtime>``` section of the app config file and setting it to false, as the following example shows.
```
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <runtime>
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false" />
      </runtime>
    </configuration>
```
pplications that target the .NET Framework 4.7.1 or later and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to ```true```.

For an overview of UI automation, see the [UI Automation Overview](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/ui-automation-overview).

__Added support for UI Automation patterns and properties__

The .NET Framework 4.7.1 adds support for the fillowing UI automation patterns and properties:
- The `T:System.Windows.Forms.ToolStripSplitButton` and `T:System.Windows.Forms.ComboBox` controls support the [Expand/Collapse pattern](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern)
- The `T:System.Windows.Forms.ToolStripMenuItem` control supports the [ControlType](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/ui-automation-support-for-the-menubar-control-type) property value "MenuItem"
- The `T:System.Windows.Forms.ToolStripItem` controls supports the [Name](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.automationelement.nameproperty?view=netframework-4.7) property and [Expand/Collapse pattern](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern)
- [AccessibleEvents](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.accessibleevents?view=netframework-4.7) indicating StateChange and NameChange when drop down is expanded or collapsed to `T:System.Windows.Forms.ToolStripDropDownItem`
- The `T:System.Windows.Forms.ToolStripDropDownButton` control property has a ControlType property value of `F:System.Windows.Automation.ControlType.Button` 
- `T:System.Windows.Forms.DataGridViewCheckBoxCell` control supports the [Toggle Pattern](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.togglepattern?view=netframework-4.7)
 
__Improvements to PropertyBrowser control__

The .NET Framework 4.7.1 adds the following improvements to the PropertyBrowser control: 
- The __Details__ button in the error dialog that is displayed when the user enters an incorrect value in the T:System.Windows.Forms.PropertyGrid control supports the Expand/Collapse pattern, state and name change notifications, and a ControlType property with a value of "Button".
- The [AccessibleRole](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.accessiblerole?view=netframework-4.7) of rows in PropertyGrid control have changed from "Row" to "Cell". The cell maps to UIA ControlType "DataItem", which allows it to support appropriate keyboard shortcuts and Narrator announcements.
- Improved keyboard navigation between the grid and the ToolBar above it. Pressing "Shift-Tab" now selects the first ToolBar button, instead of the whole ToolBar

__Use of OS-defined colors in High Contrast themes__

- `T:System.Windows.Forms.Button` and `T:System.Windows.Forms.CheckBox` controls with `P:System.Windows.Forms.Control.FlatStyle` set to `F:System.Windows.Forms.FlatStyle.Standard`, which is the default style, now use OS-defined colors in High Contrast theme when selected. Previously, test and background colors were not contrasting and were hard to read.
- `T:System.Windows.Forms.Button`, `T:System.Windows.Forms.CheckBox`, `T:System.Windows.Forms.RadioButton`, `T:System.Windows.Forms.Label`, `T:System.Windows.Forms.LinkLabel` and `T:System.Windows.Forms.GroupBox` with`P:System.Windows.Forms.Control.Enabled` set to _false_, used a shaded color to rendered text in High Contrast themes, resulting in low contrast against the background. Now these controls use "Disabled Text" color defined by the OS. This fix applies to control with `P:System.Windows.Forms.Control.FlatStyle` set value other than `F:System.Windows.Forms.FlatStyle.System`. The latter controls are rendered by the OS.

NOTE: Windows10 has changed values for some high contrast system colors. Windows Forms Framework is based on Win32 framework. For the best experience, run on the latest version of Windows and opt in to the latest OS changes by adding an app.manifest file in a test application and uncommenting the following code:
```
    <!-- Windows 10 -->
    <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
```
__Improved keyboard navigation__

- When `T:System.Windows.Forms.ComboBox` control has `P:System.Windows.Forms.ComboBox.DropDownStyle` set to `F:System.Windows.Forms.DropDownStyle.DropDownList`, and is the first control in the TabOrder on the form, it is now displaying focus rectangle when the parent form is opened using the keyboard. Before this change, keyboard focus was on this control, but focus indicator was not rendered.

### Affected APIs
* `M:System.Windows.Forms.ToolStripDropDownButton.CreateAccessibilityInstance`
* `P:System.Windows.Forms.DomainUpDown.DomainUpDownAccessibleObject.Name`

### Category
Windows Forms

<!--
    ### Original Bug

https://devdiv.visualstudio.com/DevDiv/_workitems/edit/364507
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/366444
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/382153
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/382195
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/382373
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/386118
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/386123
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/386173
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/386221
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/386386
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/386420
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/387172
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/392706
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/394788
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/396905
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/399055
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/399067
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/399988
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/404882
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/404885
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407451
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/411616
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/411645
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/426764
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/430685
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/434763
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/436154
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/436313
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/437912
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/449452
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/457326
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/461557

-->

<!-- breaking change id: 195 -->

