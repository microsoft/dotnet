# Rare crashes can occur when background GC is enabled in applications that allocate and free large objects at a high rate

## Symptoms

When background GC is enabled, an application running on .NET Framework 4.7.1 experiences
intermittent crashes that did not occur when running on other .NET Framework versions.

## Cause

.NET Framework 4.7.1 includes changes that improve background GC performance. It allows large object allocations during part of the BGC sweep phase and the large objects allocated during this time must be marked correctly in the allocator or it will be erroneously reclaimed. A GC can be triggered during the large object allocator code path and if the following happens this bug will be triggered:

- this is a BGC 

- the range for BGC changed from the previous range (ie, a new segment is allocated outside of the previous range)

- the new large object is in the region that didn't exist in the previous range

- the new large object did its marking during the BGC sweep phase

which makes this bug very rare.

Since GC doesn't shrink the range, it means this bug usually is only seen very early on during a process or when you suddenly allocate more large objects than before which requires acquiring a new segment that's outside the heap range.


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
at a much lower rate. However, please note that this workaround do not provide a guarantee - it just makes the chance of this bug happening smaller.

## Resolution

This problem is fixed in [.NET Framework 4.7.2](http://go.microsoft.com/fwlink/?LinkId=863281).

