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
- It is recompiled to target the .NET Framework 4.7.1. These accessibility changes are enabled by default on Windows Forms applications that target the .NET Framework 4.7.1 or later.
- It opts out of the legacy accessibility behaviors by adding the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the ```<runtime>``` section of the app config file and setting it to false, as the following example shows.
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
Applications that target the .NET Framework 4.7.1 or later and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to ```true```.

For an overview of UI automation, see the [UI Automation Overview](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-overview).

__Added support for UI Automation patterns and properties__

Accessibility clients can take advantage of new WinForms accessibility functionality by using common, publicly described invocation patterns. These patterns are not WinForms-specific. For instance, accessibility clients can call the QueryInterface method on the IAccessible interface (MAAS) to obtain an IServiceProvider interface. If this interface is available, clients can use its QueryService method to request an IAccessibleEx interface. For more information, see [Using IAccessibleEx from a Client](https://msdn.microsoft.com/en-us/library/windows/desktop/dd561924(v=vs.85).aspx). Starting with the .NET Framework 4.7.1, IServiceProvider and [IAccessibleEx]( https://msdn.microsoft.com/en-us/library/windows/desktop/dd561898(v=vs.85).aspx) (where applicable) are available for WinForms accessibility objects.

The .NET Framework 4.7.1 adds support for the fillowing UI automation patterns and properties:
- The `T:System.Windows.Forms.ToolStripSplitButton` and `T:System.Windows.Forms.ComboBox` controls support the [Expand/Collapse pattern](https://docs.microsoft.com/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern)
- The `T:System.Windows.Forms.ToolStripMenuItem` control has a [ControlType](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-support-for-the-menubar-control-type) property value <xref:System.Windows.Automation.ControlType.MenuItem?displayProperty=fullName>
- The `T:System.Windows.Forms.ToolStripItem` control supports the [Name](https://docs.microsoft.com/dotnet/api/system.windows.automation.automationelement.nameproperty) property and [Expand/Collapse pattern](https://docs.microsoft.com/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern)
- The `T:System.Windows.Forms.ToolStripDropDownItem` control supports [AccessibleEvents](https://docs.microsoft.com/dotnet/api/system.windows.forms.accessibleevents) indicating StateChange and NameChange when drop down is expanded or collapsed.
- The `T:System.Windows.Forms.ToolStripDropDownButton` control has a [ControlType](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-support-for-the-menubar-control-type) property value of <xref:System.Windows.Automation.ControlType.MenuItem?displayProperty=fullName>
- The `T:System.Windows.Forms.DataGridViewCheckBoxCell` control supports the [Toggle Pattern](https://docs.microsoft.com/dotnet/api/system.windows.automation.togglepattern)
- The `T:System.Windows.Forms.NumericUpDown` and `T:System.Windows.Forms.DomainUpDown` controls support the [Name](https://docs.microsoft.com/dotnet/api/system.windows.automation.automationelement.nameproperty) and have a [ControlType](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-support-for-the-spinner-control-type) of <xref:System.Windows.Automation.ControlType.Spinner?displayProperty=fullName> and have support for the 

__Improvements to PropertyGrid control__

The .NET Framework 4.7.1 adds the following improvements to the PropertyBrowser control: 
- The __Details__ button in the error dialog that is displayed when the user enters an incorrect value in the `T:System.Windows.Forms.PropertyGrid` control supports the [Expand/Collapse pattern](https://docs.microsoft.com/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern), state and name change notifications, and a [ControlType](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-support-for-the-menubar-control-type) property with a value of <xref:System.Windows.Automation.ControlType.MenuItem?displayProperty=fullName>.
- The message pane displayed when the __Details__ button of the error dialog is now keyboard accessible and allows Narrator to announce the content of the error message.
- The [AccessibleRole](https://docs.microsoft.com/dotnet/api/system.windows.forms.accessiblerole) of rows in `T:System.Windows.Forms.PropertyGrid` control have changed from "Row" to "Cell". The cell maps to UIA ControlType "DataItem", which allows it to support appropriate keyboard shortcuts and Narrator announcements.
- The `T:System.Windows.Forms.PropertyGrid` control rows which represent header items when the has a `P:System.Windows.Forms.PropertySort` property set to `F:System.Windows.Forms.PropertySory.Categorized` have a [ControlType](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-support-for-the-menubar-control-type) property value <xref:System.Windows.Automation.ControlType.Button?displayProperty=fullName>
- The `T:System.Windows.Forms.PropertyGrid` control rows which represent header items when the has a `P:System.Windows.Forms.PropertySort` property set to `F:System.Windows.Forms.PropertySory.Categorized` support the [Expand/Collapse pattern](https://docs.microsoft.com/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern).
- Improved keyboard navigation between the grid and the toolbar above it. Pressing "Shift-Tab" now selects the first ToolBar button, instead of the whole ToolBar
- `T:System.Windows.Forms.PropertyGrid` controls displayed in High Contrast mode will now draw a focus rectangle around the toolstrip button which corresponds to the current `P:System.Windows.Forms.PropertySort` property value.
- `T:System.Windows.Forms.PropertyGrid` controls displayed in High Contrast mode and with a `P:System.Windows.Forms.PropertySort` property set to `F:System.Windows.Forms.PropertySory.Categorized` will now display the background of category headers in a highly contrasting color.
- `T:System.Windows.Forms.PropertyGrid` controls better differentiates between toolstrip items with focus and the toolstrip item which indicates the current value of the `P:System.Windows.Forms.PropertySort` property. This fix consists of a High Contrast change and a change for non-High Contrast scenarios.
- `T:System.Windows.Forms.PropertyGrid` control toolstrip items which indicates the current value of the `P:System.Windows.Forms.PropertySort` property support the [Toggle Pattern](https://docs.microsoft.com/dotnet/api/system.windows.automation.togglepattern).
- Improved Narrator support for distinguishing the selected alignment in the Alignment Picker.
- When an empty `T:System.Windows.Forms.PropertyGrid` control is displayed on a form, it will now receive focus where previously it would not.

__Use of OS-defined colors in High Contrast themes__

- `T:System.Windows.Forms.Button` and `T:System.Windows.Forms.CheckBox` controls with `P:System.Windows.Forms.Control.FlatStyle` set to `F:System.Windows.Forms.FlatStyle.Standard`, which is the default style, now use OS-defined colors in High Contrast theme when selected. Previously, text and background colors were not contrasting and were hard to read.
- `T:System.Windows.Forms.Button`, `T:System.Windows.Forms.CheckBox`, `T:System.Windows.Forms.RadioButton`, `T:System.Windows.Forms.Label`, `T:System.Windows.Forms.LinkLabel` and `T:System.Windows.Forms.GroupBox` with`P:System.Windows.Forms.Control.Enabled` set to _false_, used a shaded color to rendered text in High Contrast themes, resulting in low contrast against the background. Now these controls use "Disabled Text" color defined by the OS. This fix applies to control with `P:System.Windows.Forms.Control.FlatStyle` property set to a value other than `F:System.Windows.Forms.FlatStyle.System`. The latter controls are rendered by the OS.
- `T:System.Windows.Forms.DataGridView` now renders a visible rectangle around the content of the cell which has the current focus. Previously, this was not visible in certain High Contrast themes.
- `T:System.Windows.Forms.ToolStripMenuItem` controls with a `P:System.Windows.Forms.ToolStripItem.Enabled` property set to _false_ now use the "Disabled Text" color defined by the OS. 
- `T:System.Windows.Forms.ToolStripMenuItem` controls with a `P:System.Windows.Forms.ToolStripItem.Checked` property set to _true_ now render the associated check mark in a contrasting system color.  Previously the check mark color was not contrasting enough and not visible in High Contrast themes.


NOTE: Windows10 has changed values for some high contrast system colors. Windows Forms Framework is based on the Win32 framework. For the best experience, run on the latest version of Windows and opt in to the latest OS changes by adding an app.manifest file in a test application and uncommenting the following code:
```
    <!-- Windows 10 -->
    <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
```
__Improved keyboard navigation__

- When a `T:System.Windows.Forms.ComboBox` control has `P:System.Windows.Forms.ComboBox.DropDownStyle` set to `F:System.Windows.Forms.DropDownStyle.DropDownList` and is the first control in the tab order on the form, it now displays a focus rectangle when the parent form is opened using the keyboard. Before this change, keyboard focus was on this control, but a focus indicator was not rendered.

__Improved Narrator support__
- The `T:System.Windows.Forms.MonthCalendar` control has added support for assistive technologies to access the control, including the ability for Narrator to read the value of the control when previously it could not.
- The `T:System.Windows.Forms.CheckedListBox` control now notifies Narrator when the `P:System.Windows.Forms.CheckState` property has been changed. Previously, Narrator did not recieve notification and as a result users would not be informed that the `P:System.Windows.Forms.CheckState` had been updated.
- The `T:System.Windows.Forms.LinkLabel` control has changed the way it notifies Narrator of the text of in the control. Previously, Narrator announced this text twice and read "&" symbols as real text even though they are not visible to a user. The duplicated text was removed from the Narrator announcements, as well as unnecessary & symbols.
- The `T:System.Windows.Forms.DataGridViewCell` control types now correctly report the read-only status to Narrator and other assistive technologies.
- Narrator is now able to read the System Menu of child windows in [Multiple-Document Interface](https://docs.microsoft.com/en-us/dotnet/framework/winforms/advanced/multiple-document-interface-mdi-applications) applications.
- Narrator is now able to read `T:System.Windows.Forms.ToolStripMenuItem` controls with a `P:System.Windows.Forms.ToolStripItem.Enabled` property set to _false_. Previously, Narrator was unable to focus on disabled menu items to read hte content. 
- 


### Affected APIs not detectable via API analysis
* `M:System.Windows.Forms.ToolStripDropDownButton.CreateAccessibilityInstance`
* `P:System.Windows.Forms.DomainUpDown.DomainUpDownAccessibleObject.Name`
* `T:Sysetm.Windows.Forms.MonthCalendar.MonthCalendarAccessibleObject` 


### Category
Windows Forms

<!--
    ### Original Bug

409745
364507
366444
382153
382195
382373
386118
386123
386173
386221
386386
386420
387172
392706
394788
396905
399055
399067
399988
404882
404885
407451
411616
411645
426764
430685
434763
436154
436313
437912
449452
457326
461557

-->

<!-- breaking change id: 195 -->

