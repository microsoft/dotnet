## Accessibility improvements in Windows Forms controls

### Scope
Major

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
Windows Forms is improving how it works with accessibility technologies to better support Windows Forms customers. These include the following changes starting with the .NET Framework 4.7.1:
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

**How to opt in or out of these changes**</br>
  
In order for the application to benefit from these changes, it must run on the .NET Framework 4.7.1 or later. The application can benefit from these changes in either of the following ways:

- It is recompiled to target the .NET Framework 4.7.1. These accessibility changes are enabled by default on Windows Forms applications that target the .NET Framework 4.7.1 or later.

- It opts out of the legacy accessibility behaviors by adding the following [AppContext switch](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) to the `<runtime>` section of the app.config file and setting it to `false`, as the following example shows.

   ```xml
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

</br>Applications that target the .NET Framework 4.7.1 or later and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to `true`.<p/>

For an overview of UI automation, see the [UI Automation Overview](~/docs/framework/ui-automation/ui-automation-overview.md).<p/> 

**Added support for UI Automation patterns and properties**<br/>

Accessibility clients can take advantage of new WinForms accessibility functionality by using common, publicly described invocation patterns. These patterns are not WinForms-specific. For instance, accessibility clients can call the QueryInterface method on the IAccessible interface (MAAS) to obtain an IServiceProvider interface. If this interface is available, clients can use its QueryService method to request an IAccessibleEx interface. For more information, see [Using IAccessibleEx from a Client](https://docs.microsoft.com/windows/desktop/WinAuto/using-iaccessibleex-from-a-client). Starting with the .NET Framework 4.7.1, IServiceProvider and [IAccessibleEx]( https://docs.microsoft.com/windows/desktop/WinAuto/iaccessibleex) (where applicable) are available for WinForms accessibility objects.<p/>

The .NET Framework 4.7.1 adds support for the following UI automation patterns and properties:

- The <xref:System.Windows.Forms.ToolStripSplitButton> and <xref:System.Windows.Forms.ComboBox> controls support the [Expand/Collapse pattern](~/docs/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern.md).
- The <xref:System.Windows.Forms.ToolStripMenuItem> control has a [ControlType](~/docs/framework/ui-automation/ui-automation-support-for-the-menubar-control-type.md) property value <xref:System.Windows.Automation.ControlType.MenuItem?displayProperty=nameWithType>.
- The <xref:System.Windows.Forms.ToolStripItem> control supports the [Name](xref:System.Windows.Automation.AutomationElement.NameProperty) property and the[Expand/Collapse pattern](~/docs/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern.md).
- The <xref:System.Windows.Forms.ToolStripDropDownItem> control supports [AccessibleEvents](xref:System.Windows.Forms.AccessibleEvents) indicating StateChange and NameChange when drop down is expanded or collapsed.
- The <xref:System.Windows.Forms.ToolStripDropDownButton> control has a [ControlType](~/docs/framework/ui-automation/ui-automation-support-for-the-menubar-control-type.md) property value of <xref:System.Windows.Automation.ControlType.MenuItem?displayProperty=nameWithType>.
- The <xref:System.Windows.Forms.DataGridViewCheckBoxCell> control supports the [Toggle Pattern](xref:System.Windows.Automation.TogglePattern).
- The <xref:System.Windows.Forms.NumericUpDown> and <xref:System.Windows.Forms.DomainUpDown> controls support the [Name](xref:System.Windows.Automation.AutomationElement.NameProperty) property and have a [ControlType](~/docs/framework/ui-automation/ui-automation-support-for-the-spinner-control-type.md) of <xref:System.Windows.Automation.ControlType.Spinner?displayProperty=nameWithType>.</p>

**Improvements to the PropertyGrid control**</br>

The .NET Framework 4.7.1 adds the following improvements to the PropertyBrowser control: 
- The **Details** button in the error dialog that is displayed when the user enters an incorrect value in the <xref:System.Windows.Forms.PropertyGrid> control supports the [Expand/Collapse pattern](~/docs/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern.md), state and name change notifications, and a [ControlType](~/docs/framework/ui-automation/ui-automation-support-for-the-menubar-control-type.md) property with a value of <xref:System.Windows.Automation.ControlType.MenuItem?displayProperty=nameWithType>.
- The message pane displayed when the **Details** button of the error dialog is expanded is now keyboard accessible and allows Narrator to announce the content of the error message.
- The [AccessibleRole](xref:System.Windows.Forms.AccessibleRole) of rows in the <xref:System.Windows.Forms.PropertyGrid> control have changed from "Row" to "Cell". The cell maps to UIA ControlType "DataItem", which allows it to support appropriate keyboard shortcuts and Narrator announcements.
- The <xref:System.Windows.Forms.PropertyGrid> control rows that represent header items when the <xref:System.Windows.Forms.PropertyGrid> control has a <xref:System.Windows.Forms.PropertyGrid.PropertySort> property set to <xref:System.Windows.Forms.PropertySort.Categorized?displayProperty=nameWithType> have a [ControlType](~/docs/framework/ui-automation/ui-automation-support-for-the-menubar-control-type.md) property value of <xref:System.Windows.Automation.ControlType.Button?displayProperty=nameWithType>.
- The <xref:System.Windows.Forms.PropertyGrid> control rows that represent header items when the <xref:System.Windows.Forms.PropertyGrid> control has a <xref:System.Windows.Forms.PropertyGrid.PropertySort>  property set to <xref:System.Windows.Forms.PropertySort.Categorized?displayProperty=nameWithType> support the [Expand/Collapse pattern](~/docs/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern.md).
- Improved keyboard navigation between the grid and the ToolBar above it. Pressing "Shift-Tab" now selects the first ToolBar button, instead of the whole ToolBar. 
- <xref:System.Windows.Forms.PropertyGrid> controls displayed in High Contrast mode will now draw a focus rectangle around the ToolBar button which corresponds to the current <xref:System.Windows.Forms.PropertyGrid.PropertySort> property value.
- <xref:System.Windows.Forms.PropertyGrid> controls displayed in High Contrast mode and with a <xref:System.Windows.Forms.PropertyGrid.PropertySort> property set to <xref:System.Windows.Forms.PropertySort.Categorized?displayProperty=nameWithType> will now display the background of category headers in a highly contrasting color.
- <xref:System.Windows.Forms.PropertyGrid> controls better differentiates between ToolBar items with focus and the ToolBar items which indicate the current value of the <xref:System.Windows.Forms.PropertyGrid.PropertySort> property. This fix consists of a High Contrast change and a change for non-High Contrast scenarios.
- <xref:System.Windows.Forms.PropertyGrid> control ToolBar items which indicates the current value of the <xref:System.Windows.Forms.PropertyGrid.PropertySort> property support the [Toggle Pattern](xref:System.Windows.Automation.TogglePattern).
- Improved Narrator support for distinguishing the selected alignment in the Alignment Picker.
- When an empty <xref:System.Windows.Forms.PropertyGrid> control is displayed on a form, it will now receive focus where previously it would not.</p>

**Use of OS-defined colors in High Contrast themes**</br>

- The <xref:System.Windows.Forms.Button> and <xref:System.Windows.Forms.CheckBox> controls with their <xref:System.Windows.Forms.ButtonBase.FlatStyle> property set to <xref:System.Windows.Forms.FlatStyle.System?displayProperty=nameWithType>, which is the default style, now use OS-defined colors in High Contrast theme when selected. Previously, text and background colors were not contrasting and were hard to read.
- The <xref:System.Windows.Forms.Button>, <xref:System.Windows.Forms.CheckBox>, <xref:System.Windows.Forms.RadioButton>, <xref:System.Windows.Forms.Label>, <xref:System.Windows.Forms.LinkLabel>, and <xref:System.Windows.Forms.GroupBox> controls with their <xref:System.Windows.Forms.Control.Enabled> property set to **false** used a shaded color to render text in High Contrast themes, resulting in low contrast against the background. Now these controls use the "Disabled Text" color defined by the OS. This fix applies to controls with the `FlatStyle` property set to a value other than <xref:System.Windows.Forms.FlatStyle.System?displayProperty=nameWithType>. The latter controls are rendered by the OS.
- <xref:System.Windows.Forms.DataGridView> now renders a visible rectangle around the content of the cell which has the current focus. Previously, this was not visible in certain High Contrast themes.
- <xref:System.Windows.Forms.ToolStripMenuItem> controls with their <xref:System.Windows.Forms.ToolStripMenuItem.Enabled> property set to **false** now use the "Disabled Text" color defined by the OS.
- <xref:System.Windows.Forms.ToolStripMenuItem> controls with their <xref:System.Windows.Forms.ToolStripMenuItem.Checked> property set to **true** now render the associated check mark in a contrasting system color.  Previously the check mark color was not contrasting enough and not visible in High Contrast themes.


NOTE: Windows 10 has changed values for some high contrast system colors. Windows Forms Framework is based on the Win32 framework. For the best experience, run on the latest version of Windows and opt in to the latest OS changes by adding an app.manifest file in a test application and uncommenting the following code:

```xml
    <!-- Windows 10 -->
    <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
