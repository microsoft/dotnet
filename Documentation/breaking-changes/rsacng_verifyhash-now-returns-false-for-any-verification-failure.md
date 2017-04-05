## 159: RSACng.VerifyHash now returns False for any verification failure

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with the .NET Framework 4.6.2, this method returns **False** if the signature itself is badly formatted. It now returns false for any verification failure.

In the .NET Framework 4.6 and 4.6.1, the method throws a `T:System.Security.Cryptography.CryptographicException` if the signature itself is badly formatted.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Any code whose execution depends on handling the `T:System.Security.Cryptography.CryptographicException` should instead execute if validation fails and the method returns **False**.

### Affected APIs
* `M:System.Security.Cryptography.RSACng.VerifyHash(System.Byte[],System.Byte[],System.Security.Cryptography.HashAlgorithmName,System.Security.Cryptography.RSASignaturePadding)`

### Category
Security

<!--
    ### Original Bug
    164390
-->


