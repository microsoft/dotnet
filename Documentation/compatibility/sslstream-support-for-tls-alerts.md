## SslStream supports TLS Alerts

### Scope
Edge

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description

After a failed TLS handshake, an
<xref:System.IO.IOException?displayProperty=name> with an inner
<xref:System.ComponentModel.Win32Exception?displayProperty=name> exception will
be thrown by the first I/O Read/Write operation. The
<xref:System.ComponentModel.Win32Exception.NativeErrorCode?displayProperty=name>
code for the <xref:System.ComponentModel.Win32Exception?displayProperty=name>
can be mapped to the TLS Alert from the remote party using the
[Schannel error codes for TLS and SSL alerts](https://docs.microsoft.com/windows/desktop/SecAuthN/schannel-error-codes-for-tls-and-ssl-alerts). 

For more information, see
[RFC 2246: Section 7.2.2 Error alerts](https://tools.ietf.org/html/rfc2246#section-7.2.2). <br/>

The behavior in .NET Framework 4.6.2 and earlier is that the transport channel (usually TCP
connection) will timeout during either Write or Read if the other party failed
the handshake and immediately afterwards rejected the connection.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

Applications calling network I/O APIs such as <xref:System.IO.Stream.Read(System.Byte[],System.Int32,System.Int32)>/<xref:System.IO.Stream.Write(System.Byte[],System.Int32,System.Int32)>
should handle <xref:System.IO.IOException> or
<xref:System.TimeoutException?displayProperty=name>.<br/>

The TLS Alerts feature is enabled by default starting with .NET Framework 4.7.
Applications targeting versions of the .NET Framework from 4.0 through 4.6.2 running on a .NET Framework 4.7 or higher
system will have the feature disabled to preserve compatibility. <br/>

The following configuration API is available to enable or disable the feature
for .NET Framework 4.6 and later applications running on .NET Framework 4.7 or later.

- Programmatically:

	Must be the very first thing the application does since ServicePointManager will initialize only once:
    
    ```csharp
    AppContext.SetSwitch("TestSwitch.LocalAppContext.DisableCaching", true);
    AppContext.SetSwitch("Switch.System.Net.DontEnableTlsAlerts", true); // Set to 'false' to enable the feature in .NET Framework 4.6 - 4.6.2.
    ```

- AppConfig:

    ```xml
    <runtime>
        <AppContextSwitchOverrides value="Switch.System.Net.DontEnableTlsAlerts=true"/>
        <!-- Set to 'false' to enable the feature in .NET Framework 4.6 - 4.6.2. -->
    </runtime>
    ```

- Registry key (machine global):

   Set the Value to `false` to enable the feature in .NET Framework 4.6 - 4.6.2.

     - Key: HKLM\SOFTWARE\Wow6432Node\Microsoft\\.NETFramework\AppContext\Switch.System.Net.DontEnableTlsAlerts
     - Type: String
     - Value: "true"

### Affected APIs
* `T:System.Net.Security.SslStream`
* `T:System.Net.WebRequest`
* `T:System.Net.HttpWebRequest`
* `T:System.Net.FtpWebRequest`
* `T:System.Net.Mail.SmtpClient`
* `N:System.Net.Http`

### Category
Networking
Security

<!--
    Bug 274590:SslStream TLS Alerts implementation
-->

<!-- breaking change id: 181 -->
