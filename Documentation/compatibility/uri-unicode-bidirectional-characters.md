## Allow Unicode Bidirectional Control Characters in URIs

### Scope
Minor

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Unicode specifies several special control characters used to specify the orientation of text.
In previous versions of the .NET Framework, these characters would be incorrectly stripped
from all URIs. The characters would be stripped even if they were present in their percent
encoded form. In order to better follow [RFC 3987](http://tools.ietf.org/html/rfc3987), we now allow these characters in URIs.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
The new behavior is enabled by default, but can be disabled by setting the app context switch
`Switch.System.Uri.DontKeepUnicodeBidiFormattingCharacters` to `true`. When applications target
earlier versions of the framework but run on 4.7.2, they can enable the fix by instead setting
the switch to `false`.

### Affected APIs
* `T:System.Uri`

### Category
Core

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems?id=130850
-->