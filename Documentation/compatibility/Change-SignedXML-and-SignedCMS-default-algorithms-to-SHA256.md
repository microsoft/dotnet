## Default SignedXML and SignedXMS algorithms changed to SHA256

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.7 and earlier, SignedXML and SignedCMS default to SHA1 for some operations.  

Starting with the .NET Framework 4.7.1, SHA256 is enabled by default for these operations. This change is necessary because SHA1 is no longer considered to be secure.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
There are two new context switch values to control whether SHA1 (insecure) or SHA256 is used by default:

- Switch.System.Security.Cryptography.Xml.UseInsecureHashAlgorithms
 
- Switch.System.Security.Cryptography.Pkcs.UseInsecureHashAlgorithms

For applications that target the .NET Framework 4.7.1 and later versions, if the use of SHA256 is undesirable, you can restore the default to SHA1 by adding the following configuration switch to the [runtime](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of your app config file:

```xml
<AppContextSwitchOverrides value="Switch.System.Security.Cryptography.Xml.UseInsecureHashAlgorithms=true;Switch.System.Security.Cryptography.Pkcs.UseInsecureHashAlgorithms=true" /> 
```

For applications that target the .NET Framework 4.7 and earlier versions, you can opt into this change by adding the following configuration switch to the [runtime](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of your app config file:

```xml
<AppContextSwitchOverrides value="Switch.System.Security.Cryptography.Xml.UseInsecureHashAlgorithms=false;Switch.System.Security.Cryptography.Pkcs.UseInsecureHashAlgorithms=false" /> 
```

### Affected APIs
* `T:System.Security.Cryptography.Pkcs.CmsSigner`
* `T:System.Security.Cryptography.Xml.SignedXml`
* `T:System.Security.Cryptography.Xml.Reference`

### Category
Security

<!--
Bug ID # 397307 and # 397641 
-->
