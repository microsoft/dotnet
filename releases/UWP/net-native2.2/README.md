# .NET native tools 2.2 (UWP 6.2.x) Release Notes

You can see what was included in each .NET Native 2.2 ([Microsoft.NETCore.UniversalWindowsPlatform 6.2.x](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)) release below.

When using Visual Studio, these packages require Visual Studio 2019 or Visual Studio 2017 Version 15.9.

### UWP 6.2.13 (October 13th, 2021)
- Fix data serialization on .NET Native
- Update clrcompression zlib from 1.2.8 to 1.2.11
- Fix F5 inner dev-loop performance issue by generating System.Private.Corelib Ready-To-Run image

### UWP 6.2.12 (February 9th, 2021)
- Error code RHBIND : error RHB0002: Failed to write PDB. Fix for build failures with RHBIN error when building Xamarin and SyncFusion UWP projects. This is an opt-in fix and requires customer to setting the msbuild property NoLinkerSymbols
- Fix to execution engine exception when loading InAppUI in Xamarin.

### UWP 6.2.11 (November 19th, 2020)
-	.NET Native fix for call to `string.Replace` does not terminate and goes into an infinite loop 
-	Fix is to consume updated Telemetry files which is shipped in UWP 6.2.11
- Fix denial of service (DoS) by cap the maximum length passed to the StringBuilder(int capacity) ctor
- Fix to avoid incorrectly leaking thread COM state to default thread pool by turning on AppContext switch by default. 6.2.10 had shipped the original fix but with this release the switch is enabled by default
- Fix for crashes seen in WireUpCoreRuntime on duplicate executables
- Fix ILT0005 error when building InMobiSDk. This Fix addresses an access violation in complier when building InMobiSDK resulting in ILT0005 error
- This build provides a workaround that resolves OOM issues for ARM64 compilation scenarios

### UWP 6.2.10 (March 18th, 2020)
- Fix for RhpCallFilterFunclet stack misalignment on ARM causing runtime failures
(https://github.com/dotnet/corert/pull/7744)
- Fix for compiler crashes seen for SixLabors.ImageSharp API when targeting x86 and trying to generate mixed floating point/vector code
- Fix for crashes seen when using System.IO.Directory.GetFiles and System.IO.DirectoryInfo.GetDirectories on ARM32 with UWP apps 
(https://github.com/dotnet/runtime/issues/27943#issuecomment-529400749)
- Fix for crashes seen in rhbind.exe for some Unity apps
- Fix to avoid incorrectly leaking COM thread state when returning threads to the OS thread pool
-	Fix for app crashes seen during garbage collection on ARM 32 due to heap corruption

### UWP 6.2.9 (August 23rd, 2019)

- Reduce optimizer maximum thread count for Store compilations to increase ingestion reliability
- Fix issue in the analysis engine related to unsafe patterns that could lead to NullReferenceException (https://github.com/dotnet/core/issues/2614)
- Fix gatekeeper errors due to bad System.Private.Uri AssemblyVersion
- Fix "Invalid IL" warning from some unsafe code patterns
- Fix type system issue regarding parameter constraints on methods (https://github.com/SixLabors/ImageSharp/issues/828)
- Fix interop compilation failure for gRPC Authentication package (https://github.com/grpc/grpc/issues/18188)
- Fix intop code generation failure for System.IO.ISoreafeItemHandleAccess.Create (https://developercommunity.visualstudio.com/content/problem/310750/release-compile-fails-due-to-errors-in-mcg-generat.html)
- Adjust garbage collection timing during interop to eliminate memory increase in UWP app when navigating between pages
- Fix issue leading to Access Violation in the garbage collector caused by ARM32 volatile registers not being populated correctly
- Fix reference assemblies for WCF so they have the expected public key (https://github.com/dotnet/wcf/issues/3743)
- Fix issue causing Visual Studio 2017 hangs during debugging sessions

### UWP 6.2.8 (March 13th, 2019)
- Fixes package publishing issues

### UWP 6.2.7 (March 12th, 2019)
- Adds support for ARM64
- Improved performance for debugging scenarios (F5)
- Addresses top customer issues with 6.1 and 6.2 Preview.
- Addresses some issues when used with ReactiveUI 4.1. It is still recommended that projects wishing to use this package add ShortcutGenericAnalysis flag set to true to the projects.
- Fix metadata reader issue leading to build failure when using Microsoft.ML.Net (https://github.com/XamlBrewer/UWP-MachineLearning-Sample/pull/1#issuecomment-469988557)
- Fix crashes during resouce loading for some locales (https://developercommunity.visualstudio.com/content/problem/386760/net-native-22-uwp-project-build-fail.html)
- Fix crashes caused by improper escaping for application assets with spaces in path (https://github.com/Microsoft/dotnet/issues/930)
- Add PackageConflictPreferredPackages property to avoid build breaks with certain package graphs
- Fix issues related to Store upload failures (Error 1201)
- Fix for a domain spoofing vulnerability which causes the meaning of a URI to change when International Domain Name encoding is applied. An attacker who successfully exploited the vulnerability could redirect a URI. (https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-0657)


### UWP 6.2.0-preview1-26926-04 Preview (October 2nd, 2018) 
These are preview bits in advance of the release in November 2018 available in Visual Studio 15.9 Preview 3
- Improved performance for debugging scenarios (F5)
- Addresses bugs when used with React Framework 4.1 

### UWP 6.2.0-preview1-26831-02 Preview (September 11th, 2018) 
These are preview bits in advance of the release in November 2018 available in Visual Studio 15.9 Preview 2
- Integrates support for ARM64 into the Visual Studio tooling experience
- Addresses top cusomter issues with 6.1 and 6.2 Preview.

### UWP 6.2.0-Preview1-26502-02 Preview (May 7th, 2018) 
These are preview bits in advance of the release at the end of 2018
- Adds support for ARM64
