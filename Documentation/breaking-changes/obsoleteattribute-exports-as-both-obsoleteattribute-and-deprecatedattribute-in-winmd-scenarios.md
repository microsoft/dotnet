## 48: ObsoleteAttribute exports as both ObsoleteAttribute and DeprecatedAttribute in WinMD scenarios

### Scope
Edge

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description
When you create a Windows Metadata library (.winmd file), the ObsoleteAttribute attribute is exported as both ObsoleteAttribute and Windows.Foundation.DeprecatedAttribute.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
Recompilation of existing source code that uses the ObsoleteAttribute attribute may generate warnings when consuming that code from C++/CX or JavaScript. 

We do not recommend applying both ObsoleteAttribute and Windows.Foundation.DeprecatedAttribute to code in managed assemblies; it may result in build warnings. 

### Affected APIs
* Not detectable via API analysis

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/dn458356(v=vs.110).aspx)
