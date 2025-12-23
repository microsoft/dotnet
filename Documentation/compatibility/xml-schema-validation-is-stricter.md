## XML schema validation is stricter

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
In the .NET Framework 4.5, XML schema validation is more strict. If you use xsd:anyURI to validate a URI such as a mailto protocol, validation fails if there are spaces in the URI. In previous versions of the .NET Framework, validation succeeded. The change affects only applications that target the .NET Framework 4.5.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
If looser .NET Framework 4.0 validation is needed, the validating application can target version 4.0 of the .NET Framework. When retargeting to .NET Framework 4.5, however, code review should be done to be sure that invalid URIs (with spaces) are not expected as attribute values with the anyURI data type.

### Affected APIs
* Not detectable via API analysis

### Category
XML, XSLT

<!-- breaking change id: 2 -->
