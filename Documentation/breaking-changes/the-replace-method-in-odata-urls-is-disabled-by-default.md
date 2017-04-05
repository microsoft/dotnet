## 29: The Replace method in OData URLs is disabled by default

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Beginning in the .NET Framework 4.5, the Replace method in OData URLs is disabled by default. When OData Replace is disabled (now by default), any user requests including replace functions (which are uncommon) will fail.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If the replace method is required (which is uncommon), it can be re-enabled through a [config settings](https://msdn.microsoft.com/en-us/library/system.data.services.configuration.dataservicesfeaturessection.replacefunction.aspx). However, an enabled replace method can open security vulnerabilities and should only be used after careful review.

### Affected APIs
* ``T:System.Data.Services.DataService`1``

### Category
Windows Communication Foundation (WCF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#wcf)
