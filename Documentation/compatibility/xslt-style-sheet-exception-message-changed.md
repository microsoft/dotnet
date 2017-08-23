## XSLT style sheet exception message changed

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

In the .NET Framework 4.5, the text of the error message when an XSLT file is
too complex is "The style sheet is too complex." In previous versions, the error
message was "XSLT compile error." Application code that depends on the text of
the error message will no longer work. However, the exception types remain the
same, so this change should have no real impact.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Update any app code depending on the exception message from this error condition
to expect the new message, or (even better) update the code to depend only on
the exception type (<xref:System.Xml.Xsl.XsltException?displayProperty=name>),
which has not changed.

### Affected APIs
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.String)`
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.Type)`
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.Xml.XmlReader)`
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.Xml.XPath.IXPathNavigable)`
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.Reflection.MethodInfo,System.Byte[],System.Type[])`
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.String,System.Xml.Xsl.XsltSettings,System.Xml.XmlResolver)`
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.Xml.XmlReader,System.Xml.Xsl.XsltSettings,System.Xml.XmlResolver)`
* `M:System.Xml.Xsl.XslCompiledTransform.Load(System.Xml.XPath.IXPathNavigable,System.Xml.Xsl.XsltSettings,System.Xml.XmlResolver)`

### Category
XML, XSLT

<!-- breaking change id: 35 -->
