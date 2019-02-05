## SqlConnection can no longer connect to SQL Server 1997 or databases using the VIA adapter

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
Connections to SQL Server databases using the [Virtual Interface Adapter (VIA) protocol](https://technet.microsoft.com/library/ms191229%28v=sql.105%29.aspx) are no longer supported.
The protocol used to connect to a SQL Server database is visible in the connection string. A VIA connection will contain via:\<servername\>.
If this app is connecting to SQL via a protocol other than VIA (tcp: or np: for example), then no breaking change will be encountered.

Also, connections to SQL Server 7 (1997) are no longer supported.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
The VIA protocol is deprecated, so an alternative protocol should be used to connect to SQL databases. The most common protocol used is TCP/IP. For more information about connecting through TCP/IP, see [Enable the TCP/IP protocol for a database instance](https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-2008/bb909712(v=vs.90)). If the database is only accessed from within an intranet, the shared pipes protocol may provide better performance if the network is slow.

### Affected APIs
* `M:System.Data.SqlClient.SqlConnection.#ctor(System.String)`
* `M:System.Data.SqlClient.SqlConnection.#ctor(System.String,System.Data.SqlClient.SqlCredential)`

### Category
Data

<!-- breaking change id: 70 -->
