## Attempting a TCP/IP connection to a SQL Server database that resolves to `localhost` fails

### Scope
Minor

### Version Introduced
4.6

### Version Reverted
4.6.2

### Source Analyzer Status
NotPlanned

### Change Description

In the .NET Framework 4.6 and 4.6.1, attempting a TCP/IP connection to a SQL Server database that resolves to `localhost` fails with the error, "A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SQL Network Interfaces, error: 26 - Error Locating Server/Instance Specified)"

- [ ] Quirked 
- [ ] Build-time break 

### Recommended Action

This issue has been addressed and the previous behavior restored in the .NET Framework 4.6.2. To connect to a SQL Server databsae that resolves to `localhost`, upgrade to the .NET Framework 4.6.2.

### Affected APIs
* Not detectable via API analysis

### Category
Data

<!-- breaking change id: 191 -->

