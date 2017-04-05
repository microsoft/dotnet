## 20: System.Activities is now APTCA

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
The assembly is marked with the AllowPartiallyTrustedCallersAttribute attribute.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Derived classes cannot be marked with the SecurityCriticalAttribute. Previously, derived types had to be marked with the SecurityCriticalAttribute. However, this change should have no real impact.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887)
