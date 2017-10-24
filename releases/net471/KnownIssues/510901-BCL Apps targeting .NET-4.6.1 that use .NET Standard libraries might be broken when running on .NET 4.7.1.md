# Applications targeting .NET 4.6.1 that use .NET Standard libraries might be broken when running on .NET 4.7.1

## Symptoms

Applications that target the .NET Framework 4.6.1 and use .NET Standard libraries may experience <xref:System.TypeLoadException> exceptions when running on the .NET Framework 4.7.1

## Cause

The .NET Framework 4.7.1 adds support for .NET Standard in-box. As part of this change, a few assemblies that used to ship independently from the .NET Framework have now been added to the .NET Framework. As these .NET Standard assemblies were not part of the .NET Framework prior to .NET 4.7.1, they were deployed with the application, and a binding redirect was added to the application's app.config file.

When running on the .NET Framework 4.7.1, where the assemblies are now part of the Framework, the application now has two types with different identities, and that leads to a <xref:System.TypeLoadException>. One type comes from the app-local assembly, and the other one comes from the .NET Framework assembly.

Also reported here: https://github.com/Microsoft/dotnet-framework-early-access/issues/9

## Impact

The following types are potentially impacted by this issue.
- `T:System.Data.Common.DbColumn`
- `T:System.Data.Common.DbDataReaderExtensions`
- `T:System.Data.Common.IDbColumnSchemaGenerator`
- `T:System.Diagnostics.StackFrameExtensions`
- `T:System.Globalization.GlobalizationExtensions`
- `T:System.Net.Sockets.SocketReceiveFromResult`
- `T:System.Net.Sockets.SocketReceiveMessageFromResult`
- `T:System.Net.Sockets.SocketTaskExtensions`
- `T:System.Runtime.CompilerServices.TupleElementNamesAttribute`
- `T:System.Runtime.InteropServices.Architecture`
- `T:System.Runtime.InteropServices.OSPlatform`
- `T:System.Runtime.InteropServices.RuntimeInformation`
- `T:System.Runtime.Serialization.DataContractSerializerExtensions`
- `T:System.Runtime.Serialization.ISerializationSurrogateProvider`
- `T:System.Security.Cryptography.ECCurve`
- `T:System.Security.Cryptography.ECParameters`
- `T:System.Security.Cryptography.ECPoint`
- `T:System.Security.Cryptography.IncrementalHash`
- `T:System.Security.SecureStringMarshal`
- `T:System.StringNormalizationExtensions`
- `T:System.Threading.PreAllocatedOverlapped`
- `T:System.Threading.ThreadPoolBoundHandle`
- `T:System.TupleExtensions`
- `T:System.ValueTuple`
- `T:System.ValueTuple`1`
- `T:System.ValueTuple`2`
- `T:System.ValueTuple`3`
- `T:System.ValueTuple`4`
- `T:System.ValueTuple`5`
- `T:System.ValueTuple`6`
- `T:System.ValueTuple`7`
- `T:System.ValueTuple`8`
- `T:System.Xml.XPath.XDocumentExtensions`

## Workarounds

There are two ways to work around this issue:
 - When running on .NET Framework 4.7.1, remove the binding redirects from the app.config file for the assemblies that are now part of the .NET Framework.
 - Re-target your application to target the .NET Framwork 4.7.1
 
