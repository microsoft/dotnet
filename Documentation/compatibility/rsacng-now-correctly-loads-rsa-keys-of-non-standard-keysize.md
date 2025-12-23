## RSACng now correctly loads RSA keys of non-standard key size

### Scope
Edge

### Version Introduced
4.6.2

### Source Analyzer Status
Planned

### Change Description

In .NET Framework versions prior to 4.6.2, customers with non-standard key sizes
for RSA certificates are unable to access those keys via the
<xref:System.Security.Cryptography.X509Certificates.RSACertificateExtensions.GetRSAPublicKey(System.Security.Cryptography.X509Certificates.X509Certificate2)?displayProperty=name>
and
<xref:System.Security.Cryptography.X509Certificates.RSACertificateExtensions.GetRSAPrivateKey(System.Security.Cryptography.X509Certificates.X509Certificate2)?displayProperty=name>
extension methods.  A
<xref:System.Security.Cryptography.CryptographicException?displayProperty=name>
with the message "The requested key size is not supported" is thrown. In .NET
Framework 4.6.2 this issue has been fixed. Similarly,
<xref:System.Security.Cryptography.RSA.ImportParameters(System.Security.Cryptography.RSAParameters)>
and
<xref:System.Security.Cryptography.RSACng.ImportParameters(System.Security.Cryptography.RSAParameters)>
now work with non-standard key sizes without throwing a <xref:System.Security.Cryptography.CryptographicException?displayProperty=name>.

- [X] Quirked
- [ ] Build-time break

### Recommended Action

If there is any exception handling logic that relies on the previous behavior
where a
<xref:System.Security.Cryptography.CryptographicException?displayProperty=name>
is thrown when non-standard key sizes are used, consider removing the logic.

### Affected APIs
* `M:System.Security.Cryptography.RSA.ImportParameters(System.Security.Cryptography.RSAParameters)`
* `M:System.Security.Cryptography.RSACng.ImportParameters(System.Security.Cryptography.RSAParameters)`
* `M:System.Security.Cryptography.X509Certificates.RSACertificateExtensions.GetRSAPrivateKey(System.Security.Cryptography.X509Certificates.X509Certificate2)`
* `M:System.Security.Cryptography.X509Certificates.RSACertificateExtensions.GetRSAPublicKey(System.Security.Cryptography.X509Certificates.X509Certificate2)`

### Category
Security

<!-- breaking change id: 148 -->
