## Null coalescer values are not visible in debugger until one step later

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Not planned

### Change Description
A bug in the .NET Framework 4.5 causes values set via a null coalescing operation to not be visible in the debugger immediately after the assignment operation is executed when running on the 64-bit version of the Framework.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Stepping one additional time in the debugger will cause the local/field's value to be correctly updated. Also, this issue has been fixed in the .NET Framework 4.6; upgrading to that version of the Framework should solve the issue.

### Affected APIs
* Not detectable via API analysis

### Category
Debugger

[More information](https://stackoverflow.com/questions/19352130/why-doesnt-the-null-coalescing-operator-work-in-this-situation)

<!-- breaking change id: 123 -->
