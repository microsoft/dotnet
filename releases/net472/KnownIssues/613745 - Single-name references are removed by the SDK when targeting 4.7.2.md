# Single-name references are removed by the SDK when targeting .NET Framework 4.7.2 and referencing a package with the same assembly.

## Symptoms
When a project targets .NET Framework 4.7.2 and references an assembly with both a single name reference and a package reference (either an explicit or a transitive package reference), the assembly is not passed as a reference to the compiler, causing build-time errors for types that are not found. An example of a build error caused by this issue is:
```
error CS0246: The type or namespace name 'HttpClient' could not be found (are you missing a using directive or an assembly reference?)
```

Candidate assemblies that might run into this issue are `System.Diagnostics.Tracing.dll`, `System.IO.Compression.dll`, and `System.Net.Http.dll`. This issue only happens when the project uses the `<PackageReference` model instead of `packages.config` to manage its NuGet dependencies.

## Cause
This issue occurs when a project has two references to the same assembly, one to the platform implementation (that is, the assembly that ships with the .NET Framework) and one to the package implementation. What ends up happening is that two different MSBuild targets conflict with each other, and each one removes one of the two references, so that when the call to the compiler is made, none of the references remain. NuGet targets remove the platform implementation because they assume that the package implementation should always be preferred. After this, the SDK targets remove the package implementation because they check that the platform assembly version is higher than the package one and, if it is, the platform assembly is preferred.

## Workaround
The workaround is to add an extra package reference to your project file and exclude all of its assets in order to make sure that the package implementation is never preferred. This ensures that the platform version wins and is not removed by the NuGet targets. Here is an example of how to do this for the `System.Net.Http.dll` case:

```xml
  <ItemGroup>
    <PackageReference Include="System.Net.Http" Version="4.3.3">
      <ExcludeAssets>All</ExcludeAssets>
    </PackageReference>
  </ItemGroup>
```

## Resolution
A proper fix in the MSBuild SDK will ship in the coming versions of Visual Studio. This known issue will be updated with more details when that happens.
