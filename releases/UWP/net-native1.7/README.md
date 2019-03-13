# .NET native tools 1.7 Release Notes
You can see what was included in each .NET Native 1.7 ([Microsoft.NETCore.UniversalWindowsPlatform 5.4.x](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)) release below.

When using Visual Studio these packages require Visual Studio 2017 or later.

### UWP 5.4.7 | UWP 6.0.15 | UWP 6.1.12 | UWP 6.2.7 (.NET native tools 1.7.6) (March 13th, 2019)
- Fix for a domain spoofing vulnerability which causes the meaning of a URI to change when International Domain Name encoding is applied. An attacker who successfully exploited the vulnerability could redirect a URI. (https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-0657)

### UWP 6.1.7 (.NET native tools 1.7.3) (July 27th, 2018)
- Fixed CVE-2018-8356: Security Feature Bypass in X509 Certificate Validation: https://github.com/dotnet/announcements/issues/73

### UWP 6.0.6 (.NET native tools 1.7.3) (January 9th, 2018)
- Fixed CVE-2018-0786: Security Feature Bypass in X509 Certificate Validation: https://github.com/Microsoft/dotnet/issues/597

### UWP 6.0.5 (.NET native tools 1.7.3) (December 12th, 2017)
- Fixed a GC memory leak. [506391]

### UWP 6.0.4 (.NET native tools 1.7.2) (December 4th, 2017)
- Fixed an unhandled exception when ClientWebSocket loses connection to server. [518456]
- Fixed a regression in the 1.7 toolchain causing winmd file corruption when the file stream is left open. [496929]

### UWP 5.4.4 (.NET native tools 1.7.1) (July 27th, 2018)
- Fixed CVE-2018-8356: Security Feature Bypass in X509 Certificate Validation: https://github.com/dotnet/announcements/issues/73

### UWP 5.4.2 (.NET native tools 1.7.1) (January 9th, 2018)
- Fixed CVE-2018-0786: Security Feature Bypass in X509 Certificate Validation: https://github.com/Microsoft/dotnet/issues/597

### UWP 5.4.1 (.NET native tools 1.7.1) (October 9th, 2017)
- Fixed an issue with Microsoft.NetNative.targets that prevented C++ hybrid apps from compiling; apps would fail to compile due to an attempt to write a file to a folder that does not exist. [511674]

### UWP 5.4.0 (.NET native tools 1.7.0) (August 11th, 2017)

#### Improved Diagnostics and Better Support for Portable PDBs
- In .NET Native 1.7, we added support for the new [Portable PDB format](https://github.com/dotnet/corefx/blob/master/src/System.Reflection.Metadata/specs/PortablePdb-Metadata.md) for representing symbol information in the .NET Native UWP compiler. The portable PDB format was originally developed to support cross-platform symbol information for managed code as well as drastically reduce the size of debug info - the format makes use of the MSIL module metadata instead of duplicating it and, because of this, it is typically an order of magnitude shorter than the equivalent Windows PDB.  In addition to that, the portable PDB format supports an "embedded" flavor in which the symbol information is directly attached to the MSIL executable in form of a binary blob, making it much easier to deploy such managed binaries, not having to care about two different files (with all the related problems of mutual compatibility, signing etc.). The debugging experience is on par with Windows PDB's - we encode the same debug information just in a more compact manner.  The previous version of the .NET Native toolchain was oblivious of the portable PDB format. [1640097]

- Improved the debug experience for apps compiled with "/debug:embedded" [364639]

#### Fixes for Build Warnings and other Compilation Improvements
- Fixed an issue that caused MAKEPRI to emit a spurious build warning [378512]
- Fixed an issue that prevented embedding a win32 resource into a C# UWP project [370533]
- Fixed an MSBuild targets issue that caused UWP App Release builds to fail occasionally (Error MSB6003: The specified task executable "ilc.exe" could not be run. The handle is invalid) [401406]
- Fixed a build crash when using ValueTuple with embedded null values in the string[] passed to TupleElementNamesAttribute [409209]

#### Fixes for Localization and non-English Scenarios
- Fixed an issue where string resources emitted by Microsoft.NetNative.IL2IL were English-only and not localized  [438193]

#### Fixes for Crashes and other Application Reliability Improvements
- Fixed an issue where System.Reflection would sometimes return two copies of every Attribute in an assembly [392708]
- Fixed an issue that caused System.ServiceModel.MessageParameterAttribute to not work properly in C# UWP projects [394307]
- Fixed a crash with obfuscated applications [396131]
- Fixed a WinMD data corruption issue [430881]
- Fixed Watson-reported crashes in .NET Native 1.6 [432913]
- Fixed a crash in Module::DoCustomImports [432987]
- Fixed incorrect data reported in telemetry [443373]
- Upgraded to newer VSTelemetry SDK and dependent package versions [442135]
- Improved telemetry handling of internal usage [444253]
- Fixed crash in optimizing compiler c2n.dll [300136, 300146]
- Fixed an issue where memory barrier is implemented as no-op on x86 [452729]

## Resources

- [Getting Started with .NET Native](https://docs.microsoft.com/en-us/dotnet/framework/net-native/getting-started-with-net-native)
- [Microsoft.NETCore.UniversalWindowsPlatform NuGet Package Details](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)
- [Windows Dev Center](https://developer.microsoft.com/en-us/windows/apps/getstarted)
- [Downloads and tools for Windows 10](https://developer.microsoft.com/en-us/windows/downloads)
