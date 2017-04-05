## 33: XmlTextReader DTD entity expansion is limited to 10,000,000 characters

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
If the limit of DTD entity expansion is too low 10,000,000, the value can be overridden with the [XmlReaderSettings.MaxCharactersFromEntities](https://msdn.microsoft.com/en-us/library/system.xml.xmlreadersettings.maxcharactersfromentities%28v=vs.110%29.aspx) property. An XmlReaderSettings with the proper MaxCharactersFromEntity value can be passed to [XmlReader.Create](https://msdn.microsoft.com/en-us/library/System.Xml.XmlReader.Create(v=vs.110).aspx)

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

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx)
