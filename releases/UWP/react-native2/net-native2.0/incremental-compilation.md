# .NET Native 2.0 Incremental Build Support Preview

By default, UWP apps use .NET Core runtime (with its JIT) in Debug builds (F5 scenario) and .NET Native compiler and runtime for Release builds. There are inherent differences between the two runtimes both in behavior (for example reflection) as well as performance characteristics. This means that there might be situations where the code works well with CoreCLR but shows some undesirable behavior on .NET Native. Switching to release build to find these issues is cumbersome.
While it is possible to turn on .NET Native even for Debug builds today, the compilation can take a long time which makes the typical developer cycle slow.  As part of the [.NET Native 2.0 release](README.md), .NET Native incremental build support is trying to address this by providing a better Debug build experience while using the .NET Native compiler and runtime.

This new build mode only recompiles assemblies which have changed or those which have dependencies which have changed. It also intentionally avoids some expensive compilation steps favoring faster compilation time over smaller and faster code (unlike the Release build mode which is the exact opposite). This new behavior can substantially reduce the compilation time of an application using the .NET Native tool chain.
Using .NET Native incremental build mode allows developers to use the .NET Native compiler and runtime for the app development, avoiding issues caused by differences between the CoreCLR and .NET Native runtimes while still maintaining a good developer experience.

Please note that .NET Native incremental build is a feature preview. While it is much faster in most cases than normal build modes, we still expect to improve the compiler performance as we get closer to the final release of this feature. There are also some known issues which can lead to failures specific to this build mode. Please find the list of known issues below.
As of now the .NET Native incremental build is rather slow when there's a change in the WinRT interop the app uses as it will trigger almost a full rebuild. This is typically the case when the app's XAML or XAML related code is edited. As such we would recommend to keep using the .NET Core runtime based build while iterating on the UI of the app. The experience with .NET Native incremental build in this case would not be ideal.

## How to enable .NET Native 2.0 Incremental Build Support

Currently the new build mode is only supported in Debug configurations of UWP apps which use the shared framework package. To turn it on please follow these steps:
1. In the project settings for the UWP app, under the Build tab turn on the "Compile with .NET Native tool chain" for the Debug configuration.
2. Open the project file for the UWP application in a text editor and add this property group:

```
<PropertyGroup Condition="'$(Configuration)'=='Debug'">
    <UseDotNetNativeIncremental>true</UseDotNetNativeIncremental>
</PropertyGroup>
```
3. After making these changes, please make sure to cleanly Rebuild the entire solution in the Debug configuration first. Subsequent incremental builds should then work as usual. You should be able to develop, build, run and debug the application as usual. 

To go back and forth between .NET Native and .NET Core just use the checkbox in the build configuration tab of the project.

The incremental build is only supported on .NET Native 2.0, which in turn is only used if the app has its minimum target version of Windows SDK set to the Windows Fall Creators Update SDK.

## Known Issues

**WCF Proxies with XmlSerializer are not supported**
- ```ILT0042: WCF proxies with types which require use of XmlSerializer are not supported in incremental build mode. Found type '...'``` which requires XmlSerializer and is used by WCF proxy. Please turn off incremental .NET Native build mode for this project.
- No workaround.  For such apps please turn incremental build off.

**Compilation fails due to missing assemblies**
- ```Internal compiler error: MCG0023:UnresolvableAssemblyReference Unresolvable assembly reference 'Assembly(Name=…, Version=…, Culture=…, PublicKeyToken=...)' found. Please check the references in your build system. A reference is either missing or an assembly is missing an expected type.```
- Incremental build is more sensitive to missing assemblies in the app since it doesn't remove dead code in any way. The solution is to not have missing assemblies in the app. If that is not possible there's no workaround and incremental build should be turned off.

**Compilation fails due to duplicate assemblies**
- ```RHBIND : error RHB0007: Could not load input file 'SharedLibrary.mdildll'.```
- .NET Native generates and uses certain assemblies which must not exist in the input application. The incremental build is a little bit more sensitive to this condition than the non-incremental builds.
- Application assemblies should avoid names that begin with ```System.``` as well as ```SharedLibrary.dll.```
- Workaround: rename the application assembly which causes the problem.

**WinRT Types or properties on WinRT types which are only accessed through reflection might not work**
- This can show up as various runtime exceptions. MissingMetadataException, NullReferenceException and so on.  The code behaves as if the type or property simply doesn't exist most of the time.
- One such example would be: ```typeof(someWinRTType).GetProperty("propertyName")```
- This would return null even though the property does exist on the type.
- Workarounds (one or the other, or both but it's not necessary):
    - Add a new .xr.xml file (the name doesn't matter, only the extension is recognized) into the app and mark the type/property as rooted. For the above sample it would look like this: ```<?xml version="1.0" encoding="utf-8"?>```
```
    <Roots >
        <Roots.RootTypes>
            <RootType FullName="someWinRTType - namespace qualified">
                <RootProperty Name="propertyName" />
            </RootType>
        </Roots.RootTypes>
    </Roots>
```
- In the application code reference the property/type directly from the code. There's no need to do anything with them, just have a reference. So for types, having a typeof(someWinRTType) is enough. For properties some type of access to the property is enough. It can be dead code which nobody calls (in fact that's preferable).
- Both approaches should have very minimal effect on non-incremental builds, but should fix the incremental build problem.

**Non-Generic Marshal API might not work.**
- MissingMetadataException will be thrown during runtime when calling these non-generic Marshal API
- Example: ```Marshal.PtrToStructure(IntPtr, Object)```
- Workaround: Use generic version Marshal API

**Bad Pinvoke might not work**
- Fail to launch app
- Example: ```[DllImport("neverexists.dll")] void Func();```
- Workaround: remove these bad pinvokes or provide a fake dll

**Object methods Override for WinRT type might not work**
- The result from calling WinRT Types's ToString()/GetHashCode()/Equals() in managed code will be from default implementation Object's ToString()/GetHashCode()/Equals() instead of WinRT's Override methods.
- Example: Create a WinRT interface which contains ToString()/GetHashCode()/Equals() methods, and Create a WinRT class to implements this WinRT interface to override Object default implementation for ToString()/GetHashCode()/Equals().
- Workaround: Use IStringable to Override Object ToString() behavior

**Serialize WinRT enum might not work**
- System.Runtime.Serialization.SerializationException:Enum value '0' is invalid for type 'Windows.UI.Xaml.Visibility' and cannot be serialized.
- No workaround.  Please turn off incremental build.

**Lookup of WinRT enum values in WinRT dictionaries might not work**
- System.ArgumentException:Requested value 'Collapsed' was not found.
- No workaround.  Please turn off incremental build.

**Compilation might fail with stack overflow if the app has an attribute class which is used as an attribute on itself**
- For example: ```[ReproAttribute] public class ReproAttribute : Attribute {}```
- If possible remove the attribute on the attribute class itself. Otherwise there's no workaround and incremental build should be turned off.

## Provide Feedback

Please continue to send questions and suggestions to dotnetnative@microsoft.com.  We look forward to hearing from you and seeing what great things you will build.
