## 27: Change in behavior in Data Definition Language (DDL) APIs

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
The behavior of DDL APIs when AttachDBFilename is specified has changed as follows: 
* Connection strings need not specify an Initial Catalog value. Previously, both AttatchDBFilename and Initial Catalog were required.
* If both AttatchDBFilename and Initial Catalog are specified and the given MDF file exists, the ObjectContext.DatabaseExists method returns true. Previously, it returned false.
* If both AttatchDBFilename and Initial Catalog are specified and the given MDF file exists, calling the ObjectContext.DeleteDatabase method deletes the files.
* If ObjectContext.DeleteDatabase is called when the connection string specifies an AttachDBFilename value with an MDF that doesn't exist and an Initial Catalog that doesn't exist, the method throws an InvalidOperationException exception. Previously, it threw a SqlException exception.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
These changes make it easier to build tools and applications that use the DDL APIs. These changes can affect application compatibility in the following scenarios:
- The user writes code that executes a DROP DATABASE command directly instead of calling ObjectContext.DeleteDatabase if ObjectContext.DatabaseExists returns true. This breaks existing code If the database is not attached but the MDF file exists. 
- The user writes code that expects the ObjectContext.DeleteDatabase method to throw a SqlException exception rather than an InvalidOperationException exception when the Initial Catalog and MDF file don't exist.

### Affected APIs
* Not detectable via API analysis

### Category
Entity Framework

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#sql)
