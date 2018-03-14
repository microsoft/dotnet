## Linq to EF Join throws ArgumentOutOfRangeException

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Not planned

### Change Description

Linq queries or enumerables that call 'Join' on Entity Framework entities can
cause an <xref:System.ArgumentOutOfRangeException?displayProperty=name>  in .NET
Framework 4.5

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This issue was fixed in a servicing update. Update the .NET Framework
4.5, or upgrade to .NET Framework 4.5.1 or later, to fix this issue.

### Affected APIs
* ```M:System.Linq.Enumerable.Join``4(System.Collections.Generic.IEnumerable{``0},System.Collections.Generic.IEnumerable{``1},System.Func{``0,``2},System.Func{``1,``2},System.Func{``0,``1,``3})```
* ```M:System.Linq.Enumerable.Join``4(System.Collections.Generic.IEnumerable{``0},System.Collections.Generic.IEnumerable{``1},System.Func{``0,``2},System.Func{``1,``2},System.Func{``0,``1,``3},System.Collections.Generic.IEqualityComparer{``2})```
* ```M:System.Linq.ParallelEnumerable.Join``4(System.Linq.ParallelQuery{``0},System.Collections.Generic.IEnumerable{``1},System.Func{``0,``2},System.Func{``1,``2},System.Func{``0,``1,``3})```
* ```M:System.Linq.ParallelEnumerable.Join``4(System.Linq.ParallelQuery{``0},System.Collections.Generic.IEnumerable{``1},System.Func{``0,``2},System.Func{``1,``2},System.Func{``0,``1,``3},System.Collections.Generic.IEqualityComparer{``2})```
* ```M:System.Linq.ParallelEnumerable.Join``4(System.Linq.ParallelQuery{``0},System.Linq.ParallelQuery{``1},System.Func{``0,``2},System.Func{``1,``2},System.Func{``0,``1,``3})```
* ```M:System.Linq.ParallelEnumerable.Join``4(System.Linq.ParallelQuery{``0},System.Linq.ParallelQuery{``1},System.Func{``0,``2},System.Func{``1,``2},System.Func{``0,``1,``3},System.Collections.Generic.IEqualityComparer{``2})```
* ```M:System.Linq.Queryable.Join``4(System.Linq.IQueryable{``0},System.Collections.Generic.IEnumerable{``1},System.Linq.Expressions.Expression{System.Func{``0,``2}},System.Linq.Expressions.Expression{System.Func{``1,``2}},System.Linq.Expressions.Expression{System.Func{``0,``1,``3}})```
* ```M:System.Linq.Queryable.Join``4(System.Linq.IQueryable{``0},System.Collections.Generic.IEnumerable{``1},System.Linq.Expressions.Expression{System.Func{``0,``2}},System.Linq.Expressions.Expression{System.Func{``1,``2}},System.Linq.Expressions.Expression{System.Func{``0,``1,``3}},System.Collections.Generic.IEqualityComparer{``2})```

### Category
LINQ

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/763986/linq-to-ef-join-throws-index-was-out-of-range-after-upgrade-from-vs2010-to-vs2012)

<!-- breaking change id: 93 -->
