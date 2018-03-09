## The default hash algorithm for WPF's Markup Compiler is now SHA256

### Scope
Transparent

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
The WPF MarkupCompiler provides compilation services for XAML markup files.  In the .NET Framework 4.7.1 and earlier versions, the default hash algorithm used for checksums was SHA1.
Due to recent security concerns with SHA1, this default has been changed to SHA256 starting with the .NET Framework 4.7.2.  This change affects all checksum generation for markup files during compilation steps.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
A developer who wants to utilize this change while targeting a framework version below .NET 4.7.1 or a developer who requires the previous functionality while targeting .NET 4.7.1 or greater 
can set the following AppContext flag appropriately.  A value of true will result in SHA1 being used as the default algorithm; false results in SHA256.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.System.Windows.Markup.DoNotUseSha256ForMarkupCompilerChecksumAlgorithm=true"/>
    </runtime>
</configuration>
```

### Category
Windows Presentation Foundation (WPF)

<!--
    424086
-->


