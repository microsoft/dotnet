# Rare crashes can occur when background GC is enabled in applications which allocate and free large objects at a high rate

## Symptoms

When background GC is enabled, an application running against .NET Framework 4.7.1 experiences
intermittent crashes which did not occur when running against other .NET Framework versions.

## Cause

Changes to the GC in .NET Framework 4.7.1 caused this problem.

Specifically, .NET Framework 4.7.1 contains changes which improve background GC performance.
These changes unintentionally introduced cases where a rare combination of factors can cause
the background GC to reclaim a large object while the program is still using it.

## Impact

This problem impacts applications which run with the background GC enabled and which also allocate
and free large objects at a high rate. As described in [this article](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/fundamentals#the-managed-heap),
a large object is any object that is 85,000 bytes or larger in size.

This problem is rare, and is more likely to occur when running against the x86 version of the
.NET Framework than when running against the x64 version of the .NET Framework.

## Workarounds

The most practical workaround is to disable the background GC using the configuration file
elements described in [this article](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/gcconcurrent-element).

The only other workaround is to change the application to allocate and free large objects
at a much lower rate.

## Resolution

This problem is fixed in .NET Framework 4.7.2.

