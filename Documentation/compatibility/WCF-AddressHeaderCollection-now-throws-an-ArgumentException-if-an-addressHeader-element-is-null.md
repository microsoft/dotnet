## WCF AddressHeaderCollection now throws an ArgumentException if an addressHeader element is null

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
Starting with the .NET Framework 4.7.1, the <xref:System.ServiceModel.Channels.AddressHeaderCollection.#ctor(System.Collections.Generic.IEnumerable{System.ServiceModel.Channels.AddressHeader})> constructor throws an <xref:System.ArgumentException> if one of the elements is `null`. In the .NET Framework 4.7 and earlier versions, no exception is thrown.

### Recommended Action
If you encounter compatibility issues with this change on the .NET Framework 4.7.1 or a later version, you can opt-out of it by adding the following line to the `<runtime>` section of the app.config file::

```xml
<configuration>
    <runtime>
	    <AppContextSwitchOverrides value="Switch.System.ServiceModel.DisableAddressHeaderCollectionValidation=true" />
	</runtime>
</configuration>
```

### Affected APIs
* `M:System.ServiceModel.Channels.AddressHeaderCollection.#ctor(System.Collections.Generic.IEnumerable{System.ServiceModel.Channels.AddressHeader})`

### Category
Windows Communication Foundation (WCF)

<!--
    ### Original Bug
    [275879] (https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=275879)
-->