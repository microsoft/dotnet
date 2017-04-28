## Path colon checks are stricter

### Scope
Edge

### Version Introduced
4.6.2

### Source Analyzer Status
NotPlanned

### Change Description

In .NET Framework 4.6.2, a number of changes were made to support previously
unsupported paths (both in length and format). Checks for proper drive separator
(colon) syntax were made more correct, which had the side effect of blocking
some URI paths in a few select Path APIs where they used to be tolerated.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

If passing a URI to affected APIs, modify the string to be a legal path first.

- Remove the scheme from URLs manually (e.g. remove `file://` from URLs)
- Pass the URI to the <xref:System.Uri> class and use <xref:System.Uri.LocalPath>

Alternatively, you can opt out of the new path normalization by setting the `Switch.System.IO.UseLegacyPathHandling` AppContext switch to true.

### Affected APIs

* `M:System.IO.Path.GetDirectoryName(System.String)`
* `M:System.IO.Path.GetPathRoot(System.String)`

### Category
Core

<!-- breaking change id: 158 -->
