## SqlConnection.Open fails on Windows 7 with non-IFS Winsock BSP or LSP present

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5.2

### Source Analyzer Status
Planned

### Change Description

<xref:System.Data.SqlClient.SqlConnection.Open> and
<xref:System.Data.SqlClient.SqlConnection.OpenAsync(System.Threading.CancellationToken)>
fail in the .NET Framework 4.5 if running on a Windows 7 machine with a non-IFS
Winsock BSP or LSP are present on the computer.

To determine whether a non-IFS BSP or LSP is installed, use the `netsh WinSock
Show Catalog` command, and examine every `Winsock Catalog Provider Entry` item
that is returned. If the Service Flags value has the `0x20000` bit set, the
provider uses IFS handles and will work correctly. If the `0x20000` bit is clear
(not set), it is a non-IFS BSP or LSP.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This bug has been fixed in the .NET Framework 4.5.2, so it can be avoided by
upgrading the .NET Framework. Alternatively, it can be avoided by removing any
installed non-IFS Winsock LSPs.

### Affected APIs
* `M:System.Data.SqlClient.SqlConnection.Open`
* `M:System.Data.SqlClient.SqlConnection.OpenAsync(System.Threading.CancellationToken)`

### Category
Data

[More information](https://connect.microsoft.com/VisualStudio/feedback/details/729323)

<!-- breaking change id: 83 -->
