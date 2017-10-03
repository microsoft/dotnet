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

The concrete type of the object returned by the SignedXml.GetPublicKey method changed (without a quirk) from a CryptoServiceProvider implementation to a Cng implementation in 4.6.2. This is because the implementation changed from usingcertificate.PublicKey.Key to using the internal certificate.GetAnyPublicKey in 4.6.2 which forwards e.g. to RSACertificateExtensions.GetRSAPublicKey.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
To force usage of the CryptoServiceProvider implementations for SignedXml.GetPublicKey, you can add the following configuration switch to the [runtime](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/runtime-element) section of your app config file:

```xml
<AppContextSwitchOverrides value="Switch.System.Security.Cryptography.Xml.SignedXmlUseLegacyCertificatePrivateKey=true" /> 
```

### Affected APIs
* `M:System.Security.Cryptography.SignedXml.CheckSignatureReturningKey(System.Security.Cryptography.AsymmetricAlgorithm)`

### Category
Security

<!--
Bug # 432261 
-->
