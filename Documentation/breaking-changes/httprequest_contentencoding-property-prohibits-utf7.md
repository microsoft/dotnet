## 43: HttpRequest.ContentEncoding property prohibits UTF7

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Beginning in .NET Framework 4.5, UTF-7 encoding is prohibited in HttpRequests' bodies. Data for applications that depend on incoming UTF-7 data will not decode properly in some cases.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Ideally, applications should be updated to not use UTF-7 encoding in HttpRequests. Alternatively, legacy behavior can be restored by using the `aspnet:AllowUtf7RequestContentEncoding` attribute of the [appSettings](https://msdn.microsoft.com/en-us/library/hh975440(v=vs.110).aspx) element.

### Affected APIs
* `P:System.Web.HttpRequest.ContentEncoding`

### Category
ASP.NET

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#asp)
