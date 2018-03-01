## Different exception handling for ObjectContext.CreateDatabase and DbProviderServices.CreateDatabase methods

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

Beginning in .NET Framework 4.5, if database creation fails, `CreateDatabase` methods will
attempt to drop the empty database. If that operation succeeds, the original
<xref:System.Data.SqlClient.SqlException?displayProperty=name> will be
propagated (instead of the <xref:System.InvalidOperationException?displayProperty=name>
that was always thrown in .NET Framework 4.0)

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
When catching an <xref:System.InvalidOperationException?displayProperty=name>
while executing <xref:System.Data.Objects.ObjectContext.CreateDatabase>
or
<xref:System.Data.Common.DbProviderServices.CreateDatabase(System.Data.Common.DbConnection,System.Nullable{System.Int32},System.Data.Metadata.Edm.StoreItemCollection)>,
SQLExceptions should now also be caught.

### Affected APIs
* `M:System.Data.Objects.ObjectContext.CreateDatabase`
* `M:System.Data.Common.DbProviderServices.CreateDatabase(System.Data.Common.DbConnection,System.Nullable{System.Int32},System.Data.Metadata.Edm.StoreItemCollection)`

### Category
Entity Framework

<!-- breaking change id: 40 -->
