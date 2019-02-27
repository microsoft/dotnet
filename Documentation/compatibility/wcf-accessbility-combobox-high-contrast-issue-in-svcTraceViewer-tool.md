
## [svcTraceViewer ComboBox high contrast change]

### Scope
Edge

### Version Introduced
4.8
### Source Analyzer Status
NotPlanned

### Change Description
In the Microsoft Service Trace Viewer tool, ComboBox controls were not displayed in the correct color in certain high contrast themes. The issue was fixed in 4.7.2 .NET Framework. However, due to .NET Framework SDK backward compatible requirement, it can't target 4.7.2 .NET Framework version, the fix was not visible to customer by default. An additional  fix is made in 4.8 to add the following configuration switch to svcTraceViewer.exe.config file
```xml
<AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false" />
```

### Recommended Action
   - How to opt out of change
  If customer doesn't want to have the high contrast behavior change, they can work around by removing the following section from svcTraceViewer.exe.config.
```xml
<AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false" />
```

### Affected APIs
* Not detectable via API analysis

### Category
Windows Communication Foundation (WCF)
<!--
    ### Original Bug
    Bug link goes here
-->


