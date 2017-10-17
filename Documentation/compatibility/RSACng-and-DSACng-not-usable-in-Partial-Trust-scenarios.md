## RSACng and DSACng are once again usable in Partial Trust scenarios

### Scope
Edge

### Version Introduced
4.6.2

### Version Reverted
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
CngLightup (used in several higher-level crypto apis, such as `T:System.Security.Cryptography.Xml.EncryptedXml`) and `T:System.Security.Cryptography.RSACng` in some cases rely on full trust. These include P/Invokes without asserting `F:System.Security.Permissions.SecurityPermissionFlag.UnmanagedCode` permissions, and code paths where `T:System.Security.Cryptography.CngKey` has permission demands for `F:System.Security.Permissions.SecurityPermissionFlag.UnmanagedCode`. Starting with the .NET Framework 4.6.2, CngLightup was used to switch to `T:System.Security.Cryptography.RSACng` wherever possible. As a result, partial trust apps that successfully used `T:System.Security.Cryptography.Xml.EncryptedXml` began to fail and throw `T:System.Security.SecurityException` exceptions.

This change adds the required asserts so that all functions using CngLightup have the required permissions.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If this change in the .NET Framework 4.6.2 has negatively impacted your partial trust apps, upgrade to the .NET Framework 4.7.1.

### Affected APIs
* `M:System.Security.Cryptography.DSACng.#ctor(System.Security.Cryptography.CngKey)`
* `P:System.Security.Cryptography.DSACng.Key`
* `P:System.Security.Cryptography.DSACng.LegalKeySizes`
* `M:System.Security.Cryptography.DSACng.CreateSignature(System.Byte[])`
* `M:System.Security.Cryptography.DSACng.VerifySignature(System.Byte[],System.Byte[])`
* `M:System.Security.Cryptography.RSACng.#ctor(System.Security.Cryptography.CngKey)`
* `P:System.Security.Cryptography.RSACng.Key`
* `M:System.Security.Cryptography.RSACng.Decrypt(System.Byte[],System.Security.Cryptography.RSAEncryptionPadding)`
* `M:System.Security.Cryptography.RSACng.SignHash(System.Byte[],System.Security.Cryptography.HashAlgorithmName,System.Security.Cryptography.RSASignaturePadding)`

### Category
Security

<!--
Bug # 400499
-->
