## WCF MsmqSecureHashAlgorithm default value is now SHA256

### Scope
Minor
### Version Introduced
4.7.1
### Source Analyzer Status
NotPlanned
### Change Description
Starting with the .NET Framework 4.7.1, the default message signing algorithm in WCF for Msmq messages is SHA256. In the .NET Framework 4.7 and earlier versions, the default message signing algorithm is SHA1.

- [ ] Quirked
- [ ] Build-time break
 
### Recommended Action
If you run into compatibility issues with this change on the .NET Framework 4.7.1 or later, you can opt-out the change by adding the following line to the `<runtime>`section of your app.config file:


```xml
<configuration>
    <runtime>
	    <AppContextSwitchOverrides value="Switch.System.ServiceModel.UseSha1InMsmqEncryptionAlgorithm=true" />
	</runtime>
</configuration>
```

### Affected APIs
* Not detectable via API analysis

### Category
Windows Communication Foundation (WCF)

<!--
    ### Original Bug
    [395687] (https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=395687)
-->
