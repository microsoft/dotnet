## WCF transport security supports certificates stored using CNG

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with apps that target the .NET Framework 4.6.2, WCF transport security supports certificates stored using the Windows Cryptography Library (CNG). This support is limited to certificates with a public key that has an exponent no more than 32 bits in length. When an application targets the .NET Framework 4.6.2, this feature is on by default.

In earlier versions of the .NET Framework, the attempt to use X509 certificates with a CSG key storage provider throws an exception.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
Apps that target the .NET Framework 4.6.1 and earlier but are running on the .NET Framework 4.6.2 can enable support for CNG certificates by adding the following line to the `<runtime>` section of the app.config or web.config file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.ServiceModel.DisableCngCertificates=false" />
   </runtime>
   ```

This can also be done programmatically with the following code:

   ```cs
   private const string DisableCngCertificates = @"Switch.System.ServiceModel.DisableCngCertificate";
   AppContext.SetSwitch(disableCngCertificates, false);
   ```

   ```vb
   Const DisableCngCertificates As String = "Switch.System.ServiceModel.DisableCngCertificates"
   AppContext.SetSwitch(disableCngCertificates, False)
   ```

Note that, because of this change, any exception handling code that depends on the attempt to initiate secure communication with a CNG certificate to fail will no longer execute.

### Category
Windows Communication Foundation (WCF)

<!--
    ### Original Bug
    182182
-->

<!-- breaking change id: 166 -->
