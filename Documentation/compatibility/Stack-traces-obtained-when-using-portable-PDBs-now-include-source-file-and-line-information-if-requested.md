## Stack traces obtained when using portable PDBs now include source file and line information if requested
   
### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Starting with .NET Framework 4.7.2, stack traces obtained when using portable PDBs include source file and line information when requested. In versions prior to .NET Framework 4.7.2, source file and line information would be unavailable when using portable PDBs even if explicitly requested.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
For applications that target the .NET Framework 4.7.2, you can opt out of the source file and line information when using portable PDBs if it is not desirable by adding the following to the `<runtime>` section of your `app.config` file:

```xml
 <runtime>
   <AppContextSwitchOverrides value="Switch.System.Diagnostics.IgnorePortablePDBsInStackTraces=true" />
</runtime>
```

For applications that target earlier versions of the .NET Framework but run on the .NET Framework 4.7.2 or later, you can opt in to the source file and line information when using portable PDBs by adding the following to the `<runtime>` section of your `app.config` file:

```xml
<runtime>
   <AppContextSwitchOverrides value="Switch.System.Diagnostics.IgnorePortablePDBsInStackTraces=false" />
</runtime>
```


### Affected APIs
* `M:System.Diagnostics.StackTrace.#ctor(System.Boolean)`
* `M:System.Diagnostics.StackTrace.#ctor(System.Exception,System.Boolean)`
* `M:System.Diagnostics.StackTrace.#ctor(System.Exception,System.Int32,System.Boolean)`


### Category
Core

[More information]([https://github.com/dotnet/core/blob/master/Documentation/diagnostics/portable_pdb.md])

<!--
Bug #534785
-->


