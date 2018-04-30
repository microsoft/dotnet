## DeflateStream uses native APIs for decompression

### Scope
Minor

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description

Starting with the .NET Framework 4.7.2, the implementation of decompression in the `T:System.IO.Compression.DeflateStream` class has changed to use native Windows APIs by default. Typically, this results in a substantial performance improvement. All .NET applications targeting the .NET Framework version 4.7.2 or higher use the native implementation.

This change might result in some differences in behavior, which include:

- Exception messages may be different. However, the type of exception thrown remains the same.
- Some special situations, such as not having enough memory to complete an operation, may be handled differently.
- There are known differences for parsing gzip header (note: only `GZipStream` set for decompression is affected):
  - Exceptions when parsing invalid headers may be thrown at different times.
  - The native implementation enforces that values for some reserved flags inside the gzip header (i.e. [FLG](http://www.zlib.org/rfc-gzip.html#header-trailer)) are set according to the specification, which may cause it to throw an exception where previously invalid values were ignored.
 
- [X] Quirked 
- [ ] Build-time break 

### Recommended Action

If decompression with native APIs has adversely affected the behavior of your app, you can opt out of this feature by adding the `Switch.System.IO.Compression.DoNotUseNativeZipLibraryForDecompression` switch to the `runtime` section of your app.config file and setting it to `true`:

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


