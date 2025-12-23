## Deserialization of objects across appdomains can fail

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
See [Mitigation: Deserialization of Objects Across App Domains](~/docs/framework/migration-guide/mitigation-deserialization-of-objects-across-app-domains.md)

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 67 -->
