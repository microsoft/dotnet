# .NET Framework Targeting Pack Nuget Packages

These packages enable building .NET Framework projects on any machine with at least MSBuild or the .NET Core SDK installed. 

The following scenarios and benefits are enabled for .NET Framework projects:

- Build without requiring admin operations to install pre-requisites such as [Visual Studio](https://visualstudio.microsoft.com/vs/) or [.NET Framework targeting packs](https://dotnet.microsoft.com/download/visual-studio-sdks).
- Build libraries on any operating system supported by the .NET Core SDK.
- Build Mono-based projects.

## Usage

### .NET Core project

This sample uses a multi-targeting ClassLibrary project, that can be created using `dotnet new classlib`.

Change `TargetFramework` property to `TargetFrameworks` and add a new .NET Framework target, like in the following example:

```xml
<TargetFrameworks>netstandard2.0;net472</TargetFrameworks>
```

Add Package reference:

```xml
<ItemGroup>
  <PackageReference Include="Microsoft.NETFramework.ReferenceAssemblies" Version="1.0.0" PrivateAssets="All" />
</ItemGroup>
```

Build as usual:

```console
dotnet build
```

### SDK-style project

Add the `TargetFramework` property and a `PackageReference` like in the following example `csproj` file:

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net472</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.NETFramework.ReferenceAssemblies" Version="1.0.0" PrivateAssets="All" />
  </ItemGroup>

</Project>
```

### Classic-style project

1. Add `PackageReference` to your `csproj` file, the same way as in the SDK-style sample above.

2. Add or modify the `TargetFrameworkVersion` property in your *csproj* file:

```xml
<TargetFrameworkVersion>v4.7.2</TargetFrameworkVersion>
```

### Building your .NET Framework (SDK and Classic) project

1. Restore NuGet packages:

```console
msbuild /t:restore
```

2. Build the project:

```console
msbuild
```

## Package location

https://www.nuget.org/packages/Microsoft.NETFramework.ReferenceAssemblies

## Latest release

Version:  1.0.2

Date:  May 6th, 2021

## Changelog

### 1.0.2

Fixes naming issue with System.Configuration.dll in 2.0 and 3.5 packages. Incorrect capitalization (System.configuration.dll) was causing build issues on Linux.

### 1.0.1

Adds .NET Framework 3.5 package.

### 1.0.0

Initial release
