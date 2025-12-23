## Allow Unicode Bidirectional Control Characters in URIs

### Scope
Minor

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Unicode specifies several special control characters used to specify the orientation of text.
In previous versions of the .NET Framework, these characters were incorrectly stripped
from all URIs even if they were present in their percent-encoded form. In order to better 
follow [RFC 3987](https://tools.ietf.org/html/rfc3987), we now allow these characters in URIs. When found unencoded
in a URI, they are percent-encoded. When found percent-encoded they are left as-is.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
For applications that target versions of .NET Framework starting with 4.7.2, support for Unicode bidirectional characters is enabled by default. If this change is undesirable, you can disable it by adding the following [AppContextSwitchOverrides](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) switch to the `<runtime>` section of the application configuration file:
```xml
<runtime>
<AppContextSwitchOverrides value="Switch.System.Uri.DontKeepUnicodeBidiFormattingCharacters=true" />
</runtime>
```
For applications that target earlier versions of the .NET Framework but are running under versions starting with .NET Framework 4.7.2, support for Unicode bidirectional characters is disabled by default. You can enable it by adding the following [AppContextSwitchOverrides](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) switch to the `<runtime>` section of the application configuration file::
```xml
<runtime>
<AppContextSwitchOverrides value="Switch.System.Uri.DontKeepUnicodeBidiFormattingCharacters=false" />
</runtime>
```

### Affected APIs
* `T:System.Uri`

### Category
Core

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems?id=130850
-->