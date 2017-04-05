## 147: BinaryFormatter can fail to find type from LoadFrom context

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
As of .NET Framework 4.5, a number of XmlSerializer changes may cause differences in deserialization when using `BinaryFormatter` to deserialize types that had been loaded in the
LoadFrom context. These changes are due to the new ways `XmlSerializer` now loads a type which causes different behavior when a BinaryFormatter attempts to deserialize to that type
later on. The default serialization binder does not automatically search the LoadFrom context, although it may have worked in some circumstances based on the old behavior of 
XmlSerializer. Due to the changes, when a type is being loaded from an assembly loaded in a different context, a FileNotFoundException may be thrown.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If this exception is seen, the `Binder` property of the `BinaryFormatter` can be set to a custom binder that will find the correct type.

```C#
var formatter = new BinaryFormatter { Binder = new TypeFinderBinder() }
```

And then the custom binder:
```C#
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
