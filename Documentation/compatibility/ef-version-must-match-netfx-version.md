## Entity Framework version must match the .NET Framework version

### Scope
Major

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

The entity framework version should be matched with the .NET framework version.
Entity Framework 5 is recommended for .NET Framework 4.5. There are some known issues with
EF 4.x in a .NET Framework 4.5 project around
<xref:System.ComponentModel.DataAnnotations>. In .NET
4.5, these were moved to a different assembly, so there are issues determining
which annotations to use.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
Upgrade to Entity Framework 5 for .NET Framework 4.5

### Affected APIs
* Not detectable via API analysis

### Category
Entity Framework

[More information](https://forums.asp.net/t/1779042.aspx)

<!-- breaking change id: 25 -->
