# .NET Home

The dotnet repository is the starting point to engage in and learn about .NET
open source projects from [Microsoft](http://microsoft.github.io) and the [.NET Foundation](http://dotnet.github.io). You can read the more detailed [.NET Core is Open Source](http://blogs.msdn.com/b/dotnet/archive/2014/11/12/net-core-is-open-source.aspx) on the .NET blog.

## Finding .NET Open Source Projects

There are many [open source .NET projects](dotnet-projects.md). Check out the [list of projects](dotnet-projects.md) the community maintains. Please find one to engage in or add one. There's certainly one out there that could use your help.

There are several projects from Microsoft on GitHub and CodePlex, including:

* [.NET Compiler Platform ("Roslyn")](https://roslyn.codeplex.com)
* [.NET Core 5](https://github.com/dotnet/corefx)
* [ASP.NET 5](https://github.com/aspnet/home)
* [EntityFramework](https://github.com/aspnet/EntityFramework)

Each one of these projects maps to one or more [.NET NuGet packages](http://blogs.msdn.com/b/dotnet/p/nugetpackages.aspx) that are published on [NuGet.org](http://nuget.org/).

There are also many great open source .NET community projects, such as:

* [Mono Project](https://github.com/mono/)
* [JSON.NET](http://json.net/)
* [MVVM Cross](https://github.com/MvvmCross/MvvmCross)
* [MVVM Light Toolkit](http://www.mvvmlight.net)
* [Glimpse](http://getglimpse.com)
* [MonoGame](http://monogame.net)
* [Exceptionless](https://github.com/exceptionless/Exceptionless)

## How to Engage, Contribute and Provide Feedback

.NET open source projects from Microsoft (gladly) accept PRs and other contributions. To contribute to ASP.NET 5 or EntityFramework, see [the ASP.NET Contributing Guide](https://github.com/aspnet/Home/blob/master/CONTRIBUTING.md). To contribute to .NET Core 5, see the [.NET Core Contributing Guide](https://github.com/dotnet/corefx/blob/master/CONTRIBUTING.md).

You are also encouraged to start a discussion by posting on the [.NET Foundation Forums](http://forums.dotnetfoundation.org/) or filing an issue in the corresponding GitHub project. See the contributing guides for more details.

## .NET Foundation

Most .NET open source projects at Microsoft have been contributed to the [.NET Foundation](http://www.dotnetfoundation.org/projects). There are two main .NET Foundation projects for Microsoft open source projects: [ASP.NET Core 5 project](http://www.dotnetfoundation.org/aspnet-5) and the [.NET Core 5 project](http://www.dotnetfoundation.org/netcore5).

## License

.NET open source projects typically use either the [MIT](LICENSE) or [Apache 2](http://www.apache.org/licenses/LICENSE-2.0) licenses for code. Some projects license documentation and other forms of content under [Creative Commons Attribution 4.0](http://creativecommons.org/licenses/by/4.0/). See specific projects to understand the license used.

## Understanding the relationship between .NET Core and the .NET Framework

.NET Core and the .NET Framework have (for the most part) a subset-superset relationship. .NET Core is named "Core" since it contains the core features from the .NET Framework, for both the runtime and framework libraries. For example, .NET Core and the .NET Framework share the GC, the JIT and types such as String and List<T>. We'll continue improving these components for both .NET Core and .NET Framework.

.NET Core was created so that .NET could be open source, cross platform and be used in more resource-constrained environments. We have also published [.NET Reference Source](https://github.com/Microsoft/referencesource) under the MIT license, so that you and the community can port additional .NET Framework features to .NET Core.

## Understanding the relationship between .NET Core and Mono

Mono is an important part of the .NET ecosystem, particularly for client scenarios (e.g. Xamarin). We will look for ways to collaborate with Mono developers and encourage them to take our code to improve Mono. We will also look for opportunities to improve .NET Core with MIT-licensed Mono code.

An important collaboration opportunity is making .NET Core NuGet packages (produced from this code) work on Mono. The SIMD NuGet package is a perfect example.

## Learning about ASP.NET 5 and .NET Core 5

ASP.NET 5 is a new cross-platform version of ASP.NET that is designed for the cloud, and runs on Windows, Linux and Mac. It uses the .NET Framework to run on Windows, and can also run on .NET Core 5 for greater deployment flexibility on Windows. It currently uses Mono for Linux and Mac support but will move to .NET Core 5 for those platforms when they are supported.

[ASP.NET 5](https://github.com/aspnet/home) and [.NET Core 5](https://github.com/dotnet/corefx) libraries are open source on GitHub. At present, only a few .NET Core 5 libraries are available on GitHub. The rest of the libraries, including the base runtime, will be added in the coming months.