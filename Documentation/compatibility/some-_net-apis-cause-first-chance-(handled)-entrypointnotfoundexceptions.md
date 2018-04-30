## Some .NET APIs cause first chance (handled) EntryPointNotFoundExceptions

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.5.1

### Source Analyzer Status
Available

### Change Description

In the .NET Framework 4.5, a small number of .NET methods began throwing first
chance <xref:System.EntryPointNotFoundException?displayProperty=name>s. These
exceptions were handled within the .NET Framework, but could break test
automation that did not expect the first chance exceptions. These same APIs
break some ApiVerifier scenarios when HighVersionLie is enabled.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This bug can be avoided by upgrading to .NET Framework 4.5.1. Alternatively,
test automation can be updated to not break on first-chance
<xref:System.EntryPointNotFoundException?displayProperty=name>s.

### Affected APIs
* `M:System.Diagnostics.Debug.Assert(System.Boolean)`
* `M:System.Diagnostics.Debug.Assert(System.Boolean,System.String)`
* `M:System.Diagnostics.Debug.Assert(System.Boolean,System.String,System.String)`
* `M:System.Diagnostics.Debug.Assert(System.Boolean,System.String,System.String,System.Object[])`
* `M:System.Xml.Serialization.XmlSerializer.#ctor(System.Type)`
* Investigate applicable APIs

### Category
Core

[More information](https://connect.microsoft.com/VisualStudio/feedback/details/732334/unable-to-find-an-entry-point-named-getcurrentpackageid-in-dll-kernel32-dll)

<!-- breaking change id: 85 -->
