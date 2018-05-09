# Single-name references are removed by the SDK when targeting 4.7.2 and referencing a package with the same assembly.

## Symptoms
When a project targets 4.7.2 and references an assembly with both a single name reference and a package reference (either a explicit or a transitive package reference), the assembly will not be passed as a reference to the compiler, causing build time errors for types that are not found. An example of a build error caused by this issue is:
```
error CS0246: The type or namespace name 'HttpClient' could not be found (are you missing a using directive or an assembly reference?)
```

Candidate assemblies that might run into this issue are: `System.Diagnostics.Tracing.dll`, `System.IO.Compression.dll`, and `System.Net.Http.dll`

## Cause
This issue will happen when a project has two references to the same assembly, one to the platform inbox implementation, and one to a package implementation. What ends up happening is that two different targets conflict with each other, and each one will remove one of the two references causing that when the call to the compiler is made, none of the references remain. NuGet targets will remove the Platform inbox implementation because it (incorrectly) assumes that the package implementation should always be preferred. After this, the SDK targets will remove the package implementation because it (incorrectly) assumes that all of the platform assemblies are referenced, and checks that the inbox assembly version is higher than the package one, so it prefers the one inbox.

## Resolution
The workaround is to add an extra package reference to your project file and excluding all of the assets in order to make sure that the package implementation will never be preferred, that way we can ensure that the inbox version will win and will not be removed by the NuGet targets. Here is an example of how to do this for the `System.Net.Http.dll` case:

```xml
  <ItemGroup>
    <PackageReference Include="System.Net.Http" Version="4.3.3">
      <ExcludeAssets>All</ExcludeAssets>
    </PackageReference>
  </ItemGroup>
```