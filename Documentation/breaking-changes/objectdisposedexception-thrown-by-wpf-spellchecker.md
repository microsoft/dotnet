## 174: ObjectDisposedException thrown by WPF spellchecker

### Scope
Edge

### Version Introduced
4.6.1

### Version Reverted
4.7

### Source Analyzer Status
NotPlanned

### Change Description
WPF applications occasionally crash during application shutdown with an ObjectDisposedException thrown by the spellchecker. This is fixed in .NET 4.7 WPF by handling the exception gracefully, and thus ensuring that applications are no longer adversely affected.It should be noted that occasional first-chance exceptions would continue to be observed in applications running under a debugger. 

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Upgrade to .NET 4.7

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
### Original Bug
231772
-->
