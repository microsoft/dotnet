## WCF binding with the TransportWithMessageCredential security mode

### Scope
Transparent

### Version Introduced
4.6.1

### Source Analyzer Status
Not planned

### Change Description
Beginning in the .NET Framework 4.6.1, WCF binding that uses the TransportWithMessageCredential security mode can be set up to receive messages with unsigned "to" headers for asymmetric security keys.

By default, unsigned "to" headers will continue to be rejected in .NET Framework 4.6.1. They will only be accepted if an application opts into this new mode of operation using the Switch.System.ServiceModel.AllowUnsignedToHeader configuration switch.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
Because this is an opt-in feature, it should not affect the behavior of existing apps.<br/>

To control whether the new behavior is used or not, use the following configuration setting:

```xml
<runtime>
    <AppContextSwitchOverrides value="Switch.System.ServiceModel.AllowUnsignedToHeader=true" />
</runtime>
```

### Affected APIs
* `F:System.ServiceModel.BasicHttpSecurityMode.TransportWithMessageCredential`
* `F:System.ServiceModel.BasicHttpsSecurityMode.TransportWithMessageCredential`
* `F:System.ServiceModel.SecurityMode.TransportWithMessageCredential`
* `F:System.ServiceModel.WSFederationHttpSecurityMode.TransportWithMessageCredential`

### Category
Windows Communication Foundation (WCF)

<!-- breaking change id: 142 -->
