## DbParameter.Precision and DbParameter.Scale are now public virtual members

### Scope
Minor

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description

<xref:System.Data.Common.DbParameter.Precision> and <xref:System.Data.Common.DbParameter.Scale>
are implemented as public virtual properties. They replace the corresponding
explicit interface implementations,
<xref:System.Data.Common.DbParameter.System#Data#IDbDataParameter#Precision> and
<xref:System.Data.Common.DbParameter.System#Data#IDbDataParameter#Scale>.

- [ ] Quirked
- [x] Build-time break

### Recommended Action

When re-building an ADO.NET database provider, these differences will require
the 'override' keyword to be applied to the Precision and Scale properties. This
is only needed when re-building the components; existing binaries will continue
to work.

### Affected APIs
* `P:System.Data.Common.DbParameter.Precision`
* `P:System.Data.Common.DbParameter.Scale`

### Category
ADO.NET

<!-- breaking change id: 68 -->
