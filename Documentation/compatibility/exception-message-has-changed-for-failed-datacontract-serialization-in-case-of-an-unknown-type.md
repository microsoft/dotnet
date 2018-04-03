## Exception message has changed for failed DataContract serialization in case of an unknown type

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Planned

### Change Description

Beginning in the .NET Framework 4.6, the exception message given if a
<xref:System.Runtime.Serialization.DataContractSerializer?displayProperty=name>
or <xref:System.Runtime.Serialization.Json.DataContractJsonSerializer?displayProperty=name>
fails to serialize or deserialize due to missing 'known types' has been clarified.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Apps should not depend on specific exception messages. If an app depends on
this message, either update it to expect the new message or (preferably)
change it to depend only on the exception type.

### Affected APIs
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type)`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.Collections.Generic.IEnumerable{System.Type})`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.Runtime.Serialization.Json.DataContractJsonSerializerSettings)`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.String)`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.String,System.Collections.Generic.IEnumerable{System.Type})`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.Xml.XmlDictionaryString)`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.Xml.XmlDictionaryString,System.Collections.Generic.IEnumerable{System.Type})`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate,System.Boolean)`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.String,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate,System.Boolean)`
* `M:System.Runtime.Serialization.Json.DataContractJsonSerializer.#ctor(System.Type,System.Xml.XmlDictionaryString,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate,System.Boolean)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Runtime.Serialization.DataContractSerializerSettings)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Collections.Generic.IEnumerable{System.Type})`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.String,System.String)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.String,System.String,System.Collections.Generic.IEnumerable{System.Type})`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Xml.XmlDictionaryString,System.Xml.XmlDictionaryString)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Xml.XmlDictionaryString,System.Xml.XmlDictionaryString,System.Collections.Generic.IEnumerable{System.Type})`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate,System.Runtime.Serialization.DataContractResolver)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.String,System.String,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.String,System.String,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate,System.Runtime.Serialization.DataContractResolver)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Xml.XmlDictionaryString,System.Xml.XmlDictionaryString,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate)`
* `M:System.Runtime.Serialization.DataContractSerializer.#ctor(System.Type,System.Xml.XmlDictionaryString,System.Xml.XmlDictionaryString,System.Collections.Generic.IEnumerable{System.Type},System.Int32,System.Boolean,System.Boolean,System.Runtime.Serialization.IDataContractSurrogate,System.Runtime.Serialization.DataContractResolver)`

### Category
Serialization

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/806395/misleading-exception-with-datacontractjsonserializer)

<!-- breaking change id: 106 -->
