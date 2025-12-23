## Opt-in break to revert from different 4.5 SQL generation to simpler 4.0 SQL generation

### Scope
Transparent

### Version Introduced
4.5.2

### Source Analyzer Status
Not planned

### Change Description
Queries that produce JOIN statements and contain a call to a limiting operation without first using OrderBy now produce simpler SQL. After upgrading to .NET Framework 4.5, these queries produced more complicated SQL than previous versions.

- [ ] Quirked
- [x] Optional
- [ ] Build-time break

### Recommended Action
This feature is disabled by default. If Entity Framework generates extra JOIN statements that cause performance degradation, you can enable this feature by adding the following entry to the `<appSettings>` section of the application configuration (app.config) file:

```xml
<add key="EntityFramework_SimplifyLimitOperations" value="true" />
```

### Affected APIs
* Not detectable via API analysis

### Category
Entity Framework

<!-- MSDN lists this as a 'minor'-scope break, but it is 'transparent' here because it is an opt-in break -->

<!-- breaking change id: 50 -->
