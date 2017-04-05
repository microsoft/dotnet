## 39: System.Threading.Tasks.Task no longer throw ObjectDisposedException after object is disposed

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Except for Task.IAsyncResult.AsyncWaitHandle, System.Threading.Tasks.Task methods no longer throw an ObjectDisposedException exception after the object is disposed.<br/><br/>This change supports the use of cached tasks. For example, a method can return a cached task to represent an already completed operation instead of allocating a new task. This was impossible in previous .NET Framework versions, because any consumer of the task could dispose of it, which rendered it unusable.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Be aware that Task methods may no longer throw ObjectDisposedExceptions in cases when the object is disposed. If an app was depending on this exception to know that a task was disposed, it should be updated to explicitly check the task's status using [Task.Status](https://msdn.microsoft.com/en-us/library/system.threading.tasks.task.status(v=vs.110).aspx).

### Affected APIs
* Not detectable via API analysis

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#core)
