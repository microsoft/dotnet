## IAsyncResult.CompletedSynchronously property must be correct for the resulting task to complete

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

When calling TaskFactory.FromAsync, the implementation of the
<xref:System.IAsyncResult.CompletedSynchronously>
property must be correct for the resulting task to complete. That is, the
property must return true if, and only if, the implementation completed
synchronously. Previously, the property was not checked.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

If <xref:System.IAsyncResult?displayProperty=name> implementations correctly
return true for the
<xref:System.IAsyncResult.CompletedSynchronously?displayProperty=name> property
only when a task completed synchronously, then no break will be observed. Users
should review <xref:System.IAsyncResult?displayProperty=name> implementations
they own (if any) to ensure that they correctly evaluate whether a task
completed synchronously or not.

### Affected APIs
* ```M:System.Threading.Tasks.TaskFactory.FromAsync(System.IAsyncResult,System.Action{System.IAsyncResult})```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync(System.IAsyncResult,System.Action{System.IAsyncResult},System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync(System.IAsyncResult,System.Action{System.IAsyncResult},System.Threading.Tasks.TaskCreationOptions,System.Threading.Tasks.TaskScheduler)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``1(System.IAsyncResult,System.Func{System.IAsyncResult,``0})```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync(System.Func{System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync(System.Func{System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},System.Object,System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``1(System.Func{``0,System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},``0,System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``1(System.Func{``0,System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},``0,System.Object,System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``1(System.Func{System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``0},System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``1(System.Func{System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``0},System.Object,System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``1(System.IAsyncResult,System.Func{System.IAsyncResult,``0},System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``1(System.IAsyncResult,System.Func{System.IAsyncResult,``0},System.Threading.Tasks.TaskCreationOptions,System.Threading.Tasks.TaskScheduler)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``2(System.Func{``0,``1,System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},``0,``1,System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``2(System.Func{``0,``1,System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},``0,``1,System.Object,System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``2(System.Func{``0,System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``1},``0,System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``2(System.Func{``0,System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``1},``0,System.Object,System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``3(System.Func{``0,``1,System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``2},``0,``1,System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``3(System.Func{``0,``1,``2,System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},``0,``1,``2,System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``3(System.Func{``0,``1,``2,System.AsyncCallback,System.Object,System.IAsyncResult},System.Action{System.IAsyncResult},``0,``1,``2,System.Object,System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``3(System.Func{``0,``1,System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``2},``0,``1,System.Object,System.Threading.Tasks.TaskCreationOptions)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``4(System.Func{``0,``1,``2,System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``3},``0,``1,``2,System.Object)```
* ```M:System.Threading.Tasks.TaskFactory.FromAsync``4(System.Func{``0,``1,``2,System.AsyncCallback,System.Object,System.IAsyncResult},System.Func{System.IAsyncResult,``3},``0,``1,``2,System.Object,System.Threading.Tasks.TaskCreationOptions)```

### Category
Core

<!-- breaking change id: 58 -->
