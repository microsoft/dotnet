## List.Sort algorithm changed

### Scope
Transparent

### Version Introduced
4.5

### Source Analyzer Status
Not planned

### Change Description

Beginning in .NET Framework 4.5,
<xref:System.Collections.Generic.List`1?displayProperty=name>'s sort algorithm
has changed (to be an introspective sort instead of a quick sort).
<xref:System.Collections.Generic.List`1?displayProperty=name>'s sort has never
been stable, but this change may cause different scenarios to sort in unstable
ways. That simply means that equivalent items may sort in different orders in
subsequent calls of the API.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Because the old sort algorithm was also unstable (though in slightly different
ways), there should be no code that depends on equivalent items always sorting
in a particular order. If there are instances of code depending upon that and
being lucky with the old behavior, that code should be updated to use a comparer
that will deterministically sort the items in the desired order.

### Affected APIs
* ``M:System.Collections.Generic.List`1.Sort``
* ``M:System.Collections.Generic.List`1.Sort(System.Collections.Generic.IComparer{`0})``
* ``M:System.Collections.Generic.List`1.Sort(System.Comparison{`0})``
* ``M:System.Collections.Generic.List`1.Sort(System.Int32,System.Int32,System.Collections.Generic.IComparer{`0})``

### Category
Core

[More information](https://stackoverflow.com/questions/12461328/behaviour-of-listt-sort-in-net-4-5-changed-from-net-4-0?rq=1)

<!-- breaking change id: 54 -->
