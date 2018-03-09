## Accessibility improvements in Windows Forms controls for .NET 4.7.2

### Scope
Major

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Windows Forms Framework is improving how it works with accessibility technologies to better support Windows Forms customers. These include the following changes:
- Changes to improve display during High Contrast mode.
- Changes to improve the keyboard navigation in the DataGridView and MenuStrip controls. 
- Changes to interaction with Narrator.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__
  
In order for the application to benefit from these changes, it must run on the .NET Framework 4.7.2 or later. The application can benefit from these changes in either of the following ways:
- It is recompiled to target the .NET Framework 4.7.2. These accessibility changes are enabled by default on Windows Forms applications that target the .NET Framework 4.7.2 or later.
- It opts out of the legacy accessibility behaviors by adding the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the ```<runtime>``` section of the app config file and setting it to false, as the following example shows.
```
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <runtime>
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false" />
      </runtime>
    </configuration>
```
Applications that target the .NET Framework 4.7.2 or later and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to ```true```.

__Use of OS-defined colors in High Contrast themes__
- The drop down arrow arrow of the `T:System.Windows.Forms.ToolStripDropDownButton` now has uses now use OS-defined colors in High Contrast theme.
- `T:System.Windows.Forms.Button`, `T:System.Windows.Forms.RadioButton` and `T:System.Windows.Forms.CheckBox` controls with `P:System.Windows.Forms.Control.FlatStyle` set to <xref:System.Windows.Forms.FlatStyle.Flat?displayProperty=nameWithType> or <xref:System.Windows.Forms.FlatStyle.Popup?displayProperty=nameWithType> now use OS-defined colors in High Contrast theme when selected. Previously, text and background colors were not contrasting and were hard to read.
- Controls contained within a `System.Windows.Forms.GroupBox` which has its `P:System.Windows.Forms.Enabled` property set to _false_ will now use OS-defined colors in High Contrast theme.
- `T:System.Windows.Forms.ToolStripButton`, `T:System.Windows.Forms.ToolStripComboBox`, and `T:System.Windows.Forms.ToolStripDropDownButton` controls have an increased luminosity contrast ratio in High Contrast Mode. 
- `T:System.Windows.Forms.DataGridViewLinkColumn` will by default use OS-defined colors in High Contrast mode for the `P:System.Windows.Forms.DataGridViewLinkColumn.LinkColor` property.

NOTE: Windows 10 has changed values for some high contrast system colors. Windows Forms Framework is based on the Win32 framework. For the best experience, run on the latest version of Windows and opt in to the latest OS changes by adding an app.manifest file in a test application and uncommenting the following code:
```
    <!-- Windows 10 -->
    <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
```

__Improved Narrator support__
- Narrator will now announce the value of the `P:System.Windows.Forms.Keys.ShortcutKeys` property when announcing the text of a `T:System.Windows.Forms.ToolStripMenuItem`. 
- Narrator will now indicate when a `T:System.Windows.Forms.ToolStripMenuItem` has its `P:System.Windows.Forms.ToolStripMenuItem.Enabled` property to _false_.
- Narrator will now give feedback on the state of a check box when the `P:System.Windows.Forms.ListView.CheckBoxes` property is set to _true_.
- Narrator Scan Mode focus order is now consistent with the visual order of the controls on the ClickOnce download dialog window.

__Improved DataGridView Accessibility support__
- Rows in a `T:Systm.Windows.Forms.DataGridView` can now be sorted using the keyboard. Now a user can use the F3 key in order to sort by the current column.
- When the `P:System.Windows.Forms.DataGridView.SelectionMode` property of a `T:System.Windows.Forms.DataGridView` is set to <xref:System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect?displayProperty=nameWithType> the column header will change color to indicate the current column as the user tabs through the cells in the current row.
- The `P:System.Windows.Forms.DataGridViewCell.DataGridViewCellAccessibleObject.Parent` property of a `T:System.Windows.Forms.DataGridViewCell.DataGridViewCellAccessibleObject` now returns the correct parent control.

__Improved Visual cues__
- `T:System.Windows.Forms.RadioButton` and `T:System.Windows.Forms.CheckBox` controls with an empty Text property will now display a focus indicator when they recieve focus.

__Improved Property Grid Support__
- The `T:System.Windows.Forms.PropertyGrid` control child elements will now return a _true_ for the [IsEnabled](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.automationelement.isenabledproperty) property only when a PropertyGrid element is enabled.
- The `T:System.Windows.Forms.PropertyGrid` control child elements will now return a _false_ for the [IsReadOnly](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.valuepattern.isreadonlyproperty) property only when a PropertyGrid element can be changed by the user.

For an overview of UI automation, see the [UI Automation Overview](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-overview).


__Improved keyboard navigation__
- `T:System.Windows.Forms.ToolStripButton` now allows focus when contained within a `T:System.Windows.Forms.ToolStripPanel` which has the `P:System.Windows.Forms.TabStop` property set to _true_



### Affected APIs 



### Category
Windows Forms

<!--
    ### Original Bug
386393
426772
455890 
473866
475501
435621 
441148 
500509
504763
497774
404279
483700
484522
513314
508364
-->

<!-- breaking change id:  -->

