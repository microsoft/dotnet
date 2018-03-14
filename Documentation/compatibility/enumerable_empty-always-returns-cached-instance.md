## Enumerable.Empty&lt;TResult&gt; always returns cached instance

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

Beginning in .NET Framework 4.5,
<xref:System.Linq.Enumerable.Empty``1> always
returns a cached internal instance
<xref:System.Collections.Generic.IEnumerable`1>.

Previously, <xref:System.Linq.Enumerable.Empty``1>
would cache an empty
<xref:System.Collections.Generic.IEnumerable`1> at
the time the API was called, meaning that in some conditions in which
<xref:System.Linq.Enumerable.Empty``1> was called
rapidly and concurrently, different instances of the type could be returned for
different calls to the API.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Because the previous behavior was non-deterministic, code is unlikely to depend
on it. However, in the unlikely case that empty enumerables are being compared
and expected to sometimes be unequal, explicit empty arrays should be created
(`new T[0]`) instead of using
<xref:System.Linq.Enumerable.Empty``1>.

### Affected APIs
* ```M:System.Linq.Enumerable.Empty``1```

### Category
LINQ

<!-- breaking change id: 42 -->
