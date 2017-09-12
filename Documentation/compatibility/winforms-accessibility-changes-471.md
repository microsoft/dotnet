## 195: Accessibility improvements in Windows Forms controls

### Scope
Major

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
Windows Forms Framework is improving how it works with accessibility technologies to better support Windows Forms customers. Specifically, there are changes to improve display during High Contrast mode, to improve the property browser experience and to implement missing UI accessibility patterns in controls. Property Browser improvements will include better keyboard navigation though the various drop down selection windows, reduced unnecessary tab stops, better reporting of control types, and improved Narrator behavior. 

- [x] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__
  
In order for the application to benefit from these changes, it should run on the 4.7.1 version of the Framework and be either re-compiled against the 4.7.1 .Net Framework, or application should opt out from the legacy, or 4.7 and below, accessibility behaviors by setting the following [AppContext Switch](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) is a .Net compatibility mechanism.  to false. Add an app.config file to your application and add the following switch to the '<runtime/>' section:

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

If an application targets version 4.7.1 or above and has preserve the legacy accessibility behavior, please opt in into the use of legacy accessibility features explicitly by setting this AppContext switch value to *true*. 

__Added support for UI Automation patterns and properties__
- [UIA](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/ui-automation-overview) [Expand/Collapse pattern](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern) to `T:System.Windows.Forms.ToolStripSplitButton`
- UIA [ControlType](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/ui-automation-support-for-the-menubar-control-type) property value "MenuItem" to `T:System.Windows.Forms.ToolStripMenuItem`
- UIA [Name](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.automationelement.nameproperty?view=netframework-4.7) property and Expand/Collapse pattern to `T:System.Windows.Forms.ToolStripItem`
- [AccessibleEvents](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.accessibleevents?view=netframework-4.7) indicating StateChange and NameChange when drop down is expanded or collapsed to `T:System.Windows.Forms.ToolStripDropDownItem`
- UIA ControlType property value "Button" to `T:System.Windows.Forms.ToolStripDropDownButton`
- UIA [TogglePattern](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.togglepattern?view=netframework-4.7) to `T:System.Windows.Forms.DataGridViewCheckBoxCell`
- UIA Expand/Collapse pattern to `T:System.Windows.Forms.ComboBox` 
 
__Improvements to PropertyBrowser control__
- Added UIA Expand/Collapse pattern, state and name change notifications and ControlType property with value "Button" to the "Details" button in the error dialog that is displayed when the user enters incorect value in the `T:System.Windows.Forms.PropertyGrid` control 
- Changed [AccessibleRole](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.accessiblerole?view=netframework-4.7) of rows in PropertyGrid control from "Row" to "Cell", which maps to UIA ControlType "DataItem", in order to support appropriate keyboard shortcuts and Narrator announcements
- Improved keyboard navigation between the grid and the ToolBar above it. Pressing "Shift-Tab" now selects the first ToolBar button, instead of the whole ToolBar

__Ensure that OS-defined colors are used in High Contrast themes__

_Note:_ 
Windows10 had changed values for some high contrast system colors in the *Fall Creator's Update* release. Windows Forms Framework is based on Win32 framework, for he best experience, please run on the latest version of windows and opt in into the latest OS changes by adding app.manifest file in test application and uncommented following code:
```
    <!-- Windows 10 -->
    <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
```

- `T:System.Windows.Forms.Button` and `T:System.Windows.Forms.CheckBox` controls with `P:System.Windows.Forms.Control.FlatStyle` set to `F:System.Windows.Forms.FlatStyle.Standard`, which is the default style, are now using OS-defined colors in High Contrast theme in selected state. Before this change test and background colors were not contrasting and were hard to read
- `T:System.Windows.Forms.Button`, `T:System.Windows.Forms.CheckBox`, `T:System.Windows.Forms.RadioButton`, `T:System.Windows.Forms.Label`, `T:System.Windows.Forms.LinkLabel` and `T:System.Windows.Forms.GroupBox` with`P:System.Windows.Forms.Control.Enabled` set to _false_, used a shaded color to rendered text in High Contrast themes, resulting in low contrast against the background. Now these controls use "Disabled Text" color defined by the OS. This fix applies to control with `P:System.Windows.Forms.Control.FlatStyle` set value other than `F:System.Windows.Forms.FlatStyle.System`, the later controls are rendered by the OS.

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

