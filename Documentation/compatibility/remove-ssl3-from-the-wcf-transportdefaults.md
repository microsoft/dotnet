## Remove Ssl3 from the WCF TransportDefaults

### Scope
Edge

### Version Introduced
4.6.2

### Source Analyzer Status
Planned

### Change Description

When using NetTcp with transport security and a credential type of certificate,
the SSL 3 protocol is no longer a default protocol used for negotiating a secure
connection. In most cases there should be no impact to existing apps as TLS 1.0
has always been included in the protocol list for NetTcp. All existing clients
should be able to negotiate a connection using at least TLS1.0.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If Ssl3 is required, use one of the following configuration mechanisms to add
Ssl3 to the list of negotiated protocols.

* <xref:System.ServiceModel.Channels.SslStreamSecurityBindingElement.SslProtocols>
* <xref:System.ServiceModel.TcpTransportSecurity.SslProtocols>
* [\<transport> section of \<netTcpBinding>](~/docs/framework/configure-apps/file-schema/wcf/transport-of-nettcpbinding.md)
* [\<sslStreamSecurity> section of \<customBinding>]~/docs/framework/configure-apps/file-schema/wcf/sslstreamsecurity.md)

### Affected APIs
* `P:System.ServiceModel.Channels.SslStreamSecurityBindingElement.SslProtocols`
* `P:System.ServiceModel.TcpTransportSecurity.SslProtocols`

### Category
Windows Communication Foundation (WCF)

<!-- breaking change id: 149 -->
