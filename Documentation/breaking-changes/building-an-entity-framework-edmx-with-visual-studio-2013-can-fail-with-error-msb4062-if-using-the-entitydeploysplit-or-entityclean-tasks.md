## 109: Building an Entity Framework edmx with Visual Studio 2013 can fail with error MSB4062 if using the EntityDeploySplit or EntityClean tasks

### Scope
Major

### Version Introduced
4.5.1

### Version Reverted
4.6

### Source Analyzer Status
Available

### Change Description
MSBuild 12.0 tools (included in Visual Studio 2013) changed msbuild file locations, causing older Entity Framework targets files to be invalid. The result is that `EntityDeploySplit` and `EntityClean` tasks fail because they are unable to find `Microsoft.Data.Entity.Build.Tasks.dll`. Note that this break is because of a toolset (msbuild/VS) change, not because of a .NET Framework change. It will only occur when upgrading developer tools, not when merely upgrading the .NET Framework.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
Entity Framework targets files are fixed to work with the new msbuild layout beginning in the .NET Framework 4.6. Upgrading to that version of the Framework will fix this issue. Alternatively, [this](http://stackoverflow.com/a/24249247/131944) workaround can be used to patch the targets files directly.

### Affected APIs
* Not detectable via API analysis

### Category
Entity Framework

[More information](http://stackoverflow.com/questions/20400054/entitydeploysplit-error-microsoft-data-entity-build-tasks-dll-missing/24249247#24249247)

