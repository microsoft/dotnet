## ADO.NET now attempts to automatically reconnect broken SQL connections

### Scope
Edge

### Version Introduced
4.5.1

### Source Analyzer Status
Planned

### Change Description

Beginning in the .NET Framework 4.5.1, the .NET Framework will attempt to
automatically reconnect broken SQL connections. Although this will typically
make apps more reliable, there are edge cases in which an app needs to know that
the connection was lost so that it can take some action upon reconnection.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If this feature is undesirable due to compatibility concerns, it can be disabled
by setting the
<xref:System.Data.SqlClient.SqlConnectionStringBuilder.ConnectRetryCount?displayProperty=name>
property of a connection string (or
<xref:System.Data.SqlClient.SqlConnectionStringBuilder?displayProperty=name>) to
0.

### Affected APIs
* `M:System.Data.IDbConnection.set_ConnectionString(System.String)`
* `M:System.Data.SqlClient.SqlConnection.set_ConnectionString(System.String)`
* `M:System.Configuration.ConnectionStringSettings.set_ConnectionString(System.String)`
* `M:System.Data.Common.DbConnection.set_ConnectionString(System.String)`
* `M:System.Data.Common.DbConnectionStringBuilder.set_ConnectionString(System.String)`
* `M:System.Data.SqlClient.SqlConnectionStringBuilder.#ctor`
* `M:System.Data.SqlClient.SqlConnectionStringBuilder.#ctor(System.String)`
* `M:System.Data.Common.DbConnectionStringBuilder.#ctor`
* `M:System.Data.Common.DbConnectionStringBuilder.#ctor(System.Boolean)`

### Categories
ADO.NET
Data

[More information](https://blogs.msdn.com/b/dotnet/archive/2013/10/17/net-framework-4-5-1-rtm-gt-start-coding.aspx)

<!--
    ### Notes
    It would be very difficult to know if code depended on not auto-reconnecting and ADO.NET connection.
    Source analyzer status: Planned - No tracking work item yet
    Single-diagnostic compilation action analyzer
-->

<!-- breaking change id: 119 -->
