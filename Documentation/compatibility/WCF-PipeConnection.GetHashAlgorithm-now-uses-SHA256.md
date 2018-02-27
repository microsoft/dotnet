## WCF PipeConnection.GetHashAlgorithm now uses SHA256

### Scope
Minor
### Version Introduced
4.7.1
### Source Analyzer Status
NotPlanned
### Change Description
Starting with the .NET Framework 4.7.1, Windows Communication Foundation uses a SHA256 hash to generate random names for named pipes. In the .NET Framework 4.7 and earlier versions, it used a SHA1 hash.

- [ ] Quirked
- [ ] Build-time break
 
### Recommended Action
If you run into compatibility issue with this change on the .NET Framework 4.7.1 or later, you can opt-out it by adding the following line to the `<runtime>` section of your app.config file:

```xml
<configuration>
    <runtime>
	    <AppContextSwitchOverrides value="Switch.System.ServiceModel.UseSha1InPipeConnectionGetHashAlgorithm=true" />
	</runtime>
</configuration>
```

### Affected APIs
* Not detectable via API analysis

### Category
Windows Communication Foundation (WCF)

<!--
    ### Original Bug
    [395685] (https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=395685)
-->

