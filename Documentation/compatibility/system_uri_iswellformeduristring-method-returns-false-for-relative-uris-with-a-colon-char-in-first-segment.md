## System.Uri.IsWellFormedUriString method returns false for relative URIs with a colon char in first segment

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

Beginning with the .NET Framework 4.5,
<xref:System.Uri.IsWellFormedUriString(System.String,System.UriKind)>
will treat relative URIs with a `:` in their first segment as not well formed.
This is a change from
<xref:System.Uri.IsWellFormedUriString(System.String,System.UriKind)?displayProperty=name>
behavior in the .NET Framework 4.0 that was made to conform to RFC3986.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

This change (like many other URI changes) will only affect applications
targeting the .NET Framework 4.5 (or later). To keep using the old behavior,
target the app against the .NET Framework 4.0. Alternatively, scan URI's prior
to calling
<xref:System.Uri.IsWellFormedUriString(System.String,System.UriKind)?displayProperty=name>
looking for `:` characters that you may want to remove for validation purposes,
if the old behavior is desirable.

### Affected APIs
* `M:System.Uri.IsWellFormedUriString(System.String,System.UriKind)`

### Category
Core

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/788841/net-4-5-system-uri-iswellformeduristring-method-returns-false-for-relative-uris-with-a-colon-char-in-first-segment)

<!-- breaking change id: 121 -->
