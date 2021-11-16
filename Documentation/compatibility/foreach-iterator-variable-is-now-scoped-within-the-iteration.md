## Foreach iterator variable is now scoped within the iteration, so closure capturing semantics are different (in C#5)

### Scope
Major

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Beginning with C# 5 (Visual Studio 2012), `foreach` iterator variables are scoped within the iteration. This can cause breaks if code was previously depending on the variables to not be included in the `foreach`'s closure. The symptom of this change is that an iterator variable passed to a delegate is treated as the value it has at the time the delegate is created, rather than the value it has at the time the delegate is invoked.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
Ideally, code should be updated to expect the new compiler behavior. If the old semantics are required, the iterator variable can be replaced with a separate variable which is explicitly placed outside of the loop's scope.

### Affected APIs
* Not detectable via API analysis

### Categories
Core

[More information](https://blogs.msdn.com/b/ericlippert/archive/2009/11/12/closing-over-the-loop-variable-considered-harmful.aspx)

<!-- breaking change id: 100 -->
