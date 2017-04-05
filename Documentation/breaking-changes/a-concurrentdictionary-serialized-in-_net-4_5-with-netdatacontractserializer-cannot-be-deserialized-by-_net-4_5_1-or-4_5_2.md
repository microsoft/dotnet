## 133: A ConcurrentDictionary serialized in .NET 4.5 with NetDataContractSerializer cannot be deserialized by .NET 4.5.1 or 4.5.2

### Scope
Minor

### Version Introduced
4.5.1

### Version Reverted
4.6

### Source Analyzer Status
Available

### Change Description
Due to internal changes to the type, `System.Collections.Concurrent.ConcurrentDictionary` objects that are serialized with the .NET Framework 4.5
using the `NetDataContractSerializer` cannot be deserialized in the .NET Framework 4.5.1 or in the .NET Framework 4.5.2.

Note that moving the other direction (serializing with the .NET Framework 4.5.x and deserializing with the .NET Framework 4.5) works. Similarly,
all 4.x cross-version serialization works with the .NET Framework 4.6.

Serializing and deserializing with a single version of the .NET Framework is not affected.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If it is necessary to serialize and deserialize a ConcurrentDictionary between the .NET Framework 4.5 and .NET Framework 4.5.1/4.5.2, an alternate serializer like the 
DataContractSerializer or BinaryFormatter serializer should be used instead of the NetDataContractSerializer.

Alternatively, because this issue is addressed in the .NET Framework 4.6, it may be solved by upgrading to that version of the .NET Framework.

### Affected APIs
* Not detectable via API analysis

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/dn458360(v=vs.110).aspx#Core)

<!--
    ### Notes
    Should be fairly easy to detect ConcurrentDictionary objects being serialized/deserialized by a NetDataContractSerializer.
-->

