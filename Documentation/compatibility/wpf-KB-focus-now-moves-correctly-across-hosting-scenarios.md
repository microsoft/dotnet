## Keyboard focus now moves correctly across multiple layers of WinForms/WPF hosting 

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Consider a WPF application hosting a WinForms control which in turn is hosting WPF controls. Users may not be able to tab out of the WinForms layer if the first or last control in that layer is the WPF ElementHost. This change fixes this issue, and users are now able to tab out of the WinForms layer, but automated applications that rely on focus looping inside the WinForms layer may be affected.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
A developer who wants to utilize this change while targeting a framework version below .NET 4.7.2 or a developer who requires the previous functionality while targeting .NET 4.7.2 or greater can set the following set of AppContext flags appropriately.  Values of false for all of them will result in this change being enabled.

Note that all the flags must be set appropriately.  WPF applications are required to opt in to all earlier accessibility improvements to get the later improvements. To do this, ensure that if the AppContext switch 'Switch.UseLegacyAccessibilityFeatures.N' is set to 'false', then 'Switch.UseLegacyAccessibilityFeatures' and all 'Switch.UseLegacyAccessibilityFeatures.M' switches, when M < N, evaluate to false as well. Note that, if a switch for a particular set of accessibility improvements is not present, its value is determined by the target framework version. You can remedy this by adding these switches and setting their value to false.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=false;"/>
    </runtime>
</configuration>
```

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    445603
-->


