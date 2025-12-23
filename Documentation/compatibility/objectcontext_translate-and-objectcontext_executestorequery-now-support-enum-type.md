## ObjectContext.Translate and ObjectContext.ExecuteStoreQuery now support enum type

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
In .NET Framework 4.0, the generic parameter `T` of `ObjectContext.Translate` and `ObjectContext.ExecuteStoreQuery` methods could not be an enum. That scenario is now supported.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If Translate or ExecuteStoreQuery was called on an enum type in .NET Framework 4.0, '0' was returned. If that behavior was desirable, the calls should be replaced with a constant 0 (or the enum equivalent of it).

### Affected APIs
* ```M:System.Data.Objects.ObjectContext.Translate``1(System.Data.Common.DbDataReader)```
* ```M:System.Data.Objects.ObjectContext.Translate``1(System.Data.Common.DbDataReader,System.String,System.Data.Objects.MergeOption)```
* ``M:System.Data.Objects.ObjectContext.ExecuteStoreQuery``1(System.String,System.Object[])```
* ```M:System.Data.Objects.ObjectContext.ExecuteStoreQuery``1(System.String,System.String,System.Data.Objects.MergeOption,System.Object[])```

### Category
Entity Framework

<!-- breaking change id: 41 -->
