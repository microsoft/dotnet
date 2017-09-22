## SignedXml.GetPublicKey returns RSACng on net462 (or lightup) without retargeting change

### Scope
Edge

### Version Introduced
4.6.2

### Version Reverted
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
We let an object return type change in net462 without quirking it. This change adds a quirk to use the old method of getting the return value (certificate.PublicKey.Key) instead of the new method (certificate.GetAnyPublicKey)

- [x] Quirked
- [ ] Build-time break

### Recommended Action
To use the old method of getting a key, set the switch: Switch.System.Security.Cryptography.Xml.SignedXmlUseLegacyCertificatePrivateKey

### Affected APIs
M:System.Security.Cryptography.SignedXml.CheckSignatureReturningKey(System.Security.Cryptography.AsymmetricAlgorithm) 

### Category
Security
