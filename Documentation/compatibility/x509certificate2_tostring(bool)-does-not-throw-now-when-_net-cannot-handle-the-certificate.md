## X509Certificate2.ToString(Boolean) does not throw now when .NET cannot handle the certificate

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description

In .NET Framework 4.5.2 and earlier versions, this method would throw if `true` was passed for the verbose
parameter and there were certificates installed that weren't supported by the
.NET Framework. Now, the method will succeed and return a valid string that
omits the inaccessible portions of the certificate.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Any code depending on
<xref:System.Security.Cryptography.X509Certificates.X509Certificate2.ToString(System.Boolean)?displayProperty=nameWithType>
should be updated to expect that the returned string may exclude some
certificate data (such as public key, private key, and extensions) in some cases
in which the API would have previously thrown.

### Affected APIs
* `M:System.Security.Cryptography.X509Certificates.X509Certificate2.ToString(System.Boolean)`

### Category
Core

<!-- breaking change id: 76 -->
