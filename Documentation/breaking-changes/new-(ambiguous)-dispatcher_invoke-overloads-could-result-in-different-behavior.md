## 23: New (ambiguous) Dispatcher.Invoke overloads could result in different behavior

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
The .NET Framework 4.5 adds new overloads to Dispatcher.Invoke that include a parameter of type System.Action. When existing code is recompiled, compilers may resolve calls to Dispatcher.Invoke methods that have a Delegate parameter as calls to Dispatcher.Invoke methods with an System.Action parameter. If a call to a Dispatcher.Invoke overload with a Delegate parameter is resolved as a call to a Dispatcher.Invoke overload with an System.Action parameter, the following differences in behavior may occur:

- If an exception occurs, the Dispatcher.UnhandledExceptionFilter and Dispatcher.UnhandledException events are not raised. Instead, exceptions are handled by the UnobservedTaskException event.
- Calls to some members, such as DispatcherOperation.Result, block until the operation has completed.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
To avoid ambiguity (and potential differences in exception handling or blocking behaviors), code calling Dispatcher.Invoke can pass an empty object[] as a second parameter to the Invoke call to be sure of resolving to the .NET 4.0 method overload.

### Affected APIs
* `M:System.Windows.Threading.Dispatcher.Invoke(System.Delegate,System.Object[])`
* `M:System.Windows.Threading.Dispatcher.Invoke(System.Delegate,System.TimeSpan,System.Object[])`
* `M:System.Windows.Threading.Dispatcher.Invoke(System.Delegate,System.TimeSpan,System.Windows.Threading.DispatcherPriority,System.Object[])`
* `M:System.Windows.Threading.Dispatcher.Invoke(System.Delegate,System.Windows.Threading.DispatcherPriority,System.Object[])`

### Category
Windows Workflow Foundation (WF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#wwf)
