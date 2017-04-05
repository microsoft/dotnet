## 67: Deserialization of objects across appdomains can fail

### Scope
Edge

### Version Introduced
4.5.1

### Source Analyzer Status
Not planned

### Change Description
In some cases, when an app uses two or more app domains with different application bases, trying to deserialize objects in the logical call context across app domains throws an exception. 

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
See [Mitigation: Deserialization of Objects Across App Domains](https://msdn.microsoft.com/en-us/library/dn458353(v=vs.110).aspx)

### Affected APIs
* Not detectable via API analysis

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/dn458360(v=vs.110).aspx)
