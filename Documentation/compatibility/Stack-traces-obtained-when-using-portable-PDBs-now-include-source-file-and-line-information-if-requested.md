## Stack traces obtained when using portable PDBs now include source file and line information if requested
   
### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Stack traces obtained when using portable PDBs will now include source file and line information when requested. In versions prior to 4.7.2 source file and line information would be unavailable when using portable PDBs even if explicitly requested.

- [x] Quirked // Uses some mechanism to turn the feature on or off, usually using runtime targeting, AppContext or config files. Needs to be turned on automatically for some situations.
- [ ] Build-time break // Causes a break if attempted to recompile

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
* `M:System.Diagnostics.StrackTrace.#ctor(System.Boolean)`
* `M:System.Diagnostics.StrackTrace.#ctor(System.Exception, System.Boolean)`
* `M:System.Diagnostics.StrackTrace.#ctor(System.Exception, System.Int32, System.Boolean)`


### Category
Core

[More information]([https://github.com/dotnet/core/blob/master/Documentation/diagnostics/portable_pdb.md])

<!--
Bug #534785
-->


