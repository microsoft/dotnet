## WPF AppDomain Shutdown Handling May Now Call Dispatcher.Invoke in Cleanup of Weak Events

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
In .NET Framework 4.7.1 and earlier versions, WPF potentially creates a <xref:System.Windows.Threading.Dispatcher?displayProperty=nameWithType> on the .NET finalizer thread during AppDomain shutdown.  This was fixed in 
.NET Framework 4.7.2 and later versions by making the cleanup of weak events thread-aware.  Due to this, WPF may call <xref:System.Windows.Threading.Dispatcher.Invoke%2A?displayProperty=nameWithType> to complete the cleanup process.

In certain applications, this change in finalizer timing can potentially cause exceptions during AppDomain or process shutdown.  This is generally seen in applications that do not correctly 
shut down dispatchers running on worker threads prior to process or AppDomain shutdown.  Such applications should take care to properly manage the lifetime of dispatchers.  

- [X] Quirked
- [ ] Build-time break

### Recommended Action
In .NET Framework 4.7.2 and later versions, developers can disable this fix in order to help alleviate (but not eliminate) timing issues that may occur due to the cleanup change.

To disable the change in cleanup, use the following AppContext flag.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.MS.Internal.DoNotInvokeInWeakEventTableShutdownListener=true"/>
    </runtime>
</configuration>
```

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    593963
-->


