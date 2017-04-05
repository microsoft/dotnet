## 68: DbParameter.Precision and DbParameter.Scale are now public virtual members

### Scope
Minor

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description
 DbParameter.Precision and DbParameter.Scale are implemented as public virtual properties. They replace the corresponding explicit interface implementations, DbParameter.IDbDataParameter.Precision and DbParameter.IDbDataParameter.Scale.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
When re-building an ADO.NET database provider, these differences will require the 'override' keyword to be applied to the Precision and Scale properties. This is only needed when re-building the components; exisiting binaries will continue to work.

### Affected APIs
* `P:System.Data.Common.DbParameter.Precision`
* `P:System.Data.Common.DbParameter.Scale`

### Category
ADO.NET

[More information](https://msdn.microsoft.com/en-us/library/dn458356(v=vs.110).aspx#ADO)

