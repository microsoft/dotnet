## Change in path separator character in FullName property of ZipArchiveEntry objects

### Scope
Edge

### Version Introduced
4.6.1

### Source Analyzer Status
Planned

### Change Description
For apps that target the .NET Framework 4.6.1 and later versions, the path separator character has changed from a backslash ("\\") to a forward slash ("/") in the <xref:System.IO.Compression.ZipArchiveEntry.FullName> property of <xref:System.IO.Compression.ZipArchiveEntry>  objects created by overloads of the <xref:System.IO.Compression.ZipFile.CreateFromDirectory%2A> method. The change brings the .NET implementation into conformity with section 4.4.17.1 of the [.ZIP File Format Specification](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT) and allows .ZIP archives to be decompressed on non-Windows systems.<br />

Decompressing a zip file created by an app that targets a previous version of the .NET Framework on non-Windows operating systems such as the Macintosh fails to preserve the directory structure. For example, on the Macintosh, it creates a set of files whose filename concatenates the directory path, along with any backslash ("\\") characters, and the filename. As a result, the directory structure of decompressed files is not preserved.


- [X] Quirked
- [ ] Build-time break

### Recommended Action

The impact of this change on .ZIP files that are decompressed on the Windows operating system by APIs in the .NET Framework <xref:System.IO?displayProperty=nameWithType> namespace should be minimal, since these APIs can seamlessly handle either a forward slash ("/") or a backslash ("\\") as the path separator character.<br />

If this change is undesirable, you can opt out of it by adding a configuration setting to the [\<runtime>](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of your application configuration file. The following example shows both the `<runtime>` section and the `Switch.System.IO.Compression.ZipFile.UseBackslash` opt-out switch:

```xml
<runtime>
   <AppContextSwitchOverrides value="Switch.System.IO.Compression.ZipFile.UseBackslash=true" />
</runtime>
```

In addition, apps that target previous versions of the .NET Framework but are running on the .NET Framework 4.6.1 and later versions can opt in to this behavior by adding a configuration setting to the [\<runtime>](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of the application configuration file. The following shows both the `<runtime>` section and the `Switch.System.IO.Compression.ZipFile.UseBackslash` opt-in switch.

```xml
<runtime>
   <AppContextSwitchOverrides value="Switch.System.IO.Compression.ZipFile.UseBackslash=false" />
</runtime>
```

### Affected APIs
* `M:System.IO.Compression.ZipFile.CreateFromDirectory(System.String,System.String)`
* `M:System.IO.Compression.ZipFile.CreateFromDirectory(System.String,System.String,System.IO.Compression.CompressionLevel,System.Boolean)`
* `M:System.IO.Compression.ZipFile.CreateFromDirectory(System.String,System.String,System.IO.Compression.CompressionLevel,System.Boolean,System.Text.Encoding)`

### Category
Core

<!-- breaking change id: 188 -->


