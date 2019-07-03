## Managed cryptography classes do not throw a CryptographyException in FIPS mode

### Scope
Edge

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description

In .NET Framework 4.7.2 and earlier versions, managed cryptographic provider classes such as <xref:System.Security.Cryptography.SHA256Managed> throw a <xref:System.Security.Cryptography.CryptographicException> when the system cryptographic libraries are configured in FIPS mode. These exceptions are thrown because the managed versions have not undergone FIPS (Federal Information Processing Standards) 140-2 certification, as well as to block cryptographic algorithms that were not considered to be approved based on the FIPS rules.  Because few developers have their development machines in FIPS mode, these exceptions are frequently thrown only on production systems. 

Applications that target .NET Framework 4.8 and later versions automatically switch to the newer, relaxed policy, so that a <xref:System.Security.Cryptography.CryptographicException> is no longer thrown by default in such cases. Instead, the managed cryptography classes redirect cryptographic operations to a system cryptography library. This policy change effectively removes a potentially confusing difference between developer environments and the production environments and makes native components and managed components operate under the same cryptographic policy.

- [X] Quirked
- [ ] Build-time break

### Recommended Action

If this behavior is undesirable, you can opt out of it and restore the previous behavior so that a <xref:System.Security.Cryptography.CryptographicException> is thrown in FIPS mode by adding the following [AppContextSwitchOverrides](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) configuration setting to the [\<runtime>](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of your application configuration file:

```xml
<runtime>
   <AppContextSwitchOverrides value="Switch.System.Security.Cryptography.UseLegacyFipsThrow=true" />
</runtime>
```

If your application targets .NET Framework 4.7.2 or earlier, you can also opt in to this change by adding the following [AppContextSwitchOverrides](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) configuration setting to the [\<runtime>](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of your application configuration file:

```xml
<runtime>
   <AppContextSwitchOverrides value="Switch.System.Security.Cryptography.UseLegacyFipsThrow=false" />
</runtime>
```

### Affected APIs

* `T:System.Security.Cryptography.AesManaged`
* `T:System.Security.Cryptography.MD5Cng`
* `T:System.Security.Cryptography.MD5CryptoServiceProvider`
* `T:System.Security.Cryptography.RC2CryptoServiceProvider`
* `T:System.Security.Cryptography.RijndaelManaged`
* `T:System.Security.Cryptography.RIPEMD160Managed`
* `T:System.Security.Cryptography.SHA1Managed`
* `T:System.Security.Cryptography.SHA256Managed`

### Category
Core

<!--
    ### Original Bug
    Bug link goes here
-->
