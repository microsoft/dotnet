## The default hash algorithm for WPF PackageDigitalSignatureManager is now SHA256

### Scope
Edge

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
The `System.IO.Packaging.PackageDigitalSignatureManager` provides functionality for digital signatures in relation to WPF packages.  In the .NET Framework 4.7 and earlier versions, the default algorithm (<xref:System.IO.Packaging.PackageDigitalSignatureManager.DefaultHashAlgorithm?displayProperty=nameWithType>)
used for signing parts of a package was SHA1.  Due to recent security concerns with SHA1, this default has been changed to SHA256 starting with the .NET Framework 4.7.1.  This change affects all package signing, including XPS documents.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
A developer who wants to utilize this change while targeting a framework version below .NET Framework 4.7.1 or a developer who requires the previous functionality while targeting .NET Framework 4.7.1 or greater 
can set the following AppContext flag appropriately.  A value of true will result in SHA1 being used as the default algorithm; false results in SHA256.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.MS.Internal.UseSha1AsDefaultHashAlgorithmForDigitalSignatures=true"/>
    </runtime>
</configuration>
```

### Affected APIs
P:System.IO.Packaging.PackageDigitalSignatureManager.DefaultHashAlgorithm

### Category
Windows Presentation Foundation (WPF)

<!--
    436861
-->


