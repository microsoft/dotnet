## XmlSerializer fails while serializing a type that hides an accessible member with an inaccessible one

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

When serializing a derived type, the
<xref:System.Xml.Serialization.XmlSerializer?displayProperty=name> can fail if
the type contains an inaccessible field or property that hides (via the 'new'
keyword) a field or property of the same name that was previously accessible
(public, for example) on the base type.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This problem can be solved by making the new, hiding member accessible to the
<xref:System.Xml.Serialization.XmlSerializer?displayProperty=name> (by marking
it public, for example).

Alternatively, the following config setting will revert to 4.0
<xref:System.Xml.Serialization.XmlSerializer?displayProperty=name> behavior,
which will fix the problem:

```xml
<system.xml.serialization>
	<xmlSerializer useLegacySerializerGeneration="true" />
</system.xml.serialization>
```

### Affected APIs
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.IO.Stream,System.Object)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.IO.TextWriter,System.Object)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.Object,System.Xml.Serialization.XmlSerializationWriter)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.Xml.XmlWriter,System.Object)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.IO.Stream,System.Object,System.Xml.Serialization.XmlSerializerNamespaces)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.IO.TextWriter,System.Object,System.Xml.Serialization.XmlSerializerNamespaces)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.Xml.XmlWriter,System.Object,System.Xml.Serialization.XmlSerializerNamespaces)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.Xml.XmlWriter,System.Object,System.Xml.Serialization.XmlSerializerNamespaces,System.String)`
* `M:System.Xml.Serialization.XmlSerializer.Serialize(System.Xml.XmlWriter,System.Object,System.Xml.Serialization.XmlSerializerNamespaces,System.String,System.String)`

### Category
Serialization

[More information](https://stackoverflow.com/questions/14689305/serialization-breaks-in-net-4-5)

<!-- breaking change id: 140 -->
