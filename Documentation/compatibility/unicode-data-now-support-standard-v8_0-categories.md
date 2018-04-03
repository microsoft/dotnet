## Unicode standard version 8.0 categories now supported

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Planned

### Change Description
In .NET Framework 4.6.2, Unicode data has been
upgraded from Unicode Standard version 6.3 to version 8.0.  When
requesting Unicode character categories in .NET Framework 4.6.2, some
results might not match the results in previous .NET Framework
versions.  This change mostly affects Cherokee syllables and New Tai
Lue vowels signs and tone marks.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Review code and remove/change logic that depends on hard-coded Unicode
character categories.

### Affected APIs
* `M:System.Char.GetUnicodeCategory(System.Char)`
* `M:System.Globalization.CharUnicodeInfo.GetUnicodeCategory(System.Char)`
* `M:System.Globalization.CharUnicodeInfo.GetUnicodeCategory(System.String,System.Int32)`

### Category
Globalization

[More information](https://github.com/Microsoft/dotnet/blob/master/releases/net462/dotnet462-changes.md)

<!-- breaking change id: 157 -->
