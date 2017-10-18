## Symptoms

Application that target .NET Framework 4.6.1 who use .NET Standard libraries could start seeing TypeLoadExceptions when running on .NET 4.7.1

## Cause

.NET Framework 4.7.1 adds support for .NET Standard in-box. As part of this change, a few assemblies who used to ship independently from the .NET Framework have now been added to the .NET Framework.

Because those assemblies were not part of the .NET Framework prior to .NET 4.7.1 they were deployed with the application and a binding redirect was added to your application's app.config.

When running on .NET 4.7.1, where the assemblies are now part of the framework, the application ends up with 2 types with different identity and this leads to a TypeLoadException. One type will be coming from the app-local assembly and the other one will come from the .NET Framework assembly.

## Workarounds

There are a few ways to workaround this issue
 - Remove the binding redirects for the assemblies that are now part of the .NET Framework
 - Re-target your application to .NET 4.7.1
 
