## MachineKey.Encode and MachineKey.Decode methods are now obsolete

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

These methods are now obsolete. Compilation of code that calls these methods
produces a compiler warning.

- [ ] Quirked
- [x] Build-time break

### Recommended Action

The recommended alternatives are
<xref:System.Web.Security.MachineKey.Protect(System.Byte[],System.String[])>
and
<xref:System.Web.Security.MachineKey.Unprotect(System.Byte[],System.String[])>.
Alternatively, the build warnings can be suppressed, or they can be avoided by
using an older compiler. The APIs are still supported.

### Affected APIs
* `M:System.Web.Security.MachineKey.Encode(System.Byte[],System.Web.Security.MachineKeyProtection)`
* `M:System.Web.Security.MachineKey.Decode(System.String,System.Web.Security.MachineKeyProtection)`

### Category
ASP.NET

<!-- breaking change id: 28 -->
