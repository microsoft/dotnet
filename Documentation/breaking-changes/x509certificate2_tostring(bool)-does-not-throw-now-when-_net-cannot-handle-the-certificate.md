## 76: X509Certificate2.ToString(bool) does not throw now when .NET cannot handle the certificate

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description
Previously, this method would throw if 'true' was passed for the verbose parameter and there were certificates installed that weren't supported by the .Net Framework. Now, the method will succeed and return a valid string that omits the inaccessible portions of the certifiate.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Any code depending on X509Certificate2.ToString(bool) should be updated to expect that the returned string may exclude some certificate data (such as public key, private key, and extensions) in some cases in which the API would have previously thrown.

### Affected APIs
* `M:System.Security.Cryptography.X509Certificates.X509Certificate2.ToString(System.Boolean)`

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/dn833125\(v=vs.110\).aspx#Core)
