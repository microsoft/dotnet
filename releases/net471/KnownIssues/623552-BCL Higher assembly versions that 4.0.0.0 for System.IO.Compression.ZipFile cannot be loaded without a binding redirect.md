# Assembly versions higher than 4.0.0.0 for System.IO.Compression.ZipFile cannot be loaded without a binding redirect

## Symptoms

When building an application that targets .NET Framework 4.7.1, if you reference a .NET Standard 1.x library that uses types from the ZipFile assembly, a runtime error like the following results:

```
Error: Exception: System.IO.FileNotFoundException, Could not load file or assembly 'System.IO.Compression.ZipFile, Version=4.0.3.0, Culture=neutral, PublicKeyToken=b77a5c561934e089' or one of its dependencies. The system cannot find the file specified.
```

## Cause

The issue is caused by a bug in the runtime unification table for .NET Framework 4.7.1 for this assembly. The bug prevents the unification of the 4.0.3.0 version of the assembly to the 4.0.0.0 version that is present on the machine.

## Impact

This problem occurs when building an application that targets .NET Framework 4.7.1 and consumes .NET Standard-based assets.

## Workaround

To address this problem, you can manually add the following binding redirect in your application's config file:

```xml
  <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="System.IO.Compression.ZipFile" publicKeyToken="b77a5c561934e089" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.0.0" />
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
```

## Resolution

This problem is fixed in [.NET Framework 4.7.2](http://go.microsoft.com/fwlink/?LinkId=863281).
