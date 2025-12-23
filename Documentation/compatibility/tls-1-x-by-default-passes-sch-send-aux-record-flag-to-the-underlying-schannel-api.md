## TLS 1.x by default passes the SCH_SEND_AUX_RECORD flag to the underlying SCHANNEL API

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
NotPlanned

### Change Description

When using TLS 1.x, the .NET Framework relies on the underlying Windows SCHANNEL API. Starting with .NET Framework 4.6, the [`SCH_SEND_AUX_RECORD`](https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-_schannel_cred) flag is passed by default to SCHANNEL. This causes SCHANNEL to split data to be encrypted into two separate records, the first as a single byte and the second as *n*-1 bytes.   

In rare cases, this breaks communication between clients and existing servers that make the assumption that the data resides in a single record.

- [X] Quirked
- [ ] Build-time break

### Recommended Action

If this change breaks communication with an existing server, you can disable sending the [`SCH_SEND_AUX_RECORD`](https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-_schannel_cred) flag and restore the previous behavior of not splitting data into separate records by adding the following switch to the [\<AppContextSwitchOverrides>](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) element in the [\<runtime>](~/docs/framework/configure-apps/file-schema/runtime/runtime-element.md) section of your app configuration file:

```xml
<runtime>
   <AppContextSwitchOverrides   
          value="Switch.System.Net.DontEnableSchSendAuxRecord=true" /> 
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
    ### Original Bug #186985
-->