```

</br>**Improved keyboard navigation**

- When a <xref:System.Windows.Forms.ComboBox> control has its <xref:System.Windows.Forms.ComboBox.DropDownStyle> property set to <xref:System.Windows.Forms.ComboBoxStyle.DropDownList?displayProperty=nameWithType> and is the first control in the tab order on the form, it now displays a focus rectangle when the parent form is opened using the keyboard. Before this change, keyboard focus was on this control, but a focus indicator was not rendered.

**Improved Narrator support**
- The <xref:System.Windows.Forms.MonthCalendar> control has added support for assistive technologies to access the control, including the ability for Narrator to read the value of the control when previously it could not.
- The <xref:System.Windows.Forms.CheckedListBox> control now notifies Narrator when a <xref:System.Windows.Forms.CheckBox.CheckState?displayProperty=nameWithType> property has been changed. Previously, Narrator did not receive notification and as a result users would not be informed that the <xref:System.Windows.Forms.CheckBox.CheckState> property had been updated.
- The <xref:System.Windows.Forms.LinkLabel> control has changed the way it notifies Narrator of the text of in the control. Previously, Narrator announced this text twice and read "&" symbols as real text even though they are not visible to a user. The duplicated text was removed from the Narrator announcements, as well as unnecessary "&" symbols.
- The <xref:System.Windows.Forms.DataGridViewCell> control types now correctly report the read-only status to Narrator and other assistive technologies.
- Narrator is now able to read the System Menu of child windows in [Multiple-Document Interface]~/docs/framework/winforms/advanced/multiple-document-interface-mdi-applications.md) applications.
- Narrator is now able to read <xref:System.Windows.Forms.ToolStripMenuItem> controls with a <xref:System.Windows.Forms.ToolStripItem.Enabled?displayProperty=nameWithType> property set to **false**. Previously, Narrator was unable to focus on disabled menu items to read the content.

### Affected APIs
* `M:System.Windows.Forms.ToolStripDropDownButton.CreateAccessibilityInstance`
* `P:System.Windows.Forms.DomainUpDown.DomainUpDownAccessibleObject.Name`
* [MonthCalendar.AccessibilityObject](xref:System.Windows.Forms.Control.AccessibilityObject) 


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

