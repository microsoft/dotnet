## WPF FocusVisual for RadioButton and CheckBox Now Displays Correctly When The Controls Have No Content

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.7.1 and earlier versions, WPF `System.Windows.Controls.CheckBox` and `System.Windows.Controls.RadioButton` have inconsistent and, in Classic and High Contrast themes,
incorrect FocusVisuals.  These issues occur in cases where the controls do not have any content set.  This can make the transition between themes confusing and the FocusVisual hard to see.
In the .NET Framework 4.7.2, these visuals are now more consistent across themes and more easily visible in Classic and High Contrast themes.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
A developer who wants to utilize this change while targeting a framework version below .NET 4.7.2 or a developer who requires the previous functionality while targeting .NET 4.7.2 or greater 
can set the following set of AppContext flags appropriately.

Note that all the flags must be set appropriately.  WPF applications are required to opt in to all earlier accessibility improvements to get the later improvements. 
To do this, ensure that if the AppContext switch 'Switch.UseLegacyAccessibilityFeatures.N' is set to 'false', then 'Switch.UseLegacyAccessibilityFeatures' and all 
'Switch.UseLegacyAccessibilityFeatures.M' switches, when M < N, evaluate to false as well. Note that, if a switch for a particular set of accessibility improvements is not present, 
its value is determined by the target framework version. You can remedy this by adding these switches and setting their value to false.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;"/>
    </runtime>
</configuration>
```

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    447590
-->


