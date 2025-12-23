## Default value of ServicePointManager.SecurityProtocol is SecurityProtocolType.System.Default

### Scope
Minor

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description
Starting with apps that target the .NET Framework 4.7, the default value of the <xref:System.Net.ServicePointManager.SecurityProtocol?displayProperty=nameWithType> property is <xref:System.Net.SecurityProtocolType.SystemDefault?displayProperty=nameWithType>. This change allows .NET Framework networking APIs based on SslStream (such as FTP, HTTPS, and SMTP) to inherit the default security protocols from the operating system instead of using hard-coded values defined by the .NET Framework. The default varies by operating system and any custom configuration performed by the system administrator. For information on the default SChannel protocol in each version of the Windows operating system, see [Protocols in TLS/SSL (Schannel SSP)](https://docs.microsoft.com/windows/desktop/SecAuthN/protocols-in-tls-ssl--schannel-ssp-).</p>

For applications that target an earlier version of the .NET Framework, the default value of the <xref:System.Net.ServicePointManager.SecurityProtocol?displayProperty=nameWithType> property depends on the version of the .NET Framework targeted. See the [Networking section of Retargeting Changes for Migration from .NET Framework 4.5.2 to 4.6](~/docs/framework/migration-guide/retargeting/4.5.2-4.6.md#networking) for more information.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
This change affects applications that target the .NET Framework 4.7 or later versions. </br>

If you prefer to use a defined protocol rather than relying on the system default, you can explicitly set the value of the <xref:System.Net.ServicePointManager.SecurityProtocol?displayProperty=nameWithType> property.</br>

If this change is undesirable, you can opt out of it by adding a configuration setting to the [`<runtime>`](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of your application configuration file. The following example shows both the `<runtime>` section and the `Switch.System.Net.DontEnableSystemDefaultTlsVersions` opt-out switch:

```xml
<runtime>
   <AppContextSwitchOverrides value="Switch.System.Net.DontEnableSystemDefaultTlsVersions=true" />
</runtime>
```

### Affected APIs
- `P:System.Net.ServicePointManager.SecurityProtocol`

### Category
Networking

<!-- breaking change id: 184 -->


