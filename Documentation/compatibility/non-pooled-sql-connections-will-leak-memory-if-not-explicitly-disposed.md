## Non-pooled SQL connections will leak memory if not explicitly disposed

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Not planned

### Change Description
In the .NET Framework 4.5, non-pooled SQL connections which are not explicitly exposed (via Dispose, Close, or using) will leak memory

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This issue is fixed in a .NET Framework 4.5 servicing update. Update the
.NET Framework 4.5, or upgrade to .NET Framework 4.5.1 or later, to fix this
issue. Alternatively, this issue may be avoided by using the
<xref:System.Data.SqlClient.SqlConnection?displayProperty=name> in a 'using'
pattern (which is a best practice) or by explicitly calling Dispose or Close
when the connection is no longer needed.

### Affected APIs
* `M:System.Data.SqlClient.SqlConnection.#ctor(System.String)`
* `M:System.Data.SqlClient.SqlConnection.#ctor(System.String,System.Data.SqlClient.SqlCredential)`

### Category
Data

[More information](https://support.microsoft.com/kb/2748720)

<!-- breaking change id: 97 -->
