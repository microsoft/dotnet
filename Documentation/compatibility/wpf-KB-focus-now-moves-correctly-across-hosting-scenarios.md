## Keyboard focus now moves correctly across multiple layers of WinForms/WPF hosting 

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Consider a WPF application hosting a WinForms control which in turn hosts WPF controls. Users may not be able to tab out of the WinForms layer if the first or last control in that layer is the WPF `System.Windows.Forms.Integration.ElementHost`. This change fixes this issue, and users are now able to tab out of the WinForms layer.

Automated applications that rely on focus never escaping the WinForms layer may no longer work as expected.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
A developer who wants to utilize this change while targeting a framework version below .NET 4.7.2 can set the following set of AppContext flags to false for the change to be enabled.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false"/>
    </runtime>
</configuration>
```

A developer who requires the previous functionality while targeting .NET 4.7.2 or greater can set the following AppContext flag to true for the change to be disabled.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures.2=true"/>
    </runtime>
</configuration>
```

Note that all the flags must be set appropriately.  WPF applications are required to opt in to all earlier accessibility improvements to get the later improvements. To do this, ensure that if the AppContext switch 'Switch.UseLegacyAccessibilityFeatures.2' is set to 'false', and that 'Switch.UseLegacyAccessibilityFeatures' evaluates to false as well. Note that, if a switch for a particular set of accessibility improvements is not present, its value is determined by the target framework version. You can remedy this by adding these switches and setting their value to false.


### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    445603
-->


