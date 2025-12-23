## Missing Target Framework Moniker results in 4.0 behavior

### Scope
Major

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

Applications without a
<xref:System.Runtime.Versioning.TargetFrameworkAttribute?displayProperty=name>
applied at the assembly level will automatically run using the semantics
(quirks) of the .NET Framework 4.0. To ensure high quality, it is recommended
that all binaries be explicitly attributed with a
<xref:System.Runtime.Versioning.TargetFrameworkAttribute?displayProperty=name>
indicating the version of the .NET Framework they were built with. Note that
using a target framework moniker in a project file will cause MSBuild to
automatically apply a
<xref:System.Runtime.Versioning.TargetFrameworkAttribute?displayProperty=name>.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

A <xref:System.Runtime.Versioning.TargetFrameworkAttribute?displayProperty=name>
should be supplied, either through adding the attribute directly to the assembly
or by specifying a target framework in the
[project file or through Visual Studio's project properties GUI](https://devblogs.microsoft.com/visualstudio/visual-studio-managed-multi-targeting-part-1-concepts-target-framework-moniker-target-framework/).

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 13 -->
