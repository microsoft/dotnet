## DeflateStream uses native APIs for decompression

### Scope
Minor

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description

Starting with apps that target the .NET Framework 4.7.2, the implementation of decompression in the `T:System.IO.Compression.DeflateStream` class has changed to use native Windows APIs by default. This results in an average performance improvement of approximately 300%. 

However, this change may result in some differences in behavior when compared with apps that target previous versions of the .NET Framework. These include:

- Exception messages may be different. However, the type of exception thrown remains the same.
 
- Some special situations, such as not having enough memory to complete an operation, may be handled differently.
 
- [X] Quirked 
- [ ] Build-time break 

### Recommended Action

If the decompression with native APIs has adversely affected the behavior of your app, you can opt out of this feature by adding the `Switch.System.IO.Compression.DoNotUseNativeZipLibraryForDecompression=true` switch to the `runtime` section of your app.config file and setting its to `true`:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
    <runtime>
       <AppContextSwitchOverrides
          value="Switch.System.IO.Compression.DoNotUseNativeZipLibraryForDecompression=true" />
    </runtime>
</configuration>
```
### Affected APIs
`T:System.IO.Compression.DeflateStream`
`T:System.IO.Compression.GZipStream`

### Category
Core

<!--
    #518398
-->


