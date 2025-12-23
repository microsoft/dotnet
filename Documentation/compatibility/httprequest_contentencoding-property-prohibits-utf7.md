## HttpRequest.ContentEncoding property prohibits UTF7

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

Beginning in .NET Framework 4.5, UTF-7 encoding is prohibited in
<xref:System.Web.HttpRequest?displayProperty=name>s'
bodies. Data for applications that depend on incoming UTF-7 data will not decode
properly in some cases.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Ideally, applications should be updated to not use UTF-7 encoding in
<xref:System.Web.HttpRequest?displayProperty=name>s. Alternatively, legacy
behavior can be restored by using the `aspnet:AllowUtf7RequestContentEncoding`
attribute of the
[appSettings](~/docs/framework/configure-apps/file-schema/appsettings/appsettings-element-for-configuration.md)
element.

### Affected APIs
* `P:System.Web.HttpRequest.ContentEncoding`

### Category
ASP.NET

<!-- breaking change id: 43 -->
