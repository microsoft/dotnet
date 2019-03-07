## .NET COM successfully marshals ByRef SafeArray parameters on events

### Scope
Minor

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
Prior to this change an ByRef SafeArray parameter on a COM event would fail to marshal back to native code.  With this change the SafeArray is now marshalled successfully.

- [ x ] Quirked
- [ ] Build-time break

### Recommended Action
If properly marshalling ByRef SafeArray parameters on COM Events is thought to break execution, you can disable this code by setting the following configuration.

Add the following configuration switch to your application config:
```xml
<appSettings>
    <add key="Switch.System.Runtime.InteropServices.DoNotMarshalOutByrefSafeArrayOnInvoke" value="true" />
</appSettings>
```

### Category
Core
