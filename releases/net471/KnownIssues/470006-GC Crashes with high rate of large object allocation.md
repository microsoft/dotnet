# Rare crashes can occur when background GC is enabled in applications that allocate and free large objects at a high rate

## Symptoms

When background GC is enabled, an application running on .NET Framework 4.7.1 experiences
intermittent crashes that did not occur when running on other .NET Framework versions.

## Cause

.NET Framework 4.7.1 includes changes that improve background GC performance.
Because of these changes, a rare combination of factors can cause the background GC
to reclaim a large object while the program is still using it.

## Impact

This problem impacts applications that run with the background GC enabled and that also allocate
and free large objects at a high rate. As described in the article [Fundamentals of Garbage Collection](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/fundamentals#the-managed-heap),
a large object is any object that is 85,000 bytes or larger in size.

This problem is rare, and is more likely to occur when running on the x86 version of the
.NET Framework than when running on the x64 version of the 4.7.1 .NET Framework.

## Workarounds

The most practical workaround is to disable the background GC by setting the enabled attribute of the [<gcConcurrent> element](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/gcconcurrent-element) in the
  <runtime> section of your application configuration file to false.
    
The only other workaround is to change the application to allocate and free large objects
at a much lower rate.

## Resolution

This problem is fixed in [.NET Framework 4.7.2](http://go.microsoft.com/fwlink/?LinkId=863281).

