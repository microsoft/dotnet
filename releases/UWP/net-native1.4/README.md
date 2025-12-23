# .NET Native 1.4 (UWP 5.2.x) Release Notes

You can see what was included in each .NET Native 1.4 ([Microsoft.NETCore.UniversalWindowsPlatform 5.2.x](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)) release, below.

When using Visual Studio these packages require Visual Studio 2015 Update 3 or later.

### 5.2.9 (March 13th, 2019)
- Fix for a domain spoofing vulnerability which causes the meaning of a URI to change when International Domain Name encoding is applied. An attacker who successfully exploited the vulnerability could redirect a URI. (https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-0657)

### 5.2.6 (July 27th, 2018)
- Fixed CVE-2018-8356: Security Feature Bypass in X509 Certificate Validation: https://github.com/dotnet/announcements/issues/73

### 5.2.4 (January 9th, 2018)
- Fixed CVE-2018-0786: Security Feature Bypass in X509 Certificate Validation: https://github.com/Microsoft/dotnet/issues/597

### 5.2.3 (March 7, 2017)
- Fixed an [issue](https://github.com/dotnet/corefx/issues/10374) that caused DataContractJsonSerializer to fail to serialize any [DataContract] type whose default constructor is not public.
- Fixed a regression in 5.2.2 where [4 Libraries were accidently no longer referenced by default](https://github.com/dotnet/corefx/issues/10338)
    - System.Collections.NonGeneric
    - System.Collections.Specialized
    - System.Threading.Overlapped
    - System.Xml.XmlDocument

### 5.2.2 (July 14, 2016)
You can read more about these changes in the Visual Studio 2015 Update 3 blog [post](https://www.visualstudio.com/en-us/news/releasenotes/vs2015-update3-vs).

- Fixed several customer reported bugs.
- Improved release build compilation times of large applications.
- Improved runtime performance for XAML applications and Unity games. 

## Resources
- [Getting Started with .NET Native](https://docs.microsoft.com/en-us/dotnet/framework/net-native/getting-started-with-net-native)
- [Microsoft.NETCore.UniversalWindowsPlatform NuGet Package Details](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)
- [Windows Dev Center](https://developer.microsoft.com/en-us/windows/apps/getstarted)
- [Downloads and tools for Windows 10](https://developer.microsoft.com/en-us/windows/downloads)
