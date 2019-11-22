## Data Binding improvement for KeyedCollection

### Scope
Major

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
Fixed [Binding's](xref:System.Windows.Data.Binding) incorrect use of IList indexer when the source object declares a custom indexer with the same signature (e.g. KeyedCollection<int,TItem>).

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
In order for an application that targets an older version to benefit from this change, it must run on the .NET Framework 4.8 or later, and it must opt in to the change by adding the following [AppContext switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the `<runtime>` section of the app config file and setting it to `false`:

```xml
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <runtime>
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
        <AppContextSwitchOverrides value="Switch.System.Windows.Data.Binding.IListIndexerHidesCustomIndexer=false" />
      </runtime>
    </configuration>
```    

### Category
WPF

<!--
    ### Original Bug
        585942
-->
