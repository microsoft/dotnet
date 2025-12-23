## XmlSerializer serializes fields differently in .NET Framework 4.5

### Scope
Major

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Not planned

### Change Description

Changes in the
<xref:System.Xml.Serialization.XmlSerializer?displayProperty=name> in .NET
Framework 4.5 caused fields to be formatted differently in the serialized XML.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This behavior was corrected in a servicing update of .NET Framework 4.5. Please
update the .NET Framework 4.5, or upgrade to .NET Framework 4.5.1 or later, to
fix this issue. Alternatively, the following config setting will revert to 4.0
<xref:System.Xml.Serialization.XmlSerializer?displayProperty=name> behavior:

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

### Categories
XML, XSLT

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/761786/net-4-5-xmlserializer-produces-different-output-from-4-0)

<!-- breaking change id: 94 -->
