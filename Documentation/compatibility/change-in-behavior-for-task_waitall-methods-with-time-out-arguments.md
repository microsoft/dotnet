## Change in behavior for Task.WaitAll methods with time-out arguments

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
<xref:System.Threading.Tasks.Task.WaitAll%2A?displayProperty=nameWithType> behavior was made more consistent in .NET Framework 4.5.

In the .NET Framework 4, these methods behaved inconsistently. When the time-out
expired, if one or more tasks were completed or canceled before the method call,
the method threw an <xref:System.AggregateException?displayProperty=name>
exception. When the time-out expired, if no tasks were completed or canceled
before the method call, but one or more tasks entered these states after the
method call, the method returned false.<br/><br/>In the .NET Framework 4.5,
these method overloads now return false if any tasks are still running when the
time-out interval expired, and they throw an
<xref:System.AggregateException?displayProperty=name> exception only if an input
task was cancelled (regardless of whether it was before or after the method
call) and no other tasks are still running.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If an <xref:System.AggregateException?displayProperty=name> was being caught as a means of detecting a task that was cancelled prior to the <xref:System.Threading.Tasks.Task.WaitAll%2A> call being invoked, that code should instead do the same detection via the  <xref:System.Threading.Tasks.Task.IsCanceled%2A> property (for example: .Any(t =&gt; t.IsCanceled)) since .NET Framework 4.6 will only throw in that case if all awaited tasks are completed prior to the timeout.

### Affected APIs
* `M:System.Threading.Tasks.Task.WaitAll(System.Threading.Tasks.Task[],System.Int32)`
* `M:System.Threading.Tasks.Task.WaitAll(System.Threading.Tasks.Task[],System.Int32,System.Threading.CancellationToken)`
* `M:System.Threading.Tasks.Task.WaitAll(System.Threading.Tasks.Task[],System.TimeSpan)`

### Category
Core

<!-- breaking change id: 26 -->
