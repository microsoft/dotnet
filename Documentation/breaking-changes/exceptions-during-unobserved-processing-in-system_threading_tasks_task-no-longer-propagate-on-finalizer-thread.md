## 55: Exceptions during unobserved processing in System.Threading.Tasks.Task no longer propagate on finalizer thread

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
Because the System.Threading.Tasks.Task class represents an asynchronous operation, it catches all non-severe exceptions that occur during asynchronous processing. In the .NET Framework 4.5, if an exception is not observed and your code never waits on the task, the exception will no longer propagate on the finalizer thread and crash the process during garbage collection. This change enhances the reliability of applications that use the Task class to perform unobserved asynchronous processing.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If an app depends on unobserved asynchronous exceptions propagating to the finalizer thread, the previous behavior can be restored by providing an appropriate handler for the [TaskScheduler.UnobservedTaskException](https://msdn.microsoft.com/en-us/library/system.threading.tasks.taskscheduler.unobservedtaskexception(v=vs.110).aspx) event, or by setting a [runtime configuration element](https://msdn.microsoft.com/en-us/library/jj160346%28v=vs.110%29.aspx).

### Affected APIs
* `M:System.Threading.Tasks.Task.Run(System.Action)`
* `M:System.Threading.Tasks.Task.Run(System.Action,System.Threading.CancellationToken)`
* `M:System.Threading.Tasks.Task.Run(System.Func{System.Threading.Tasks.Task})`
* `M:System.Threading.Tasks.Task.Run(System.Func{System.Threading.Tasks.Task},System.Threading.CancellationToken)`
* ```M:System.Threading.Tasks.Task.Run``1(System.Func{``0})```
* ```M:System.Threading.Tasks.Task.Run``1(System.Func{``0},System.Threading.CancellationToken)```
* ```M:System.Threading.Tasks.Task.Run``1(System.Func{System.Threading.Tasks.Task{``0}})```
* ```M:System.Threading.Tasks.Task.Run``1(System.Func{System.Threading.Tasks.Task{``0}},System.Threading.CancellationToken)```
* `M:System.Threading.Tasks.Task.Start`
* `M:System.Threading.Tasks.Task.Start(System.Threading.Tasks.TaskScheduler)`

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#core)
