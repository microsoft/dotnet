## 40: Different exception handling for ObjectContext.CreateDatabase and DbProviderServices.CreateDatabase methods

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Beginning in .NET 4.5, if database creation fails, `CreateDatabase` methods will attempt to drop the empty database. If that operation succeeds, the original `SQLException` will be propagated (instead of the `InvalidOperationException` that was always thrown in .NET 4.0)

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
When catching an InvalidOperationException while executing ObjectContext.CreateDatabase or DbProviderServices.CreateDatabase, SQLExceptions should now also be caught.

### Affected APIs
* `M:System.Data.Objects.ObjectContext.CreateDatabase`
* `M:System.Data.Common.DbProviderServices.CreateDatabase(System.Data.Common.DbConnection,System.Nullable{System.Int32},System.Data.Metadata.Edm.StoreItemCollection)`

### Category
Entity Framework

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#sql)
