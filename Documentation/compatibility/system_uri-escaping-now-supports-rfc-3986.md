## System.Uri escaping now supports RFC 3986

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

URI escaping has changed in .NET Framework 4.5 to support
[RFC 3986](https://tools.ietf.org/html/rfc3986). Specific changes include:

- <xref:System.Uri.EscapeDataString(System.String)?displayProperty=name> escapes reserved characters based on RFC 3986.
- <xref:System.Uri.EscapeUriString(System.String)?displayProperty=name> does not escape reserved characters.
- <xref:System.Uri.UnescapeDataString(System.String)?displayProperty=name> does not throw an exception if it encounters an invalid escape sequence.
- Unreserved escaped characters are un-escaped.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
* Update applications to not rely on <xref:System.Uri.UnescapeDataString(System.String)?displayProperty=name> to throw in the case of an invalid escape sequence. Such sequences must be detected directly now.
* Similarly, expect that Escaped and Unescaped URI and Data strings may vary from .NET Framework 4.0 and .NET Framework 4.5 and should not be compared across .NET versions directly. Instead, they should be parsed and normalized in a single .NET version before any comparisons are made.

### Affected APIs
* `M:System.Uri.EscapeDataString(System.String)`
* `M:System.Uri.EscapeUriString(System.String)`
* `M:System.Uri.UnescapeDataString(System.String)`

### Category
Core

<!-- breaking change id: 10 -->
