## HwndHost now correctly resizes child-HWND during DPI changes

### Scope
Major

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
In .NET Framework 4.7.2 and earlier versions, when WPF was run in Per-Monitor Aware mode, controls hosted within <xref:System.Windows.Interop.HwndHost> were not sized correctly after DPI changes, such as when moving applications from one monitor to another. This fix ensures that hosted controls are sized appropriately. 

- [x] Quirked
- [ ] Build-time break

### Recommended Action
In order for the application to benefit from these changes, it must run on the .NET Framework 4.7.2 or later, and it must opt-in to this behavior by setting the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) in the `<runtime>` section of the app config file to `false`, as the following example shows.

```xml
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <runtime>
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
        <AppContextSwitchOverrides value="Switch.System.Windows.DoNotUsePresentationDpiCapabilityTier2OrGreater=false" />
      </runtime>
    </configuration>
```    

### Category
WPF

<!--
    ### Original Bug
        433560
        488213
        503411
        614397
-->
