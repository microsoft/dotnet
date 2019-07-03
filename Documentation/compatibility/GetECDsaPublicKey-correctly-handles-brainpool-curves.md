## ECDsaCertificateExtensions.GetECDsaPublicKey correctly handles Brainpool curves

### Scope
Edge

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
Starting with .NET Framework 4.8, the <xref:System.Security.Cryptography.X509Certificates.ECDsaCertificateExtensions.GetECDsaPublicKey%2A?displayProperty=nameWithtype> method correctly handles all named curves supported by the OS, including the Brainpool elliptic curves.

### Recommended Action
If you encounter compatibility issues with this change on the .NET Framework 4.8 or a later version, you can opt-out of it by adding the following line to the \<runtime> section of the app.config file:

```xml
<appSettings>
    <add key="Switch.System.Security.Cryptography.X509Certificates.ECDsaCertificateExtensions.UseLegacyPublicKeyReader" value="true" />
</appSettings>
```

### Affected APIs

* `M:System.Security.Cryptography.X509Certificates.ECDsaCertificateExtensions.GetECDsaPublicKey(System.Security.Cryptography.X509Certificates.X509Certificate2)`

### Category
Security
