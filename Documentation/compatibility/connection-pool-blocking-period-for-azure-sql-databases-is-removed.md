## Connection pool blocking period for Azure SQL databases is removed

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with the .NET Framework 4.6.2, for connection open requests to known
Azure SQL databases (\*.database.windows.net, \*.database.chinacloudapi.cn,
\*.database.usgovcloudapi.net, \*.database.cloudapi.de), the connection pool
blocking period is removed, and connection open errors are not cached. Attempts
to retry connection open requests will occur almost immediately after transient
connection errors. This change allows the connection open attempt to be retried
immediately for Azure SQL databases, thereby improving the performance of cloud-
enabled apps. For all other connection attempts, the connection pool blocking
period continues to be enforced.<p/>

In the .NET Framework 4.6.1 and earlier versions, when an app encounters a
transient connection failure when connecting to a database, the connection
attempt cannot be retried quickly, because the connection pool caches the error
and re-throws it for 5 seconds to 1 minute. For more information, see
[SQL Server Connection Pooling (ADO.NET)](~/docs/framework/data/adonet/sql-server-connection-pooling.md).
This behavior is problematic for connections to Azure SQL databases, which often
fail with transient errors that are typically recovered from within a few
seconds. The connection pool blocking feature means that the app cannot connect
to the database for an extensive period, even though the database is available
and the app needs to render within a few seconds.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If this behavior is undesirable, the connection pool blocking period can be
configured by setting the <xref:System.Data.SqlClient.SqlConnectionStringBuilder.PoolBlockingPeriod?displayProperty=name>
property introduced in the .NET Framework 4.6.2. The value of the property is a
member of the
<xref:System.Data.SqlClient.PoolBlockingPeriod?displayProperty=name> enumeration
that can take either of three values:

- <xref:System.Data.SqlClient.PoolBlockingPeriod.AlwaysBlock>
- <xref:System.Data.SqlClient.PoolBlockingPeriod.Auto>
- <xref:System.Data.SqlClient.PoolBlockingPeriod.NeverBlock>

The previous behavior can be restored by setting the
<xref:System.Data.SqlClient.SqlConnectionStringBuilder.PoolBlockingPeriod?displayProperty=name>
property to <xref:System.Data.SqlClient.PoolBlockingPeriod.AlwaysBlock>.

### Affected APIs
- `M:System.Data.Common.DbConnection.OpenAsync`
- `M:System.Data.SqlClient.SqlConnection.Open`
- `M:System.Data.SqlClient.SqlConnection.OpenAsync(System.Threading.CancellationToken)`

### Category
Data

<!--
    ### Original Bug
    213479
-->

<!-- breaking change id: 160 -->
