## ECDsaCertificateExtensions.GetECDsaPublicKey correctly handles Brainpool curves

### Scope
Minor

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
Starting with the .NET Framework 4.8, the `System.Security.Cryptography.X509Certificates.ECDsaCertificateExtensions.GetECDsaPublicKey(this System.Security.Cryptography.X509Certificates.X509Certificate2 certificate)` will now correctly handle Brainpool elliptic curves.

### Recommended Action
If you encounter compatibility issues with this change on the .NET Framework 4.8 or a later version, you can opt-out of it by adding the following line to the <runtime> section of the app.config file:

```xml
<appSettings>
    <add key="Switch.System.Security.Cryptography.X509Certificates.ECDsaCertificateExtensions.UseLegacyPublicKeyReader" value="true" />
</appSettings>
```

### Category
Security
