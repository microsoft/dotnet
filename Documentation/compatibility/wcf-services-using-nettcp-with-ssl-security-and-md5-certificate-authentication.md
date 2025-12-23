## WCF services that use NETTCP with SSL security and MD5 certificate authentication

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
NotPlanned

### Change Description
The .NET Framework 4.6 adds TLS 1.1 and TLS 1.2 to the WCF SSL default protocol list. When both client and server machines have the .NET Framework 4.6 or later installed, TLS 1.2 is used for negotiation. 

TLS 1.2 does not support MD5 certificate authentication. As a result, if a customer uses an MD5 certificate, the WCF client will fail to connect to the WCF service. 

- [ ] Quirked 
- [ ] Build-time break

### Recommended Action
You can work around this issue so that a WCF client can connect to a WCF server by doing any of the following:

- Update the certificate to not use the MD5 algorithm. This is the recommended solution.
 
- If the binding is not dynamically configured in source code, update the application's configuration file to use TLS 1.1 or an earlier version of the protocol. This allows you to continue to use a certificate with the MD5 hash algorithm.

   > [!WARNING]
   > This workaround is not recommended, since a certificate with the MD5 hash algorithm is considered insecure.

    The following configuration file does this:

    ```xml
    <configuration>  
        <system.serviceModel>  
            <bindings>  
                <netTcpBinding>  
                    <binding>  
                        <security mode= "None|Transport|Message|TransportWithMessageCredential" >  
                            <transport clientCredentialType="None|Windows|Certificate"  
                                                protectionLevel="None|Sign|EncryptAndSign"  
                                                sslProtocols="Ssl3|Tls1|Tls11">  
                            </transport>  
                        </security>  
                    </binding>  
                </netTcpBinding>  
            </bindings>  
        </system.ServiceModel>  
    </configuration>  
    ```

- If the binding is dynamically configured in source code, update the <xref:System.ServiceModel.TcpTransportSecurity.SslProtocols?displayProperty=nameWithType> property to use TLS 1.1 (<xref:System.Security.Authentication.SslProtocols.Tls11?displayProperty=nameWithType> or an earlier version of the protocol in the source code.

   > [!WARNING]
   > This workaround is not recommended, since a certificate with the MD5 hash algorithm is considered insecure.
 
### Affected APIs
* Not detectable via API analysis

### Category
Windows Communication Foundation (WCF)

<!-- breaking change id: 192 -->


