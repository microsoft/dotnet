## BinaryFormatter can fail to find type from LoadFrom context

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
As of .NET Framework 4.5, a number of <xref:System.Xml.Serialization.XmlSerializer?displayProperty=name>
changes may cause differences in deserialization when using
<xref:System.Runtime.Serialization.Formatters.Binary.BinaryFormatter?displayProperty=name>
to deserialize types that had been loaded in the LoadFrom context. These changes
are due to the new ways <xref:System.Xml.Serialization.XmlSerializer?displayProperty=name>
now loads a type which causes different behavior when a
<xref:System.Runtime.Serialization.Formatters.Binary.BinaryFormatter?displayProperty=name> attempts to
deserialize to that type later on. The default serialization binder does not
automatically search the LoadFrom context, although it may have worked in some
circumstances based on the old behavior of XmlSerializer. Due to the changes,
when a type is being loaded from an assembly loaded in a different context, a
<xref:System.IO.FileNotFoundException?displayProperty=name> may be thrown.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If this exception is seen, the `Binder` property of the <xref:System.Runtime.Serialization.Formatters.Binary.BinaryFormatter?displayProperty=name> can be set to a custom binder that will find the correct type.

```csharp
var formatter = new BinaryFormatter { Binder = new TypeFinderBinder() }
```

And then the custom binder:
```csharp
public class TypeFinderBinder : SerializationBinder
{
	private static readonly string s_assemblyName = Assembly.GetExecutingAssembly().FullName;

	public override Type BindToType(string assemblyName, string typeName)
	{
		return Type.GetType(String.Format(CultureInfo.InvariantCulture, "{0}, {1}", typeName, s_assemblyName));
	}
}
```

### Affected APIs
* `T:System.Runtime.Serialization.Formatters.Binary.BinaryFormatter`
* `M:System.Runtime.Serialization.Formatters.Binary.BinaryFormatter.Deserialize(System.IO.Stream)`
* `M:System.Runtime.Serialization.Formatters.Binary.BinaryFormatter.Deserialize(System.IO.Stream,System.Runtime.Remoting.Messaging.HeaderHandler)`

### Category
Serialization

<!-- breaking change id: 147 -->
