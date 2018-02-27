## Accessibility improvements in WPF

### Scope
Major

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
__High Contrast improvements__

- The focus for the <xref:System.Windows.Controls.Expander> control is now visible. In previous versions of the .NET Framework, it was not.
- The text in <xref:System.Windows.Controls.CheckBox> and <xref:System.Windows.Controls.RadioButton> controls when they are selected is now easier to see than in previous .NET Framework versions.
- The border of a disabled <xref:System.Windows.Controls.ComboBox> is now the same color as the disabled text. In previous versions of the .NET Framework, it was not.
- Disabled and focused buttons now use the correct theme color. In previous versions of the .NET Framework, they did not.
- The dropdown button is now visible when a <xref:System.Windows.Controls.ComboBox> control's style is set to <xref:System.Windows.Controls.ToolBar.ComboBoxStyleKey?displayProperty=nameWithType>, In previous versions of the .NET Framework, it was not.
- The sort indicator arrow in a <xref:System.Windows.Controls.DataGrid> control now uses theme colors. In previous versions of the .NET Framework, it did not.
- The default hyperlink style now changes to the correct theme color on mouse over. In previous versions of the .NET Framework, it did not.
- The Keyboard focus on radio buttons is now visible. In previous versions of the .NET Framework, it was not.
- The <xref:System.Windows.Controls.DataGrid> control's checkbox column now uses the expected colors for keyboard focus feedback. In previous versions of the .NET Framework, it did not.
- the Keyboard focus visuals are now visible on <xref:System.Windows.Controls.ComboBox> and <xref:System.Windows.Controls.ListBox>. In previous versions of the .NET Framework, it was not.


__Screen reader interaction improvements__

- <xref:System.Windows.Controls.Expander> controls are now correctly announced as groups (expand/collapse) by screen readers.
- <xref:System.Windows.Controls.DataGridCell> controls are now correctly announced as data grid cell (localized) by screen readers.
- Screen readers will now announce the name of an editable <xref:System.Windows.Controls.ComboBox>.
- <xref:System.Windows.Controls.PasswordBox> controls are no longer announced as "no item in view" by screen readers.


__LiveRegion support__   

Screen readers such as Narrator help people know the UI contents of an application, usually by describing something about the UI that's currently focused, because that is probably the element of most interest to the user. However, if a UI element changes somewhere in the screen and it does not have the focus, the user may not be informed and miss important information.
LiveRegions are meant to solve this problem. A developer can use them to inform the screen reader or any other [UI Automation][UI Automation Overview](https://docs.microsoft.com/dotnet/framework/ui-automation/ui-automation-overview) client that an important change has been made to a UI element. The screen reader can then decide how and when to inform the user of this change.
The LiveSetting property also lets the screen reader know how important it is to inform the user of the change made to the UI.


- [x] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__

In order for the application to benefit from these changes, it must run on the .NET Framework 4.7.1 or later. The application can benefit from these changes in either of the following ways:
- It is recompiled to target the .NET Framework 4.7.1. These accessibility changes are enabled by default on WPF applications that target the .NET Framework 4.7.1 or later.
- It opts out of the legacy accessibility behaviors by adding the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) in the `<runtime>` section of the app config file and setting it to false, as the following example shows.
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

### Affected APIs
* `F:System.Windows.Automation.AutomationElementIdentifiers.LiveSettingProperty`
* `F:System.Windows.Automation.AutomationElementIdentifiers.LiveRegionChangedEvent`
* `T:System.Windows.Automation.AutomationLiveSetting`
* `F:System.Windows.Automation.AutomationProperties.LiveSettingProperty`
* `M:System.Windows.Automation.AutomationProperties.SetLiveSetting(System.Windows.DependencyObject,System.Windows.Automation.AutomationLiveSetting)`
* `M:System.Windows.Automation.AutomationProperties.GetLiveSetting(System.Windows.DependencyObject)`
* `M:System.Windows.Automation.Peers.AutomationPeer.GetLiveSettingCore`



### Category
WPF

<!--
    ### Original Bug
401856
431603
447592
437426
437425
437424
447486
443935
437421
436104
430176

429415
453792
404634
446435
386494
-->

<!-- breaking change id: 195 -->
