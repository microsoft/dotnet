## ConcurrentQueue&lt;T&gt;.TryPeek can return an erroneous null via its out parameter

### Scope
Major

### Version Introduced
4.5

### Version Reverted
4.5.1

### Source Analyzer Status
Available

### Change Description
In some multi-threaded scenarios,
<xref:System.Collections.Concurrent.ConcurrentQueue`1.TryPeek(`0@)?displayProperty=name>
can return true, but populate the out parameter with a null value (instead of
the correct, peeked value).

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue is fixed in the .NET Framework 4.5.1. Upgrading to that Framework will solve the issue.

### Affected APIs
* ``M:System.Collections.Concurrent.ConcurrentQueue`1.TryPeek(`0@)``

### Category
Core

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/762273/bug-in-concurrentqueue-in-net-4-5-trypeek-returns-true-but-no-real-object-returned)

<!-- breaking change id: 95 -->
