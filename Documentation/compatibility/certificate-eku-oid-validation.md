## Certificate EKU OID validation

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
NotPlanned

### Change Description

Starting with .NET Framework 4.6, the <xref:System.Net.Security.SslStream> or <xref:System.Net.ServicePointManager> classes perform enhanced key use (EKU) object identifier (OID) validation. An enhanced key usage (EKU) extension is a collection of object identifiers (OIDs) that indicate the applications that use the key. EKU OID validation uses remote certificate callbacks to ensure that the remote certificate has the correct OIDs for the intended purpose.

- [X] Quirked
- [ ] Build-time break

### Recommended Action

If this change is undesirable, you can disable certificate EKU OID validation by adding the following switch to the [`\<AppContextSwitchOverrides>` element](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) in the [`\<runtime> section](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) of your app configuration file:

```xml
<runtime>
   <AppContextSwitchOverrides
          value="Switch.System.Net.DontCheckCertificateEKUs=true" />
</runtime>
```
> [!IMPORTANT]
> This setting is provided for backward compatibility only. Its use is otherwise not recommended.


### Affected APIs
* `T:System.Net.Security.SslStream`
* `T:System.Net.ServicePointManager`
* `T:System.Net.Http.HttpClient`
* `T:System.Net.Mail.SmtpClient`
* `T:System.Net.HttpWebRequest`
* `T:System.Net.FtpWebRequest`

### Category
Networking

<!--
    ### Original Bug #364538
-->


