## AppDomainSetup.DynamicBase is no longer randomized by UseRandomizedStringHashAlgorithm

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Planned

### Change Description

Prior to the .NET Framework 4.6, the value of
<xref:System.AppDomainSetup.DynamicBase> would be
randomized between application domains, or between processes, if
UseRandomizedStringHashAlgorithm was enabled in the app's config file. Beginning
in the .NET Framework 4.6,
<xref:System.AppDomainSetup.DynamicBase> will
return a stable result between different instances of an app running, and
between different app domains. Dynamic bases will still differ for different
apps; this change only removes the random naming element for different instances
of the same app.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Be aware that enabling `UseRandomizedStringHashAlgorithm` will not result in
<xref:System.AppDomainSetup.DynamicBase> being
randomized. If a random base is needed, it must be produced in your app's code
rather than via this API.

### Affected APIs
* `P:System.AppDomainSetup.DynamicBase`

### Category
Core

<!--
    ### Notes
    Should be easy to look for DynamicBase use while UseRandomizedStringHashAlgorithm is set
-->

<!-- breaking change id: 115 -->
