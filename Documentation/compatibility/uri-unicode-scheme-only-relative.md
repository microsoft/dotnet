## Support special relative URI notation when Unicode is present

### Scope
Edge

### Version Introduced
4.7.3

### Source Analyzer Status
NotPlanned

### Change Description

<xref:System.Uri> will no longer throw a NullReferenceException when calling <xref:System.Uri.TryCreate> on unusual relative URIs containing Unicode.

The simplest reproduction of the <xref:System.NullReferenceException> is below, with the two statements being equivalent:
 ```C#
bool success = Uri.TryCreate("http:%C3%A8", UriKind.RelativeOrAbsolute, out Uri href);
bool success = Uri.TryCreate("http:è", UriKind.RelativeOrAbsolute, out Uri href);
 ```
To reproduce the <xref:System.NullReferenceException> the two following items must be true:
- The URI must be specified as relative by prepending it with ‘http:’ and not followed by ‘//’.
- The URI must contain percent-encoded Unicode or unreserved symbols.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Users depending on this behavior to disallow relative URIs should instead specify <xref:System.UriKind.Absolute> when creating a URI.

### Affected APIs
* `T:System.Uri.TryCreate`

### Category
Core

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems/edit/287019
-->