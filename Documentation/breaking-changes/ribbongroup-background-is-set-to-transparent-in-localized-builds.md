## 175: RibbonGroup background is set to transparent in localized builds

### Scope
Edge

### Version Introduced
4.6.2

### Version Reverted
4.7

### Source Analyzer Status
NotPlanned

### Change Description
RibbonGroup background on localized builds was always painted with Transparent brush, resulting in poor UI experience. This is fixed in .NET 4.7 WPF fix by updating the localized resources for RibbonGroup, which in turn ensures that the correct brush is selected. 

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Upgrade to .NET 4.7

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
### Original Bug
266592
-->