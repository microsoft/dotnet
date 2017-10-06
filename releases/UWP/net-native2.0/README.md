# .NET Native 2.0 (UWP 6.0.x) Release Notes

You can see what was included in each .NET Native 2.0 ([Microsoft.NETCore.UniversalWindowsPlatform 6.0.x](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)) release, below.

When using Visual Studio these packages require Visual Studio version 15.4 or later.

### 6.0.1 (October 5, 2017)


#### .NET Standard 2.0 Support

- The Windows Fall Creators Update brings support for .NET Standard 2.0 to UWP development. In order to leverage the new APIs with .NET Standard 2.0, you need to set the minimum version target of your application to the Windows Fall Creators Update SDK preview. You will then have the ability to reference .NET Standard 2.0 NuGet packages, class libraries, and APIs directly from your UWP application.
- More information is available on .NET Standard 2.0 support [here](https://docs.microsoft.com/en-us/dotnet/standard/net-standard).

#### Improvements to Program Optimization, Throughput and Debuggability.

- This release of the .NET Native code generator includes substantial improvements to optimization, throughput and debuggability. This includes many new features from the Visual C++ compiler in Visual Studio 2017.  For example, a new SSA optimizer has been enabled and adapted to managed code and carefully tuned.
- This release also includes .NET language targeted improvements in
    - native pointer tracking
    - static initialization of scalars and arrays
    - loop unrolling and vectorization
    - write barrier and interference analysis
    - code motion in the presence of exception handling
    - iterative devirtualization-inlining which allows deeper inlining of small routines in common scenarios like class iterators.
- The code generator also generates accurate optimized debugging support for dead parameters, inlined functions, and default value initialization.  There are 78 code generator improvements in this release, including 8 GC-hole bug fixes which improved the quality and reliability of the compiler itself.

#### Changes to the Debug Runtime (CoreCLR)

- The Debug runtime (CoreCLR) is now based on the open source .NET Core, including the RyuJIT code generator.  Users might notice slight differences in behavior, such as floating-point precision in the x86 runtime, but most code should run just as it did in earlier releases.


#### .NET Native Incremental Build Support (Preview)

- This release contains an opt-in preview for .NET Native incremental compilation support.
- More information is available on incremental compilation support [here](incremental-compilation.md).

#### .NET Native Function Evaluation Debugger Support (Preview)

- This release contains an opt-in preview for .NET Native Function Evaluation (aka "FuncEval") Debugger support.
- More information is available on FuncEval support [here](funceval.md).


#### Known Issues and Workarounds

- **.NET Standard 2.0 and other .NET Library NuGet Packages**
    - While the vast majority of .NET Standard 2.0 APIs will work normally on the .NET Native platform, there are a small number of exceptions where the .NET Native platform could not fully support the expected behavior, typically because it would require JIT compilation or it is restricted by the app sandbox (AppContainer). An example is reading and writing process information with the Process class. As well, there are also some limitations in certain API that is not part of .NET Standard 2.0. See [https://github.com/dotnet/corefx/wiki/UWP-Compat](https://github.com/dotnet/corefx/wiki/UWP-Compat) for more details.
    - Although NuGet will now allow you to reference packages that expect the desktop .NET Framework, it cannot determine whether those libraries use an API that is not available on .NET Native. To warn you of this, NuGet and Visual Studio will display a warning like, ```NU1701: Package 'PackageNameHere 1.0.0' was restored using '.NETFramework,Version=v4.6.1' instead of the project target framework '.NETStandard,Version=v2.0'. This package may not be fully compatible with your project.```. When you receive this warning, you will want to make sure through testing or by reference to the library author that the package will indeed work in your .NET Native project. Over time, we expect many of these packages to re-package to avoid the warning.
    - ```System.Diagnostics.Debugger.Log``` and ```System.Diagnostics.Debugger.IsLogging``` do not report the message to the debugger on Release (.NET Native) builds.  Debug (CoreCLR) builds function as expected.  [405171]
    - ```System.Net.HttpWebRequest``` behavior change regarding POST'ing empty content with entity body related request headers (i.e. 'Content-Type', et. al.) from prior .NET Native releases. See [https://github.com/dotnet/corefx/wiki/ApiCompat](https://github.com/dotnet/corefx/wiki/ApiCompat) for more details.
    - Exception thrown from C# dynamic binder when calling interface methods on WinRT objects. [476163]
        - Exception: ```Microsoft.CSharp.RuntimeBinder.RuntimeBinderException:The call is ambiguous between the following methods or properties: System.Collections.Generic.IDictionary<string,object>.Add(string, object) and System.Collections.Generic.IDictionary<string,object>.Add(string, object)```
        - Workaround: The recommended fix would be to cast the dynamic object to the desired interface type and just make a call statically.
            - Example: ```dynamicObject.Add("key", value);```
            - Fix: ```((IDictionary<string, objecy>)dynamicObject).Add("key", value);```

- **Build Warnings and other Compilation Changes**
    - App developers encountering an OutOfMemoryException during Release compilation can specify ```<SingleThreadNUTC>true</SingleThreadNUTC>``` in their project properties.  This will run part of the toolchain on a single thread reducing the amount of memory used, and it may prevent the exception.
    - App sizes and build times have increased by approximately 20% due to support for additional .NET Standard 2.0 APIs
    - ```MCG0004:InternalAssert Assert Failed: unexpectedly found non-native type during [UNKNOWN] Caused by an interop-eligible struct(outer) containing a second struct(inner) as a field with explicit layout and one or more static fields.``` The workaround is to declare all the static fields of the inner struct before the instance fields. [484367]
    - Clicking ```"Enable static analysis for .NET Native"``` option in UWP project properties fails with the error: ```Could not find file 'x86\ilc\lib\Facades'```
        - Workaround: Uncheck the ```"Enable static analysis for .NET Native"``` option in project properties under the Build pane

## Resources

- [Getting Started with .NET Native](https://docs.microsoft.com/en-us/dotnet/framework/net-native/getting-started-with-net-native)
- [Microsoft.NETCore.UniversalWindowsPlatform NuGet Package Details](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform)
- [Windows Dev Center](https://developer.microsoft.com/en-us/windows/apps/getstarted)
- [Downloads and tools for Windows 10](https://developer.microsoft.com/en-us/windows/downloads)
