## EF no longer throws for QueryViews with specific characteristics

### Scope
Edge

### Version Introduced
4.5.2

### Source Analyzer Status
Not planned

### Change Description

Entity Framework no longer throws a
<xref:System.StackOverflowException?displayProperty=name> exception when an app
executes a query that involves a QueryView with a 0..1 navigation property that
attempts to include the related entities as part of the query. For example, by
calling `.Include(e => e.RelatedNavProp)`.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This change only affects code that uses QueryViews with 1-0..1 relationships
when running queries that call .Include. It improves reliability and should be
transparent to almost all apps. However, if it causes unexpected behavior, you
can disable it by adding the following entry to the `<appSettings>` section of
the app's configuration file:

```xml
<add key="EntityFramework_SimplifyUserSpecifiedViews" value="false" />
```

### Affected APIs
* Not detectable via API analysis

### Category
Entity Framework

<!-- breaking change id: 69 -->
