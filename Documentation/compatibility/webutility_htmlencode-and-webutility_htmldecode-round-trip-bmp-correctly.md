## WebUtility.HtmlEncode and WebUtility.HtmlDecode round-trip BMP correctly

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

For applications that target the .NET Framework 4.5, characters that are outside
the Basic Multilingual Plane (BMP) round-trip correctly when they are passed to
the <xref:System.Net.WebUtility.HtmlDecode(System.String)>
methods.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

This change should have no effect on current applications, but to restore the
original behavior, set the `targetFramework` attribute of the `<httpRuntime>`
element to a string other than "4.5". You can also set the
`unicodeEncodingConformance` and `unicodeDecodingConformance` attributes of the
`<webUtility>` configuration element to control this behavior independently of
the targeted version of the .NET Framework.

### Affected APIs
* `M:System.Net.WebUtility.HtmlEncode(System.String)`
* `M:System.Net.WebUtility.HtmlEncode(System.String,System.IO.TextWriter)`

### Category
ASP.NET

<!--
    ### Notes
    This shouldn't affect anything. An analyzer may not add much beyond ApiPort, but we could do basic parameter analysis and potentially implement a code fix
-->

<!-- breaking change id: 62 -->
