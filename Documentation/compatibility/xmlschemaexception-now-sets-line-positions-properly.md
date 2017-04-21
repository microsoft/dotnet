## XmlSchemaException now sets line positions properly

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

If the <xref:System.Xml.Linq.LoadOptions.SetLineInfo>
value is passed to the Load method and a validation error occurs, the
<xref:System.Xml.Schema.XmlSchemaException.LineNumber>
and <xref:System.Xml.Schema.XmlSchemaException.LinePosition>
properties now contain line information.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Exception-handling code that assumes
<xref:System.Xml.Schema.XmlSchemaException.LineNumber>
and <xref:System.Xml.Schema.XmlSchemaException.LinePosition>
will not be set should be updated since these properties will now be set
properly when SetLineInfo is used while loading XML.

### Affected APIs
* `F:System.Xml.Linq.LoadOptions.SetLineInfo`

### Category
XML, XSLT

<!-- breaking change id: 19 -->
