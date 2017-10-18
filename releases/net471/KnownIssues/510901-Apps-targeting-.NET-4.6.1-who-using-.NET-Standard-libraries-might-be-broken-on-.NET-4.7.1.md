## Symptoms

Applications that target the .NET Framework 4.6.1 and use .NET Standard libraries may experience <xref:TypeLoadExceptions> exceptions when running on .NET 4.7.1

## Cause

The .NET Framework 4.7.1 adds support for .NET Standard in-box. As part of this change, a few assemblies that used to ship independently from the .NET Framework have now been added to the .NET Framework. As these .NET Standard assemblies were not part of the .NET Framework prior to .NET 4.7.1 they were deployed with the application, and a binding redirect was added to the application's app.config.

When running on the .NET Framework 4.7.1, where the assemblies are now part of the Framework, the application now has two types with different identities and, that leads to a <xref:TypeLoadException>. One type comes from the app-local assembly and the other one comes from the .NET Framework assembly.

## Workarounds

There are a few ways to workaround this issue
 - Remove the binding redirects from the app.config file for the assemblies that are now part of the .NET Framework.
 - Re-target your application to target .NET Framwork 4.7.1
 
