## 195: Accessibility improvements in WPF

### Scope
Major

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
__High Contrast improvements__

- Focus for expander was not visible.  This is now fixed.
- The text in CheckBox and RadioButton is difficult to see when selected.  This issue is now fixed.
- The border of a disabled ComboBox is now the same color as the disabled text.
- Disabled and focused buttons used the incorrect theme color.  This is now fixed.
- Setting a ComboBox’s style to Toolbar.ComboBoxStyleKey caused the dropdown button to be invisible.  This is now fixed.
- The sort indicator arrow in DataGrid used the incorrect theme colors, making it confusing.  This is now fixed.
- The default hyperlink style changed to incorrect color on mouse over in high contrast themes.  This is now fixed.
- Keyboard focus on radio buttons in high contrast themes is not visible.  This is now fixed.
- DataGrid checkbox column does not use the expected colors for keyboard focus feedback.  This is now fixed.
- Keyboard focus visuals are not visible on ComboBoxes and ListBoxes in high constrast themes.  This is now fixed.


__Screen reader interaction improvements__

- Expanders were announced by screen readers as buttons, they are now correctly announced as groups (expand/collapse).
- DataGridCells were announced by screen readers as “custom”, they are now correctly announced as data grid cell (localized)
- Screen readers wouldn’t announce the name of an editable ComboBox, this issue is now fixed.
- PasswordBoxes were announced as “no item in view” or had otherwise incorrect behavior, this issue is now fixed.


__LiveRegion support__

Screen readers such as Narrator help people know the UI contents of an application, usually by describing something about the UI that’s currently focused, as that is probably the element of most interest to the user at any given moment. However, if a UI element changes somewhere in the screen and it is not being focused at that point in time, the user may not be informed, and so they may be missing important information.
LiveRegions are meant to solve this problem, a developer can use them to inform the screen reader, or any other UIAutomation client, that an important change has been made to a UI element, the screen reader can then make decisions of its own as to how and when to inform the user of this change.
The LiveSetting property also lets the screen reader how important it is to inform the user of the change made to the UI.


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

### Affected APIs not detectable via API analysis
* `F:System.windows.Automation.AutomationElementIdentifiers.LiveSettingProperty`
* `F:System.windows.Automation.AutomationElementIdentifiers.LiveRegionChangedEvent` 
* `F:System.Windows.Automation.AutomationProperties.LiveSetting`
* `M:System.Windows.Automation.AutomationProperties.SetLiveSetting` 
* `M:System.Windows.Automation.AutomationProperties.GetLiveSetting`  
* `M:System.Windows.Automation.Peers.AutomationPeer.GetLiveSettingCore` 
* `T:System.Windows.Automation.AutomationLiveSetting` 


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
