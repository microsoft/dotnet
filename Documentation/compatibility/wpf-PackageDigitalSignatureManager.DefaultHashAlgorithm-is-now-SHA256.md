## The default hash algorithm for WPF PackageDigitalSignatureManager is now SHA256

### Scope
Edge Case

### Version Introduced
.NET 4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
The PackageDigitalSignatureManager provides functionality for digital signatures in relation to WPF packages.  Previously, the default algorithm (PackageDigitalSignatureManager.DefaultHashAlgorithm)
used for signing parts of a Package was SHA1.  Due to recent security concerns with SHA1, this default has been updated to SHA256.  This change affects all package signing, including XPS documents.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
A developer that wants to utilize this change while targeting a framework version below .NET 4.7.1 or a developer that requires the previous functionality while targeting .NET 4.7.1 or greater 
can set the following AppContext flag appropriately.  A value of true will result in SHA1 being used as the default algorithm, false results in SHA256.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.MS.Internal.UseSha1AsDefaultHashAlgorithmForDigitalSignatures=true"/>
    </runtime>
</configuration>
```

### Affected APIs
T:System.IO.Packaging.PackageDigitalSignatureManager.DefaultHashAlgorithm

### Category
Windows Presentation Foundation (WPF)

<!--
    436861
-->


