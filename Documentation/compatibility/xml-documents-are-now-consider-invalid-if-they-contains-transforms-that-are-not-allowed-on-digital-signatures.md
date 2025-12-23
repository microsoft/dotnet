## SignedXml and EncryptedXml Breaking Changes

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Planned

### Change Description

In .NET Framework 4.6.2, Security fixes in
<xref:System.Security.Cryptography.Xml.SignedXml?displayProperty=name> and
<xref:System.Security.Cryptography.Xml.EncryptedXml?displayProperty=name> lead
to different run-time behaviors. For example,

* If a document has multiple elements with the same `id` attribute and a
  signature targets one of those elements as the root of the signature, the
  document will now be considered invalid.
* Documents using non-canonical XPath transform algorithms in references are now
  considered invalid.
* Documents using non-canonical XSLT transform algorithms in references are now
  consider invalid.
* Any program making use of external resource detached signatures will be unable
  to do so.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Developers might want to review the usage of
<xref:System.Security.Cryptography.Xml.XmlDsigXsltTransform> and
<xref:System.Security.Cryptography.Xml.XmlDsigXsltTransform>, as well as types
derived from <xref:System.Security.Cryptography.Xml.Transform> since a document
receiver may not be able to process it.

### Affected APIs

* `T:System.Security.Cryptography.Xml.Transform`
* `T:System.Security.Cryptography.Xml.XmlDsigXPathTransform`
* `T:System.Security.Cryptography.Xml.XmlDsigXsltTransform`

### Category
Security

[More information](https://github.com/Microsoft/dotnet/blob/master/releases/net462/dotnet462-changes.md)

<!-- breaking change id: 156 -->
