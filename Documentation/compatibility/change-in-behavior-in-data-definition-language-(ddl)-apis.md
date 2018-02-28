## Change in behavior in Data Definition Language (DDL) APIs

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
The behavior of DDL APIs when AttachDBFilename is specified has changed as follows:
* Connection strings need not specify an Initial Catalog value. Previously, both AttachDBFilename and Initial Catalog were required.
* If both AttachDBFilename and Initial Catalog are specified and the given MDF file exists, the <xref:System.Data.Objects.ObjectContext.DatabaseExists%2A> method returns `true`. Previously, it returned `false`.
* If both AttachDBFilename and Initial Catalog are specified and the given MDF file exists, calling the <xref:System.Data.Objects.ObjectContext.DeleteDatabase%2A> method deletes the files.
* If <xref:System.Data.Objects.ObjectContext.DeleteDatabase%2A> is called when the connection string specifies an AttachDBFilename value with an MDF that doesn't exist and an Initial Catalog that doesn't exist, the method throws an <xref:System.InvalidOperationException> exception. Previously, it threw a <xref:System.Data.SqlClient.SqlException> exception.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
These changes make it easier to build tools and applications that use the DDL APIs. These changes can affect application compatibility in the following scenarios:
- The user writes code that executes a `DROP DATABASE` command directly instead of calling <xref:System.Data.Objects.ObjectContext.DeleteDatabase%2A> if <xref:System.Data.Objects.ObjectContext.DatabaseExists%2A> returns `true`. This breaks existing code If the database is not attached but the MDF file exists.
- The user writes code that expects the <xref:System.Data.Objects.ObjectContext.DeleteDatabase%2A> method to throw a <xref:System.Data.SqlClient.SqlException> rather than an <xref:System.InvalidOperationException> when the Initial Catalog and MDF file don't exist.

### Affected APIs
* Not detectable via API analysis

### Category
Entity Framework

<!-- breaking change id: 27 -->
