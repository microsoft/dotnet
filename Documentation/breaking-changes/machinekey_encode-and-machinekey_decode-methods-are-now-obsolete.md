## 28: MachineKey.Encode and MachineKey.Decode methods are now obsolete

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
These methods are now obsolete. Compilation of code that calls these methods produces a compiler warning.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
The recommended alternatives are [MachineKey.Protect](https://msdn.microsoft.com/en-us/library/system.web.security.machinekey.protect(v=vs.110).aspx) and [MachineKey.Unprotect](https://msdn.microsoft.com/en-us/library/system.web.security.machinekey.unprotect(v=vs.110).aspx). Alternatively, the build warnings can be suppressed or they can be avoided by using an older compiler. The APIs are still supported.

### Affected APIs
* `M:System.Web.Security.MachineKey.Encode(System.Byte[],System.Web.Security.MachineKeyProtection)`
* `M:System.Web.Security.MachineKey.Decode(System.String,System.Web.Security.MachineKeyProtection)`

### Category
ASP.NET

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#asp)
