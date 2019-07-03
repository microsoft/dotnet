## NetDataContractSerializer fails to deserialize a ConcurrentDictionary serialized with a different .NET version

### Scope
Minor

### Version Introduced
4.5.1

### Source Analyzer Status
Planned

### Change Description

By design, the <xref:System.Runtime.Serialization.NetDataContractSerializer?displayProperty=name>
can be used only if both the serializing and deserializing ends share the same
CLR types. Therefore, it is not guaranteed that an object serialized with one
version of the .NET Framework can be deserialized by a different version.

<xref:System.Collections.Concurrent.ConcurrentDictionary`2?displayProperty=name>
is a type that is known to not to deserialize correctly if serialized with the
.NET Framework 4.5 or earlier and deserialized with the .NET Framework 4.5.1 or
later.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

There are a number of possible work-arounds for this issue:

- Upgrade the serializing computer to use the .NET Framework 4.5.1, as well.
- Use <xref:System.Runtime.Serialization.DataContractSerializer?displayProperty=name> instead of <xref:System.Runtime.Serialization.NetDataContractSerializer?displayProperty=name> as this does not expect the exact same CLR types at both serializing and deserializing ends.
- Use <xref:System.Collections.Generic.Dictionary`2?displayProperty=name> instead of <xref:System.Collections.Concurrent.ConcurrentDictionary`2?displayProperty=name> since it does not exhibit this particular 4.5->4.5.1 break.

### Affected APIs
* `M:System.Runtime.Serialization.NetDataContractSerializer.Deserialize(System.IO.Stream)`

### Category
Serialization

[More information](https://stackoverflow.com/questions/19585791/net-4-5-1-wcf-serialization-exception)

<!-- breaking change id: 110 -->
