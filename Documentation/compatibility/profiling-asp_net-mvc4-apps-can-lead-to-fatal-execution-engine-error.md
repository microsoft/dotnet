## Profiling ASP.Net MVC4 apps can lead to Fatal Execution Engine Error

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.5.2

### Source Analyzer Status
Not planned

### Change Description
Profilers using NGEN /Profile assemblies may crash profiled ASP.NET MVC4 applications on startup with a 'Fatal Execution Engine Exception'

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue is fixed in the .NET Framework 4.5.2. Alternatively, the profiler may avoid this issue by specifying `COR_PRF_DISABLE_ALL_NGEN_IMAGES` in its event mask.

### Affected APIs
* Not detectable via API analysis

### Category
ASP.NET

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/793730/clr-profiler-crashes-any-asp-net-mvc4-app-on-startup-due-to-ngen-profile-images)

<!-- breaking change id: 96 -->
