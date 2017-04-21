## Assemblies compiled with Regex.CompileToAssembly breaks between 4.0 and 4.5

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
If an assembly of compiled regular expressions is built with the .NET Framework 4.5 but targets the .NET Framework 4, attempting to use one of the regular expressions in that assembly on a system with .NET Framework 4 installed throws an exception.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
To work around this problem, you can do either of the following:

- Build the assembly that contains the regular expressions with the .NET Framework 4.
- Use an interpreted regular expression.

### Affected APIs
* `M:System.Text.RegularExpressions.Regex.CompileToAssembly(System.Text.RegularExpressions.RegexCompilationInfo[],System.Reflection.AssemblyName)`
* `M:System.Text.RegularExpressions.Regex.CompileToAssembly(System.Text.RegularExpressions.RegexCompilationInfo[],System.Reflection.AssemblyName,System.Reflection.Emit.CustomAttributeBuilder[])`
* `M:System.Text.RegularExpressions.Regex.CompileToAssembly(System.Text.RegularExpressions.RegexCompilationInfo[],System.Reflection.AssemblyName,System.Reflection.Emit.CustomAttributeBuilder[],System.String)`

### Category
Core

<!-- breaking change id: 74 -->
