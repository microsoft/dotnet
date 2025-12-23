## Allow Unicode in URIs that resemble UNC shares

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
In <xref:System.Uri?displayProperty=fullName>, constructing a file URI containing both a UNC share name and Unicode characters will no longer result in a URI with invalid internal state. The behavior will change only when all of the following are true:
  - The URI has the scheme `file:` and is followed by four or more slashes.
  - The host name begins with an underscore or other non-reserved symbol.
  - The URI contains Unicode characters.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Applications working with URIs consistently containing Unicode could have conceivably used this behavior to disallow references to UNC shares. Those applications should use <xref:System.Uri.IsUnc> instead.

### Affected APIs
* `T:System.Uri`

### Category
Core

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems/edit/95292
-->