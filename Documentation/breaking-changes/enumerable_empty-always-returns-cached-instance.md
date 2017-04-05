## 42: Enumerable.Empty&lt;TResult&gt; always returns cached instance

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Beginning in .NET 4.5, `Enumerable.Empty` always returns a cached internal instance `IEnumerable<T>`. 

Previously, `Enumerable.Empty` would cache an empty `IEnumerable<T>` at the time the API was called, meaning that in some conditions in which `Enumerable.Empty` was called rapidly and concurrently, different instances of the type could be returned for different calls to the API.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Because the previous behavior was non-deterministic, code is unlikely to depend on it. However, in the unlikely case that empty enumerables are being compared and expected to sometimes be unequal, explicit empty arrays should be created (`new T[0]`) instead of using `Enumerable.Empty`.

### Affected APIs
* ```M:System.Linq.Enumerable.Empty``1```

### Category
LINQ

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#sql)
