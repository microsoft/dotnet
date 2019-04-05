## svcTraceViewer ComboBox high contrast change

### Scope
Edge

### Version Introduced
4.8
### Source Analyzer Status
NotPlanned

### Change Description
In the [Microsoft Service Trace Viewer tool](~/docs/framework/wcf/service-trace-viewer-tool-svctraceviewer-exe.md), ComboBox controls were not displayed in the correct color in certain high contrast themes. The issue was fixed in .NET Framework 4.7.2. However, due to .NET Framework SDK backward compatibility requirements, the fix was not visible to customers by default. .NET 4.8 surfaces this change by adding the following [AppContext configuration switches](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) to the svcTraceViewer.exe.config file:
```xml
<AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false" />
```
- [ ] Quirked 
- [ ] Build-time break

### Recommended Action
   - How to opt out of the change
  If you don't want to have the high contrast behavior change, you can disable it by removing the following section from the svcTraceViewer.exe.config file:
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


