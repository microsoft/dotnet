## Sql_variant data uses sql_variant collation rather than database collation

### Scope
Transparent

### Version Introduced
4.5

### Source Analyzer Status
Not planned

### Change Description
`sql_variant` data uses `sql_variant` collation rather than database collation.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This change addresses possible data corruption if the database collation differs from the `sql_variant` collation. Applications that rely on the corrupted data may experience failure.

### Affected APIs
* Not detectable via API analysis

### Category
Data

<!-- breaking change id: 72 -->
