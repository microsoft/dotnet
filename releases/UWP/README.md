# Microsoft.NETCore.UniversalWindowsPlatform NuGet Package Releases

You can learn about Microsoft.NETCore.UniversalWindowsPlatform [releases](#releases), below. See [resources](#resources) for additional information.

## Release Notes

You can see what was included in each Microsoft.NETCore.UniversalWindowsPlatform release.

### 5.3.3 (April 24, 2017)

- Corrected an [issue](http://stackoverflow.com/questions/43530071/how-to-fix-app-submission-error-of-1300) for projects that have Visual Studio configuration values that are not "DEBUG" or "RELEASE" that causes Windows Store submission failure (error code 1300). For example, most Unity apps use a configuration named "Master". 

When using Visual Studio this package requires Visual Studio 2017 or later.

### 5.3.2 (April 6, 2017)

- Fixed an issue that caused MAKEPRI build warnings to be emitted when building app packages for UWP projects.

When using Visual Studio this package requires Visual Studio 2017 or later.

### 5.3.1 (March 7, 2017)

- Fixes [DataContractJsonSerializer failing in Microsoft.NetCore.UniversalWindowsPlatform 5.3.0](https://github.com/dotnet/corefx/issues/10374)
- Fixes a regression in 5.3.0 where [4 Libraries were accidently no longer referenced by default](https://github.com/dotnet/corefx/issues/10338)
    - System.Collections.NonGeneric
    - System.Collections.Specialized
    - System.Threading.Overlapped
    - System.Xml.XmlDocument

When using Visual Studio this package requires Visual Studio 2017 or later.

### 5.3.0 (January 27, 2017)

- .NET Native 1.6.

When using Visual Studio this package requires Visual Studio 2017 or later.


### 5.2.3 (March 7, 2017)

- Fixes [DataContractJsonSerializer failing in Microsoft.NetCore.UniversalWindowsPlatform 5.2.2](https://github.com/dotnet/corefx/issues/10374)
- Fixes a regression in 5.2.2 where [4 Libraries were accidently no longer referenced by default](https://github.com/dotnet/corefx/issues/10338)
    - System.Collections.NonGeneric
    - System.Collections.Specialized
    - System.Threading.Overlapped
    - System.Xml.XmlDocument

When using Visual Studio this package requires Visual Studio 2015 Update 3 or later.

### 5.2.2 (July 14, 2016)

- .NET Native 1.4.
- Universal Windows Platform 5.2.2 is the default in-box reference in Visual Studio 2017.

When using Visual Studio this package requires Visual Studio 2015 Update 3 or later.

## Resources

- [Microsoft.NETCore.UniversalWindowsPlatform NuGet Package Details](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)
- [Windows Dev Center](https://developer.microsoft.com/en-us/windows/apps/getstarted)
- [Downloads and tools for Windows 10](https://developer.microsoft.com/en-us/windows/downloads)
