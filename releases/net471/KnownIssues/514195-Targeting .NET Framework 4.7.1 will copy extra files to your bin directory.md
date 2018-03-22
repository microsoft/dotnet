# Targeting .NET Framework 4.7.1 will copy extra files to your bin directory

## Symptoms

When building an application that targets .NET Framework 4.7.1, the tooling (Assumming you are using VS 15.6.3) will copy 12 assemblies into your bin directory if you consume one or more .NET Standard-based components.
This will result in the bin output of your application to be larger and include more files.

## Cause

.NET types live in different assemblies depending on the framework you are running in. A simple example would be the class String, which lives in mscorlib.dll on .NET framework, in netstandard.dll when you target .NET Standard 2.0, and in System.Runtime.dll when you target .NET Standard 1.x. In order to have a library targeting one framework to successfully load when running on a compatible one, we sometimes need runtime facades (with type-forwards) which help us re-route the references to the all of the types that live on different places.

We intended to have all of the runtime facades required to run .NET Standard libraries as part of .NET Framework 4.7.1, but we ended up having some bugs in them that would cause some types to not get forwarded correctly. If we decided to patch these facades, then the applications would require the patch to be installed on end-user machines.

## Impact

This problem occurs when building the applications that target .NET Framework 4.7.1 and consume assets that are .NET Standard based.

## Workaround

The workaround was to copy these extra 12 assemblies(runtime facades) to your bin directory. This is done automatically for you on VS 15.6.3. With them, and with some binding redirects that will be generated automatically, we will ensure that all of the .NET Standard types would re-map correctly when running on .NET Framework 4.7.1 or grater.

## Resolution

This problem is fixed in [.NET Framework 4.7.2](http://go.microsoft.com/fwlink/?LinkId=863281).
