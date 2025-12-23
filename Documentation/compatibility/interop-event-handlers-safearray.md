## .NET COM successfully marshals ByRef SafeArray parameters on events

### Scope
Minor

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.7.2 and earlier versions, a ByRef [SafeArray](https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray) parameter on a COM event would fail to marshal back to native code.  With this change the [SafeArray](https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray) is now marshalled successfully.

- [ x ] Quirked
- [ ] Build-time break

### Recommended Action
If properly marshalling ByRef SafeArray parameters on COM Events breaks execution, you can disable this code by adding the following configuration switch to your application config:

```xml
<appSettings>
    <add key="Switch.System.Runtime.InteropServices.DoNotMarshalOutByrefSafeArrayOnInvoke" value="true" />
</appSettings>
```

### Category
Core
