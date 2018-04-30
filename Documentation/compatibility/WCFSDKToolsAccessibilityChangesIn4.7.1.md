## Improved accessibility for some .NET SDK tools

### Scope
Edge

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description

In the .NET Framework SDK 4.7.1, the SvcConfigEditor.exe and SvcTraceViewer.exe tools have been improved by fixing varied accessibility issues. Most of these were small issues like a name not being defined or certain UI automation patterns not being implemented correctly. While many users wouldn’t be aware of these incorrect values, customers who use assistive technologies like screen readers will find these SDK tools more accessible. Certainly, these fixes change some previous behaviors, like keyboard focus order.

In order to get all the accessibility fixes in these tools, you can the following to your app.config file:
```xml
<runtime>
  <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false"/>
</runtime>
```

- [x] Quirked
- [ ] Build-time break

### Affected APIs
* Not detectable via API analysis

### Category
Windows Communication Foundation (WCF)

<!--
    ### Original Bug
    [492954] (https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=492954)
-->
