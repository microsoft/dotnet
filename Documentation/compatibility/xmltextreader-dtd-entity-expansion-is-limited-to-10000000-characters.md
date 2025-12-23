## XmlTextReader DTD entity expansion is limited to 10,000,000 characters

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
DTD entity expansion is now limited to 10,000,000 characters. Loading XML files without DTD entity expansion or with limited DTD entity expansion is unaffected. Files with DTD entities that expand to more than 10,000,000 characters fail to load, and now throw an exception.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If the limit of DTD entity expansion is too low 10,000,000, the value can be
overridden with the
<xref:System.Xml.XmlReaderSettings.MaxCharactersFromEntities>
property. An <xref:System.Xml.XmlReaderSettings?displayProperty=name> with the
proper <xref:System.Xml.XmlReaderSettings.MaxCharactersFromEntities?displayProperty=name>
value can be passed to `XmlReader.Create` that takes
<xref:System.Xml.XmlReaderSettings?displayProperty=name>
(ie. <xref:System.Xml.XmlReader.Create(System.String,System.Xml.XmlReaderSettings)>)

### Affected APIs
* `T:System.Xml.XmlTextReader`
* `M:System.Xml.XmlTextReader.#ctor`
* `M:System.Xml.XmlTextReader.#ctor(System.IO.Stream)`
* `M:System.Xml.XmlTextReader.#ctor(System.IO.Stream,System.Xml.XmlNameTable)`
* `M:System.Xml.XmlTextReader.#ctor(System.IO.Stream,System.Xml.XmlNodeType,System.Xml.XmlParserContext)`
* `M:System.Xml.XmlTextReader.#ctor(System.IO.TextReader)`
* `M:System.Xml.XmlTextReader.#ctor(System.IO.TextReader,System.Xml.XmlNameTable)`
* `M:System.Xml.XmlTextReader.#ctor(System.String)`
* `M:System.Xml.XmlTextReader.#ctor(System.String,System.IO.Stream)`
* `M:System.Xml.XmlTextReader.#ctor(System.String,System.IO.Stream,System.Xml.XmlNameTable)`
* `M:System.Xml.XmlTextReader.#ctor(System.String,System.IO.TextReader)`
* `M:System.Xml.XmlTextReader.#ctor(System.String,System.IO.TextReader,System.Xml.XmlNameTable)`
* `M:System.Xml.XmlTextReader.#ctor(System.String,System.Xml.XmlNameTable)`
* `M:System.Xml.XmlTextReader.#ctor(System.String,System.Xml.XmlNodeType,System.Xml.XmlParserContext)`
* `M:System.Xml.XmlTextReader.#ctor(System.Xml.XmlNameTable)`

### Category
XML, XSLT

<!-- breaking change id: 33 -->
