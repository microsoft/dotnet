# WPF Exceptions during AppDomain or process shutdown

## Symptoms
In certain timing-sensitive WPF applications, exceptions may be seen during AppDomain or process shutdown.

## Cause
In .NET Framework 4.7.1 and earlier versions, WPF potentially creates a [System.Windows.Threading.Dispatcher](https://docs.microsoft.com/en-us/dotnet/api/system.windows.threading.dispatcher) on the .NET finalizer thread during AppDomain shutdown.  This was fixed in .NET Framework 4.7.2 and later versions by making the cleanup of weak events thread-aware.  Due to this, WPF may call [Dispatcher.Invoke](https://docs.microsoft.com/en-us/dotnet/api/system.windows.threading.dispatcher.invoke) to complete the cleanup process.

In certain applications, this change in finalizer timing can potentially cause exceptions during AppDomain or process shutdown.  This is generally seen in applications that do not correctly 
shut down dispatchers running on worker threads prior to process or AppDomain shutdown.  

## Resolution
WPF applications should take care to properly manage the lifetime of dispatchers to eliminate the possibility of this occurring.

In .NET Framework 4.7.2 and later versions, developers can disable the call to [Dispatcher.Invoke](https://docs.microsoft.com/en-us/dotnet/api/system.windows.threading.dispatcher.invoke)
in order to help alleviate (but not eliminate) timing issues that may occur due to the cleanup change.

To disable the change in cleanup, use the following AppContext flag.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.MS.Internal.DoNotInvokeInWeakEventTableShutdownListener=true"/>
    </runtime>
</configuration>
```
