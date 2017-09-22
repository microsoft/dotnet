## Fixed a bug introduced in 4.6.2 that caused RSACng and DSACng to not be usable in Partial Trust scenarios

### Scope
Edge

### Version Introduced
4.6.2

### Version Reverted
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
CngLightup (used in several higher-level crypto apis, such as EncryptedXML) and RSACng have several cases where they rely on full trust, including calling P/Invokes without asserting UnmanagedCode permission and code paths where CngKey has demands for UnmanagedCode. In 4.6.2, CngLightup was used to switch to RSACng wherever possible. This means that partial trust apps that could successfully use EncryptedXML and the other APIs before now fail with SecurityExceptions. 

This change adds the required asserts so that all functions using CngLightup have the required permissions.

- [ ] Quirked
- [ ] Build-time break

### Affected APIs
M:System.Security.Cryptography.DSACng.#ctor(System.Security.Cryptography.CngKey)
P:System.Security.Cryptography.DSACng.Key
P:System.Security.Cryptography.DSACng.LegalKeySizes
M:System.Security.Cryptography.DSACng.CreateSignature(System.Byte[])
M:System.Security.Cryptography.DSACng.VerifySignature(System.Byte[],System.Byte[])
M:System.Security.Cryptography.RSACng.#ctor(System.Security.Cryptography.CngKey)
P:System.Security.Cryptography.RSACng.Key
M:System.Security.Cryptography.RSACng.Decrypt(System.Byte[], System.Security.Cryptography.RSAEncryptionPadding)
M:System.Security.Cryptography.RSACng.SignHash(System.Byte[], System.Security.Cryptography.HashAlgorithmName, System.Security.Cryptography.RSASignaturePadding)

### Category
Security
