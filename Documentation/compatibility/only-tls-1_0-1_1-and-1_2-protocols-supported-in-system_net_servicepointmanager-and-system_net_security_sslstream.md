## Only Tls 1.0, 1.1 and 1.2 protocols supported in System.Net.ServicePointManager and System.Net.Security.SslStream

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
Planned

### Change Description

Starting with the .NET Framework 4.6, the
<xref:System.Net.ServicePointManager> and
<xref:System.Net.Security.SslStream> classes are only
allowed to use one of the following three protocols: Tls1.0, Tls1.1, or Tls1.2.
The SSL3.0 protocol and RC4 cipher are not supported.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

The recommended mitigation is to upgrade the sever-side app to Tls1.0, Tls1.1,
or Tls1.2. If this is not feasible, or if client apps are broken, the
<xref:System.AppContext?displayProperty=name> class can be used to opt out of
this feature in either of two ways:

1. By programmatically setting compat switches on the <xref:System.AppContext?displayProperty=name>, as explained [here](https://devblogs.microsoft.com/dotnet/net-announcements-at-build-2015/#dotnet46).
2. By adding the following line to the `<runtime>` section of the app.config file: 

   ```xml
   <AppContextSwitchOverrides value="Switch.System.Net.DontEnableSchUseStrongCrypto=true"/>
   ```

### Affected APIs
* `F:System.Net.SecurityProtocolType.Ssl3`
* `F:System.Security.Authentication.SslProtocols.None`
* `F:System.Security.Authentication.SslProtocols.Ssl2`
* `F:System.Security.Authentication.SslProtocols.Ssl3`

### Category
Networking

<!-- breaking change id: 137 -->
