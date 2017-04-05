## 10: System.Uri escaping now supports RFC 3986 (http://tools.ietf.org/html/rfc3986)

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
URI escaping has changed in .NET 4.5 to support [RFC 3986](http://tools.ietf.org/html/rfc3986). Specific changes include:

- `EscapeDataString` escapes reserved characters based on RFC 3986.
- `EscapeUriString` does not escape reserved characters.
- `UnescapeDataString` does not throw an exception if it encounters an invalid escape sequence.
- Unreserved escaped characters are un-escaped.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
* Update applications to not rely on UnescapeDataString to throw in the case of an invalid escape sequence. Such sequences must be detected directly now. 
* Similarly, expect that Escaped and Unescaped URI and Data strings may vary from .NET 4.0 and .NET 4.5 and should not be compared across .NET versions directly. Instead, they should be parsed and normalized in a single .NET version before any comparisons are made.

### Affected APIs
* `M:System.Uri.EscapeDataString(System.String)`
* `M:System.Uri.EscapeUriString(System.String)`
* `M:System.Uri.UnescapeDataString(System.String)`

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/hh367887\(v=vs.110\).aspx#core)
