## Exceptions during unobserved processing in System.Threading.Tasks.Task no longer propagate on finalizer thread

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

Because the <xref:System.Threading.Tasks.Task?displayProperty=name> class
represents an asynchronous operation, it catches all non-severe exceptions that
occur during asynchronous processing. In the .NET Framework 4.5, if an exception
is not observed and your code never waits on the task, the exception will no
longer propagate on the finalizer thread and crash the process during garbage
collection. This change enhances the reliability of applications that use the
Task class to perform unobserved asynchronous processing.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If an app depends on unobserved asynchronous exceptions propagating to the
finalizer thread, the previous behavior can be restored by providing an
appropriate handler for the
<xref:System.Threading.Tasks.TaskScheduler.UnobservedTaskException>
event, or by setting a
[runtime configuration element](~/docs/framework/configure-apps/file-schema/runtime/throwunobservedtaskexceptions-element.md).

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

<!-- breaking change id: 55 -->
