## WebUtility.HtmlDecode no longer decodes invalid input sequences

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
By default, decoding methods no longer decode an invalid input sequence into an invalid UTF-16 string. Instead, they return the original input.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
The change in decoder output should matter only if you store binary data instead of UTF-16 data in strings. To explicitly control this behavior, set the `aspnet:AllowRelaxedUnicodeDecoding` attribute of the [appSettings](~/docs/framework/configure-apps/file-schema/appsettings/index.md) element to `true` to enable legacy behavior or to `false` to enable the current behavior.

### Affected APIs
* `M:System.Net.WebUtility.HtmlDecode(System.String)`
* `M:System.Net.WebUtility.HtmlDecode(System.String,System.IO.TextWriter)`
* `M:System.Net.WebUtility.UrlDecode(System.String)`

### Category
ASP.NET

<!--
    ### Notes
    This only matters if you store binary data instead of UTF-16 data in string. An analyzer may not add much beyond ApiPort, but we could do basic parameter analysis and potentially implement a code fix
-->

<!-- breaking change id: 61 -->
