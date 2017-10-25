## ServiceBase doesn't propagate OnStart exceptions

### Scope

Minor

### Version Introduced
4.7.1

### Source Analyzer Status

NotPlanned

### Change Description

In the .NET Framework 4.7 and earlier versions, exceptions thrown on service startup are not propagated to the caller of <xref:System.ServiceProcess.ServiceBase.Run%2A?displayProperty=nameWithType>.

Starting with applications that target the .NET Framework 4.7.1, the runtime propagates exceptions to <xref:System.ServiceProcess.ServiceBase.Run%2A?displayProperty=nameWithType> for services that fail to start.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
On service start, if there is an exception, that exception will be propagated. This should help diagnose cases where services fail to start.

If this behavior is undesirable, you can opt out of it by adding the following <AppContextSwitchOverrides> element to the <runtime> section of your application configuration file:

```xml
<AppContextSwitchOverrides value="Switch.System.ServiceProcess.DontThrowExceptionsOnStart=true" />
```

If your application targets an earlier version than 4.7.1 but you want to have this behavior, add the following <AppContextSwitchOverrides> element to the <runtime> section of your application configuration file:

```xml
<AppContextSwitchOverrides value="Switch.System.ServiceProcess.DontThrowExceptionsOnStart=false" />
```

### Affected APIs
* `M:System.ServiceProcess.ServiceBase.Run(System.ServiceProcess.ServiceBase)`
* `M:System.ServiceProcess.ServiceBase.Run(System.ServiceProcess.ServiceBase[])`

### Category
Core