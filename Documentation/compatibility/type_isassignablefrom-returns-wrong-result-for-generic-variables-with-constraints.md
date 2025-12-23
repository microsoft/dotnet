## Type.IsAssignableFrom returns wrong result for generic variables with constraints

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Planned

### Change Description

In the .NET Framework 4.5,
<xref:System.Type.IsAssignableFrom(System.Type)>
will incorrectly return `false` in all cases for some generic types with
constraints.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This issue was fixed in a servicing update. Update the .NET Framework
4.5, or upgrade to .NET Framework 4.5.1 or later, to fix this issue.
Alternatively, avoid using IsAssignableFrom with generic types that have
constraints on generic parameters. Reflection APIs can be used as a work-around.

### Affected APIs
* `M:System.Type.IsAssignableFrom(System.Type)`

### Category
Core

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/760270/type-isassignablefrom-for-type-parameters-is-broken)

<!--
  ### Notes
  Can be added to a single-compilation API analyzer
-->

<!-- breaking change id: 89 -->
