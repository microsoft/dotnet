## List&lt;T&gt;.ForEach can throw exception when modifying list item

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

Beginning in .NET Framework 4.5, a
<xref:System.Collections.Generic.List`1.ForEach(System.Action{`0})>
enumerator will throw an
<xref:System.InvalidOperationException?displayProperty=name> exception if an
element in the calling collection is modified. Previously, this would not throw
an exception but could lead to race conditions.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

Ideally, code should be fixed to not modify lists while enumerating their
elements because that is never a safe operation. To revert to the previous
behavior, though, an app may target .NET Framework 4.0.

### Affected APIs
* ``M:System.Collections.Generic.List`1.ForEach(System.Action{`0})``

### Category
Core

<!-- breaking change id: 5 -->
