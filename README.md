# .NET Home

The dotnet repository is the starting point to engage in and learn about .NET
open source projects from Microsoft and part of the .NET Foundation. You can
read the more detailed [Introduction to .NET Open Source](http://blogs.msdn.com/dotnet)
on the .NET blog.

## License

All .NET open source projects are licensed under either the [MIT](LICENSE) or
[Apache 2](http://www.apache.org/licenses/LICENSE-2.0) licenses for code. Some
projects license documentation and other forms of content under
[Creative Commons Attribution 4.0](http://creativecommons.org/licenses/by/4.0/).
See specific projects to understand the license used.

## .NET Foundation

All projects have been contributed to the [.NET Foundation](http://www.dotnetfoundation.org/projects). There are two main .NET Foundation projects for Microsoft open source projects:
[ASP.NET Core 5 project](http://www.dotnetfoundation.org/prjaspnetvnext.aspx)
and the [.NET Core 5 project](http://www.dotnetfoundation.org/prjaspnetvnext.aspx).

## How to Engage, Contribute and Provide Feedback

All projects (gladly) accept PRs and other contributions. To contribute to
ASP.NET 5 or EntityFramework, see [the ASP.NET Contributing Guide](https://github.com/aspnet/Home/blob/master/CONTRIBUTING.md). To contribute to .NET Core 5, see the [.NET Core Contributing Guide](CONTRIBUTING.md).

You are also encouraged to start a discussion by filing an issue or creating a
gist. See the contributing guides for more details. You can discuss .NET OSS
more generally in the [.NET Foundation forums](http://www.dotnetfoundation.org/).

## Finding .NET Open Source Projects

There are several open source .NET projects from Microsoft on GitHub and
CodePlex:

* [ASP.NET 5](https://github.com/aspnet/home)
* [EntityFramework](https://github.com/aspnet/EntityFramework)
* [.NET Core 5](https://github.com/Microsoft/dotnet-corefx)
* [.NET Compiler Platform ("Roslyn")](https://roslyn.codeplex.com)

Each one of these projects maps to one or more [.NET NuGet package](http://blogs.msdn.com/b/dotnet/p/nugetpackages.aspx)
that are published on [NuGet.org](http://nuget.org/).

They are also many great open source .NET community projects, such as:

* [Mono Project](https://github.com/mono/)
* [JSON.NET](http://json.codeplex.com/)


## Understanding the Relationship between .NET Core and the .NET Framework

.NET Core and the .NET Framework (for the most part) have a subset-superset relationship. .NET Core is named as "Core" since it contains the core features from the .NET Framework, for both the runtime and framework libraries. For example, .NET Core and the .NET Framework share the GC, the JIT and types such as String and List<T>. We'll continue improving these components for both .NET Core and .NET Framework.

.NET Core was created so that .NET could be open source, cross platform and be used in more resource-constrained environments. We have also published [.NET Reference Source](http://sourceof.net), so that the community can port the features .NET Frameworks that you care about.

## Understanding the Relationship between .NET Core and Mono

Mono is an important part of the .NET ecosystem, particularly for client scenarios (ex: Xamarin). We will look for ways to collaborate with Mono developers and encourage them to take our code to improve Mono. We will also look for opportunities to improve .NET Core with MIT-licensed Mono code.

An important collaboration opportunity is making .NET Core NuGet packages (produced from this code) work on Mono. The SIMD NuGet package is a perfect example.

## Learning about ASP.NET Core 5 and .NET Core 5

ASP.NET Core 5 is a new cross-platform version of ASP.NET that is designed for
the cloud, and runs on Windows, Linux and Mac. It uses the .NET Core 5 runtime and framework for running on Windows. It currently uses Mono for Linux and Mac support but will move to .NET Core 5 for those platforms when they are supported.

[ASP.NET Core 5](https://github.com/aspnet/home) and [.NET Core 5 libraries](https://github.com/Microsoft/dotnet-corefx) are open source on GitHub. At present, only a few libraries are available on GitHub. The rest of the libraries, including the base runtime, will be added in the coming months.