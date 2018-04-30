# Applications targeting .NET 4.6.1 that use .NET Standard libraries might be broken when running on .NET 4.7.1

## Symptoms

Applications that target the .NET Framework 4.6.1 and use .NET Standard libraries may experience System.TypeLoadException exceptions when running on the .NET Framework 4.7.1

## Cause

The .NET Framework 4.7.1 adds support for .NET Standard in-box. As part of this change, a few assemblies that used to ship independently from the .NET Framework have now been added to the .NET Framework. As these .NET Standard assemblies were not part of the .NET Framework prior to .NET 4.7.1, they were deployed with the application, and a binding redirect was added to the application's app.config file.

When running on the .NET Framework 4.7.1, where the assemblies are now part of the Framework, the application now has two types with different identities, and that leads to a TypeLoadException. One type comes from the app-local assembly, and the other one comes from the .NET Framework assembly.

Also reported here: https://github.com/Microsoft/dotnet-framework-early-access/issues/9

## Impact

The following types are potentially impacted by this issue.

- System.Data.Common.DbColumn
- System.Data.Common.DbDataReaderExtensions
- System.Data.Common.IDbColumnSchemaGenerator
- System.Diagnostics.StackFrameExtensions
- System.Globalization.GlobalizationExtensions
- System.Net.Sockets.SocketReceiveFromResult
- System.Net.Sockets.SocketReceiveMessageFromResult
- System.Net.Sockets.SocketTaskExtensions
- System.Runtime.CompilerServices.TupleElementNamesAttribute
- System.Runtime.InteropServices.Architecture
- System.Runtime.InteropServices.OSPlatform
- System.Runtime.InteropServices.RuntimeInformation
- System.Runtime.Serialization.DataContractSerializerExtensions
- System.Runtime.Serialization.ISerializationSurrogateProvider
- System.Security.Cryptography.ECCurve
- System.Security.Cryptography.ECParameters
- System.Security.Cryptography.ECPoint
- System.Security.Cryptography.IncrementalHash
- System.Security.SecureStringMarshal
- System.StringNormalizationExtensions
- System.Threading.PreAllocatedOverlapped
- System.Threading.ThreadPoolBoundHandle
- System.TupleExtensions
- System.ValueTuple
- System.ValueTuple`1
- System.ValueTuple`2
- System.ValueTuple`3
- System.ValueTuple`4
- System.ValueTuple`5
- System.ValueTuple`6
- System.ValueTuple`7
- System.ValueTuple`8
- System.Xml.XPath.XDocumentExtensions

## Workarounds

There are two ways to work around this issue:
 - When running on .NET Framework 4.7.1, remove the binding redirects from the app.config file for the assemblies that are now part of the .NET Framework.
 - Re-target your application to target the .NET Framwork 4.7 or .NET Framework 4.7.1.
 
## Resolution

[09-Jan-2018] The fix for this issue is included  in the [Update for .NET Framework 4.7.1 - KB4054856](http://go.microsoft.com/fwlink/?LinkId=866028) for all platforms except Windows 10 Fall Creators Update.

For Windows 10 Fall Creators Update the fix is included in [KB4058258](https://support.microsoft.com/help/4058258/windows-10-update-kb4058258).
