# Growing the .NET ecosystem

**Immo Landwerth**

*This document is an output of the planning process for .NET 6. It's written
from a Microsoft perspective and it's a collection of problem statements and
assertions based on how we perceive the .NET ecosystem. The sections at the end
contain next steps we'd like to take to validate or invalidate some of the
explicit (or implicit) hypotheses in this document. We're collaborating with the
.NET Foundation [working group on ecosystem
grow](https://github.com/dotnet-foundation/ecosystem-growth) and have presented
this document there as well*.

Today, we're often (even weekly) approached by both customers and internal
partners to build libraries that already exist in the .NET ecosystem because
people feel they can't trust 3rd parties – and sometimes even 1st party when the
technology isn't part of .NET. This results in a negative cycle whereby adding
new 1st class libraries from Microsoft further underlines the notion that
quality and longevity is only provided by Microsoft, and it continues.

In the .NET Core 3.1 timeframe, we started a maturity model which didn't go well
with the .NET Community, for a variety of reasons, but mostly due to the way we
collaborated & communicated with the community. We believe we can learn from
this experience and pick this idea up again.

The overall goal is to enable .NET consumers to make trust decisions and to
encourage customers (external as well as internal) to trust libraries that
aren't built by Microsoft. This work will comprise of a user experience when
consuming libraries (such as when adding packages using the NuGet UI), a defined
set of practices (such as making source code and symbols available for debugging
as well as allowing to patch the code), a defined development process (how to
distribute releases, dealing with breaking changes and security issues), as well
as initiatives in order to grow the set of non-Microsoft controlled libraries.

Getting critical adoption of this model in the .NET ecosystem will likely take
years, but the goal for .NET 6 is to create the vision, get buy-in from the .NET
Foundation and the open source community at large, as well as getting some of
the fundamentals in-place.

## Grow the set of trusted libraries that aren't controlled by Microsoft

### Why?

There is a perception that other ecosystems (specifically Java, JavaScript, and
Python) have more technological diversity and thus an overall stronger open
source ecosystem. Historically, we've taught customers to expect all the
features to come from Microsoft. Since we can't build everything, especially not
at a pace at which other OSS ecosystems evolve, the set of trusted libraries for
.NET must grow beyond just Microsoft.

### Summary

We need to normalize the practice that application developers can depend on
libraries that aren't controlled by Microsoft.

This requires that we make it easier for customers to evaluate quality and for
package authors to deliver a consistent quality. This is tackled by other
objectives in this document.

This also requires a culture shift at Microsoft. Today, we're usually reactive
when it comes to library & framework investments. By the time we know there is a
need for a library (say, a new serialization protocol) we routinely research
existing options but usually end up rolling our own, because nothing fits the
bill as-is and we either don't have the time or we believe we wouldn't be able
to successfully influence the design of the existing library. This results in a
perception where Microsoft "sucks the air" out of the OSS ecosystem because our
solutions are usually more promoted and often tightly integrated into the
platform, thus rendering existing solutions less attractive. Several maintainers
have cited this as a reason that they gave up or avoid building libraries that
seem foundational. See [this section](#feedback-critical-opinions-on-the-microsoft-oss-ecosystem) with
pointers to blog posts.

To avoid this, we need to start engaging with owners of existing libraries and
work with them to increase their quality (this implies documentation of
processes, patterns, and availability of tools which is tackled by another
objective in this document). We're doing this quite successfully with gRPC,
OpenTelemetry, and Apache Arrow/Spark already, but it should become a general
practice. We should even consider an ongoing work item to actively investigate
widely used libraries and help them raise the quality or tighten their
integration into the .NET developer experience. There is a separate objective in
this document that describes the need for product extension points that enable
that for 3rd parties.

We also need to change our approach when we create net-new technologies for
which there is no ecosystem yet, as is the case for GPIO-based IOT libraries for
.NET Core. Instead of us building everything, we should create new projects in
such a way that we're not the sole maintainer and actively seek out and invite
external contributors to take part in long term ownership and maintenance. This
also includes our naming patterns. For example, it has become the norm that we
name packages and namespaces with Microsoft, which isn't very friendly for
creating multi-vendor projects.

One challenge that exists in the .NET OSS ecosystem is that most successful
libraries are developed by a single person as a hobby. While this often results
in highly rated libraries (because they are labors of love) it creates a high
risk for maintainer burnout and thus uncertainty for support and longevity. This
is also reflected by the projects we see in the .NET Foundation as well as for
members of the board -- virtually nobody has the luxury of being paid by a
company to do this as part of their job.

When you look at other foundations, such as the Linux Foundation or the Apache
Foundation, you see a very different picture: most maintainers aren't doing this
as a hobby, they are employees and work on this as part of their job. This is
also captured in the book [Working in Public: The Making and Maintenance of Open
Source Software](https://www.amazon.com/dp/0578675862).

While there are exceptions in the .NET ecosystem (Samsung or Unity) it very much
is not the norm. Microsoft should take a more active role to work with the .NET
Foundation and help found a program where company-sponsored "maintainerships"
are being created, that is, they sponsor one or more employees who help maintain
a given library as part of their job. The goal is to create libraries that are
co-owned by employees from various companies, akin to how the Apache Foundation
works. This would be an alternative to monetary sponsorships which don't provide
a dependable income and hence do little to reduce the maintainers' stress
because it still demands balancing OSS commitments with their jobs and personal
lives. Perhaps Microsoft should also lobby for making the .NET Foundation more
similar to Apache who apparently make a concerted effort to ensure that project
committee membership is diverse so that the withdrawal of interest by a single
party would not jeopardize the project.

Another challenge is around support. There seems to be a perception that
Microsoft produced code is always supported and anybody's else code isn't. We
often hear the need for support as a reason why non-Microsoft libraries aren't
chosen but it's unclear whether that means having an option for paid support or
whether it's simply lack of confidence that the library will be around tomorrow.
We should do customer development in this space and use the results to inform
whether there is a need for paid support for non-Microsoft libraries. If there
is, we should work with the .NET Foundation to define how this model would work
so that companies can offer support for libraries that they don't control. This
would include Microsoft but also other companies (such as Red Hat, Samsung or
whoever else wants to offer paid support).

### End to End Scenarios

* We need to define joint-ownership mechanics for libraries. We should try this
  in the context of the IOT libraries (and potentially other customer asks, such
  as additional collections we'll likely never add to the BCL).

* We need to do customer development with existing OSS maintainers to understand
  if maintainerships are a good plan to address maintainer burn out and ensure
  project longevity.

* We need to do customer development to understand the consumer's concerns
  around support.

### Engineering Needs

* We should use telemetry, customer, and partner input to select a set of
  non-Microsoft owned libraries that we can help make better. This includes
  offering API reviews, as well as contributing fixes and features. The goal is
  to make this a continuous effort so that we spread our expertise outside of
  Microsoft and normalize the practice that we help make .NET better, no matter
  who owns the code.

### Customer Cohorts

* OSS library maintainers

* Internal partners at Microsoft, enterprise customers, and ISVs who consume
    OSS libraries and have concerns around quality and support

## 3rd party experiences can be as good as 1st party experiences

### Why?

In order to level the playing field and make it possible that the .NET platform
can promote and bet on non-Microsoft controlled technologies, we need the
ability to provide a curated discovery & acquisition experience for optional
components that is used by both 1st party as well as 3rd parties.

### Summary

At Microsoft we strive to deliver end-to-end experiences, for example, building
a Windows Forms application requires a shared framework, a set of project and
item templates, tooling in Visual Studio, and documentation. We deliver all of
this as part of the core product as this makes the experience seamless.

With .NET 6 and the support for the mobile workloads we're moving to a model
where part of .NET is optional. This ensures the core product can be small and
snappy to install while still supporting the full breadth of .NET.

However, this work itself doesn't guarantee that 3rd parties can also provide
optional components that customers can easily discover and install, thus
potentially still having a clear boundary between "this is from Microsoft" and
"this is 3rd party".

At the same time, we don't want to provide an open registry like nuget.org as
the primary mechanism to discover and extend the core product because this will
result in a lot of noise. We still want a curated experience. The only
difference is that the curated set can be comprised of Microsoft and
non-Microsoft provided functionality.

### End to End Scenarios

* .NET developers have a single-entry point for discovering and acquiring
  additional workloads. This entry point will be use works for all 1st party
  provided components, such as ASP.NET Core, EF Core, and Xamarin.

* The experience presents Microsoft provided components as peers to
  non-Microsoft provided components. This aids discovery of related technologies
  and ensures customers can choose the best tool for the job.

* The set of available components is curated. This list needs to be owned by
  some party, but it doesn't have to be just Microsoft (but we should have a
  say, too). For example, there could be a .NET Foundation working group that
  can decide which technologies are important enough to be a part of that core
  product. This requires defining a bar that components need to pass to be
  considered for addition, which includes relevance, quality, and project
  health.

### Engineering Needs

* Move built-in components such as ASP.NET Core and EF to the optional workload
  model to level the playing fields and ensure expressiveness of extension
  points.

* Provide extension points for all parts of the product that need to be extended
  by optional components, such as templates, shared frameworks, and tooling.

### Customer Cohorts

* Providers of web frameworks such as Nancy and Giraffe

* Providers of OR mappers such as NHibernate, Dapper, LLBLGen

* Providers of unit test frameworks such as xUnit and NUnit

* Providers of application models such as Uno

* Providers of cloud integrations such as Pulumi and Farmer

## Developers can make trust decisions about packages and binaries they consume

### Why?

Our library ecosystem is entirely revolving around NuGet packages which contain
binaries. It is essential that customers can have the confidence that using
pre-built code doesn't corner them. This includes the ability to reproduce them
if necessary but also includes installing packages will not result in build or
runtime errors due to incompatibilities that NuGet didn't surface early enough.

### Summary

.NET's ecosystem uses binaries as the primary exchange mechanism. This solves
various problems, especially shielding the consumer from having to replicate the
build environment. It's also what enables the multi-language ecosystem. All in
all, binaries have worked very well for .NET, especially because the underlying
format is rich and self-describing.

.NET uses Authenticode signing for binaries and packages. The .NET Foundation
has made it easier for member projects to get a code signing certificate and
actively pushes its projects to do so. On top, the official NuGet gallery signs
packages to indicate they came from nuget.org.

However, one largely unsolved problem is the link between source code and
binaries. While a significant portion of packages on nuget.org are open source
and often link to the GitHub repo, there is no way to ensure that the source
code being pointed too actually matches the binaries submitted to nuget.org.
Which could either be by choice of the uploader or because the uploader used a
compromised tool chain that injects code that wasn't part of the source code.

In other words, just because you can trust the source code doesn't mean you can
trust the binaries. And while nuget.org scans packages for virus and malware,
there is no way to detect all possible malware. For all you know, someone, or
something, [injected a bit coin
miner](https://www.theregister.com/2018/11/26/npm_repo_bitcoin_stealer/).

There also less malicious trust issues with consuming NuGet packages: the
package manager UI will offer packages that might not install or are not
relevant for the consuming project. It's frustrating and erodes trust when
customers try to use them only to see NuGet fail to install the package or
(worse) seeing the app crash at runtime. In many cases this isn't a bug in the
package, it's a missing feature on the NuGet side to use the package information
to communicate to the customer what will and will not work.

A closely related issue is that finding a package that is compatible with a
project can be a challenge to developers in the .NET ecosystem.

### End to End Scenarios

* Package consumers know whether a given package offers sources for debugging.

* Package consumers know whether a given package can be reproduced from sources.

* Package consumers will understand whether a given package will work before
  trying to install them. They should clearly be able understand what platforms
  are supported by viewing a NuGet package's details instead of having to guess
  & check by installing the package or downloading the package to ensure there
  is an available asset for their platform.

* Package consumers can evaluate packages by popularity, quality, and
  maintenance.

### Engineering Needs

* We need to create a validation tool that can check whether a given binary can
  be reproduced.

* The validation tool needs to be integrated into the NuGet.org ingestion
  pipeline so that it can serve the results in searches and the package pages.

* We need to improve the NuGet gallery and the NuGet package management UI to
  service information regarding compatibility, relevance to the consuming
  project type, popularity, and quality metrics, such as how well it is
  maintained.

### Customer Cohorts

* Package consumers who wish to manually check results on their own.

* Package authors, as we need them to enable support for debugging and
  reproducibility.

* NuGet.org, to validate packages on upload and present the status as part of
  overall package/project health.

* Internal partner Terrapin, which is an effort to secure Azure Ring 0 and Ring
  1 services.

## Developers have access to guidance & tools that supports them in building cross-platform packages

### Why?

With .NET Core & Xamarin we have made cross-platform a mainstream requirement
for library authors. However, we lack comprehensive tooling and guidance to
ensure that library developers fall into the pit of success, which results in
packages that don't work well which in turn hurts our ecosystem. This is
especially problematic for emerging platforms where adoption isn't high enough
to warrant special attention by library authors.

### Summary

We have pushed the envelope with what NuGet can do since we did .NET Core 1.0.
However, we have solved many of the hard problems only for the platform layer,
rather than focusing on problems library authors have day to day. In the
dotnet/runtime repo we use custom tooling to build packages, which other repos,
and more importantly, our customers don't use. This makes it very hard to build
packages that, for example, contain native code or packages that need to build
different binaries for different operating systems or CPU architecture.
Specifically, the ability to multi-target for a runtime identifier (RID) isn't
well supported at all.

Furthermore, the tooling we provide as part of the SDK has close to zero
validation that multi-targeted packages are well-formed. For example, a package
that multi-targets for .NET Core 3.1 and .NET Standard 2.0 needs to ensure that
code compiled against the .NET Standard 2.0 binary can run against the binary
that is produced for .NET Core 3.1. In the dotnet/runtime repo we have tooling
that ensures that this is the case, but this can't easily be used by our
customers. We have seen this issue in the wild, even with 1st parties, for
example, the Azure AD libraries.

And while there are several well-established patterns for building
cross-platform packages using the bait & switch approach, our guidance for
building cross-platform packages is still very rudimentary. Especially with .NET
5 and the advent of operating system specific framework names we need to provide
more prescriptive guidance.

### End to End Scenarios

* Multi-targeting for all operating systems and CPU architectures needs to be
  supported in the same way that multi-targeting for different frameworks is.

* Packages are automatically validated to ensure that consumers don't
  experience compatibility issues because provided assets aren't compatible with
  different multi-targeted versions of themselves.

### Engineering Needs

* We need to integrate RID targeting into the multi-targeting experience

* We need to extract and productize API compatibility tooling (such as our
  APICompat) and make it part of the package multi-targeting experience

* We need have guidance for how to multi-target across frameworks, operating
  systems, and architectures

* We need to have guidance for how to deploy & wrap native code

### Customer Cohorts

* NuGet package authors

* NuGet package consumers

## Package consumers can patch their dependencies

### Why?

Using binaries as the primary exchange vehicle in conjunction with
package/assembly identity makes it harder for people to experiment and patch
dependencies. Other ecosystems don't suffer from this to the same degree because
they are either source based or have specific features to address that.

### Summary

From the very start, .NET had a notion of identity (via strong naming and the
GAC). In spirit, NuGet is a continuation of this idea. Identity is important to
enable sharing. However, it also has problems when only one party can produce
the artifact under that identity. With strong naming, this was originally by
design. In .NET Core, we have pretty much neutered this constraint and for .NET
Framework we provide public signing to work this around (to a degree).

In case of NuGet packages this problem is harder to solve. The central nuget.org
registry requires that only the party owning a given package can provide new
versions. However, this is mightily inconvenient when you want to modify
packages locally, for example, to experiment with an OSS contribution or when
you want to patch an issue you're having with a package.

In source-based ecosystems this problem isn't as big because sources are
inherently patchable.

We should make it easier for application developers to convert a package
dependency to source dependency that they can control and patch. In some cases,
it might be desirable to make the patched version available (publicly or
internally).

However, this generally requires a new package ID which now means that all
consumers would need to rebuild all their dependencies to use the new ID. A
better option would be to allow application authors to redirect package ID (and
version) to a different ID (and version). This also solves the problem where a
package author no longer maintains a package or doesn't want to support the
package for a specific operating system or framework. Someone else can provide
the package and application authors can replace the canonical one with the
forked one.

Other ecosystems (specifically Java and NPM) have the ability for private
dependencies, where a given package dependency is considered an implementation
detail and doesn't become a direct dependency of the consumer. This would allow,
for example, the Azure SDK to depend on JSON.NET without constraining if and
which version of JSON.NET the application can use (Java calls this shading). To
be reliable, shading would need to enforce that shaded dependencies cannot leak
into the public APIs.

### End to End Scenarios

* Package consumers can replace a package reference with a version that they
  built themselves.

* Package consumer can replace a package with one that has a different ID and
  version.

### Engineering Needs

* NuGet and runtime need to support shaded dependencies.

* NuGet needs to support redirecting a package ID in the graph. Non-shaded
  dependencies can only be replaced at the application level while shaded
  dependencies could be replaced at the level that shades them.

### Customer Cohorts

* Package consumers

## Feedback: Critical opinions on the Microsoft OSS ecosystem

Here is a list of blog posts that have criticized Microsoft for not playing well
with the OSS ecosystem:

* [The New Rules for Playing in Microsoft's Open Source
  Sandbox](https://aaronstannard.com/new-rules-dotnet-oss/), by Aaron Stannard

* [How to Build Sustainable Open Source Software
Projects](https://aaronstannard.com/sustainable-open-source-software/), by Aaron Stannard

* [The Next Decade of .NET Open
  Source](https://aaronstannard.com/next-decade-dotnet/), by Aaron Stannard

* [The Day AppGet
  Died](https://medium.com/@keivan/the-day-appget-died-e9a5c96c8b22), by Keivan
  Beigi

* [Why we terminated our partnership with
  Microsoft](https://paulstovell.com/re-next-decade-of-open-source/), by Paul
  Stovell

## Action: Customer Development

In order support these objectives, we need to collect more customer data.
Specifically, we should research the following:

* **Quantitative competitive analysis of OSS ecosystems**. We should consider
  ordering market research that compares the perceptions of various open source
  ecosystems, such as .NET, JS/NPM, and Java. This would help us to gain more
  insight into how the market views .NET and how that compares to other
  ecosystems. Right now, such insights are anecdotal since the sample size are
  too small.

* **How businesses select which technologies and libraries to depend on**. There
  is lots of anecdotal evidence that Microsoft customers prefer to use
  technologies built by & supported by Microsoft. Sometimes, the same customers
  also use other ecosystems, such as Java and NPM, where this isn't an option.
  We need to understand what they are looking for in each of these ecosystems
  and how they think of this double standard. This data will be used to inform
  how we proceed from the maturity model.  

* **What is important to library developers**. There is an inherent assumption
  that library developers want to be consumed by as many consumers as possible.
  First, this might not actually be true in all cases but even if it is, it
  doesn't necessarily mean that library authors greatly care to be attractive
  for business. For instance, would library developers appreciate a maturity
  model that prescribes specific practices and quality gates, or would they
  ignore it? Are there any concerns that are specific to library authors
  depending on other libraries (compared to app developers depending on
  libraries)?

## Action: Technical Insights

* **Shading in Java.** We need to understand how shading in Java works.
  Specifically, what does it enable, what is the resulting user experience for
  the library producer & consumer, is there validation that prevents shaded
  dependencies from leaking, how does it handle conflicts & how well, do package
  managers have a direct understanding of shading, and are there are any known
  issues with this feature.

* **Side-by-side loading in Java.** Another feature of Python and JS is the
  ability to load multiple versions of a component if its major version has
  changed. For example, LibA is used by B and C, B requires LibA v1.0 and C
  requires LibA v2.0 and there are breaking changes between v1 and v2. (Using
  semver, it is assumed there are breaking changes across major versions). A
  quote from a dev working on Azure SDK for JS: "JavaScript uses many
  dependencies that are non-Microsoft owned as this is easy to do (libraries
  follow semantic versioning, side-by-side versioning is possible and can be
  configured via package.json and so it is typical and expected in our
  ecosystem)". Both Python and JS aren't compiled language so doing this
  relatively simple. It would be interesting to see how side-by-side loading
  works in Java and whether this is tied to shading.
