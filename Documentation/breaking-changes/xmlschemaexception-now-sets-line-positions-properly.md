## 19: XmlSchemaException now sets line positions properly

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
If the LoadOptions.SetLineInfo value is passed to the Load method and a validation error occurs, the XmlSchemaException.LineNumber and XmlSchemaException.LinePosition properties now contain line information.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Exception-handling code that assumes XmlSchemaException.LineNumber and XmlSchemaException.LinePosition will not be set should be updated since these properties will now be set properly when SetLineInfo is used while loading XML.

### Affected APIs
* `F:System.Xml.Linq.LoadOptions.SetLineInfo`

### Category
XML, XSLT

[More information](https://msdn.microsoft.com/en-us/library/hh367887#xml)
