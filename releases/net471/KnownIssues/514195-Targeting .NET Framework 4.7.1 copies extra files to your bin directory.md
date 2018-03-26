# Targeting .NET Framework 4.7.1 copies extra files to your bin directory

## Symptoms

When building an application that targets .NET Framework 4.7.1, Visual Studio 15.6.3 tools copy 12 assemblies into your bin directory if it consumes one or more .NET Standard-based components.
This results in the bin output of your application being larger and including more files.

## Cause

.NET types live in different assemblies depending on the .NET implementation you are running in. A simple example is the String class, which lives in mscorlib.dll on .NET Framework, in netstandard.dll when you target .NET Standard 2.0, and in System.Runtime.dll when you target .NET Standard 1.x. For a library targeting one .NET implementation to load successfully when running on a compatible one, runtime facades (with type-forwards) are ordinarily used to reroute the references to the all of the types that live in different places.

.NET Framework 4.7.1 intended to have full support for running .NET Standard 2.0 assets, but we found some bugs on 12 assemblies that would cause some types to not get forwarded correctly. Patching those 12 assemblies is not viable since then the applications would require the patch to be installed on end-user machines in order to function correctly.

## Impact

This problem occurs when building an application that targets .NET Framework 4.7.1 and consumes .NET Standard-based assets.

## Workaround

There is no way to remove the extra assemblies in your bin directory when targeting .NET Framework 4.7.1. The only workaround is to recompile your app to target the .NET Framework 4.7.2 or later, where this issue has been addressed.

## Resolution

This problem is fixed in [.NET Framework 4.7.2](http://go.microsoft.com/fwlink/?LinkId=863281).
