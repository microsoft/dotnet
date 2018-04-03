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

WPF applications must opt in to all early accessibility improvements to get the later improvements. In other words, both the `Switch.UseLegacyAccessibilityFeatures` and the `Switch.UseLegacyAccessibilityFeatures.2` switches must be set

A developer who requires the previous functionality while targeting .NET 4.7.2 or greater can set the following AppContext flag to true for the change to be disabled.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures.2=true"/>
    </runtime>
</configuration>
```

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    445603
-->


