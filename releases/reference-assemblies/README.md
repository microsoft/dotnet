# .NET Framework Targeting Pack Nuget Packages (Preview)

These packages enable building .NET Framework projects on any machine with at least MSBuild or the .NET Core SDK installed. 

The following scenarios and benefits are enabled for .NET Framework projects:

- Build without requiring admin operations to install pre-requisites such as [Visual Studio](https://visualstudio.microsoft.com/vs/) or [.NET Framework targeting packs](https://dotnet.microsoft.com/download/visual-studio-sdks).
- Build libraries on any operating system supported by the .NET Core SDK.
- Build Mono-based projects.

## Status

Early preview.

## Usage

At the moment, packages are located on a non-default package feed. Until packages are moved to the default package feed, a change in your project's `NuGet.Config` file is needed. Add the following line to `<packageSources>` section:

```xml
<add key="roslyn-tools" value="https://dotnet.myget.org/f/roslyn-tools/api/v3/index.json" />
```

Sample `NuGet.Config` file:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
<packageSources>
    <add key="roslyn-tools" value="https://dotnet.myget.org/f/roslyn-tools/api/v3/index.json" />
</packageSources>
</configuration>
```

Make the following changes based on the type of project you are using.

### .NET Core project

This sample uses a multi-targeting ClassLibrary project, that can be created using `dotnet new classlib`. Add or modify NuGet.config file as described above.

Change `TargetFramework` property to `TargetFrameworks` and add a new .NET Framework target, like in the following example:

```xml
<TargetFrameworks>netstandard2.0;net472</TargetFrameworks>
```

Add Package reference:

```xml
<ItemGroup Condition=" '$(TargetFramework)' == 'net472' ">
  <PackageReference Include="Microsoft.NETFramework.ReferenceAssemblies" Version="1.0.0-alpha-5" />
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
    <PackageReference Include="Microsoft.NETFramework.ReferenceAssemblies" Version="1.0.0-alpha-5" />
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

https://dotnet.myget.org/feed/roslyn-tools/package/nuget/Microsoft.NETFramework.ReferenceAssemblies

## Latest release

Version:  1.0.0-alpha-5

Date:  Tue, 04 Dec 2018 00:13:27 GMT
