## Change SignedXML and SignedCMS default algorithms to SHA256

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
SignedXML and SignedCMS both default to SHA1 for some operations. This isn't a regression since it's been using SHA1 for ages, but with SHA1 no longer being secure it's necessary to update the default.

// Replace the space with an 'x' if applicable
- [X] Quirked
- [ ] Build-time break

### Recommended Action
There are two new context switch values to toggle the new default value:

Switch.System.Security.Cryptography.Xml.UseInsecureHashAlgorithms
Switch.System.Security.Cryptography.Pkcs.UseInsecureHashAlgorithms

When targetting .NET versions before 4.7.1, the default value of the above switches is "true" i.e. enabled, meaning that SHA1 will be used. Only when on 4.7.1+ or when manually enabling the above switches will the new default SHA256 be used.

### Affected APIs
T:System.Security.Cryptography.Pkcs.CmsSigner
T:System.Security.Cryptography.Xml.SignedXml
T:System.Security.Cryptography.Xml.Reference

### Category
Security