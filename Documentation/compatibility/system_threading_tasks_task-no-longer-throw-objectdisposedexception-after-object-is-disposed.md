## System.Threading.Tasks.Task no longer throw ObjectDisposedException after object is disposed

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

Except for
<xref:System.Threading.Tasks.Task.System#IAsyncResult#AsyncWaitHandle>,
<xref:System.Threading.Tasks.Task?displayProperty=name> methods no longer throw
an <xref:System.ObjectDisposedException?displayProperty=name> exception after
the object is disposed.

This change supports the use of cached tasks. For example, a method can return a
cached task to represent an already completed operation instead of allocating a
new task. This was impossible in previous .NET Framework versions, because any
consumer of the task could dispose of it, which rendered it unusable.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Be aware that Task methods may no longer throw
<xref:System.ObjectDisposedException?displayProperty=name> in cases when the
object is disposed. If an app was depending on this exception to know that a
task was disposed, it should be updated to explicitly check the task's status
using <xref:System.Threading.Tasks.Task.Status>.

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 39 -->
