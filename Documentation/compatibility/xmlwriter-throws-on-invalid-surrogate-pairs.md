## XmlWriter throws on invalid surrogate pairs

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Planned

### Change Description

For apps that target the .NET Framework 4.5.2 or previous versions, writing an
invalid surrogate pair using exception fallback handling does not always throw
an exception. For apps that target the .NET Framework 4.6, attempting to write
an invalid surrogate pair throws an
<xref:System.ArgumentException?displayProperty=name>.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

If necessary, this break can be avoided by targeting the .NET Framework 4.5.2 or
earlier. Alternatively, invalid surrogate pairs can be pre-processed into valid
xml prior to writing them.

### Affected APIs
* `M:System.Xml.XmlWriter.WriteAttributeString(System.String,System.String)`
* `M:System.Xml.XmlWriter.WriteAttributeString(System.String,System.String,System.String)`
* `M:System.Xml.XmlWriter.WriteAttributeString(System.String,System.String,System.String,System.String)`
* `M:System.Xml.XmlWriter.WriteAttributeStringAsync(System.String,System.String,System.String,System.String)`
* `M:System.Xml.XmlWriter.WriteCData(System.String)`
* `M:System.Xml.XmlWriter.WriteCDataAsync(System.String)`
* `M:System.Xml.XmlWriter.WriteChars(System.Char[],System.Int32,System.Int32)`
* `M:System.Xml.XmlWriter.WriteCharsAsync(System.Char[],System.Int32,System.Int32)`
* `M:System.Xml.XmlWriter.WriteComment(System.String)`
* `M:System.Xml.XmlWriter.WriteCommentAsync(System.String)`
* `M:System.Xml.XmlWriter.WriteEntityRef(System.String)`
* `M:System.Xml.XmlWriter.WriteEntityRefAsync(System.String)`
* `M:System.Xml.XmlWriter.WriteRaw(System.Char[],System.Int32,System.Int32)`
* `M:System.Xml.XmlWriter.WriteProcessingInstruction(System.String,System.String)`
* `M:System.Xml.XmlWriter.WriteProcessingInstructionAsync(System.String,System.String)`
* `M:System.Xml.XmlWriter.WriteRaw(System.String)`
* `M:System.Xml.XmlWriter.WriteRawAsync(System.Char[],System.Int32,System.Int32)`
* `M:System.Xml.XmlWriter.WriteRawAsync(System.String)`
* `M:System.Xml.XmlWriter.WriteString(System.String)`
* `M:System.Xml.XmlWriter.WriteStringAsync(System.String)`
* `M:System.Xml.XmlWriter.WriteSurrogateCharEntity(System.Char,System.Char)`
* `M:System.Xml.XmlWriter.WriteSurrogateCharEntityAsync(System.Char,System.Char)`
* `M:System.Xml.XmlWriter.WriteValue(System.String)`

### Category
XML, XSLT

<!--
    ### Notes
    Analyzer wouldn't add much over ApiPort, but we could do basic parameter analysis
    Single-diagnostic compilation action analyzer?? Depends on how likely it is we think we could usefully analyze arguments to these methods (and whether they contained invalid surrogate pairs)
-->

<!-- breaking change id: 81 -->
