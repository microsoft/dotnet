## WPF FocusVisual for RadioButton and CheckBox Now Displays Correctly When The Controls Have No Content

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.7.1 and earlier versions, WPF <xref:System.Windows.Controls.CheckBox?displayProperty=nameWIthType> and <xref:System.Windows.Controls.RadioButton?displayProperty=nameWIthType> have inconsistent and, in Classic and High Contrast themes,
incorrect focus visuals.  These issues occur in cases where the controls do not have any content set.  This can make the transition between themes confusing and the focus visual hard to see.
In the .NET Framework 4.7.2, these visuals are now more consistent across themes and more easily visible in Classic and High Contrast themes.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
A developer targeting .NET Framework 4.7.2 that wants to revert to the behavior in .NET 4.7.1 will need to set the following AppContext flag.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures.2=true;"/>
    </runtime>
</configuration>
```

A developer who wants to utilize this change while targeting a framework version below .NET 4.7.2 must set the following AppContext flags.

Note that all the flags must be set appropriately and the installed version of the .NET Framework must be 4.7.2 or greater.  

WPF applications are required to opt in to all earlier accessibility improvements to get the latest improvements. 
To do this, ensure that both the AppContext switches 'Switch.UseLegacyAccessibilityFeatures' and 'Switch.UseLegacyAccessibilityFeatures.2' are set to false.

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


