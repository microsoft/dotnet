## ObsoleteAttribute exports as both ObsoleteAttribute and DeprecatedAttribute in WinMD scenarios

### Scope
Edge

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description

When you create a Windows Metadata library (.winmd file), the
<xref:System.ObsoleteAttribute?displayProperty=name> attribute is exported as
both <xref:System.ObsoleteAttribute?displayProperty=name> and
[Windows.Foundation.DeprecatedAttribute](https://docs.microsoft.com/uwp/api/windows.foundation.metadata.deprecatedattribute).

- [ ] Quirked
- [x] Build-time break

### Recommended Action

Recompilation of existing source code that uses the
<xref:System.ObsoleteAttribute?displayProperty=name> attribute may generate
warnings when consuming that code from C++/CX or JavaScript.

We do not recommend applying both
<xref:System.ObsoleteAttribute?displayProperty=name> and
[Windows.Foundation.DeprecatedAttribute](https://docs.microsoft.com/uwp/api/windows.foundation.metadata.deprecatedattribute) to code in managed assemblies; it may
result in build warnings.

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 48 -->
