# CultureAwareComparer with ignore casing serialized on previous versions of .NET Framework do not correctly deserialize on .NET Framework 4.7.1 

## Symptoms

When deserialzing a CultureAwareCompare that was serialized using ignore case on a previous version of .NET Framework on a machine running .NET Framework 4.7.1 the comparer will become a case sensitive comparer.

## Cause

In .NET Framework 4.7.1 we added the ability to specify more comparer options when doing a culture-aware comparison. 
As part of that changed we introduced a new field on the comparer that hold the information about what kind of comparison is requested.

When that type, coming from a version of .NET Framework prior to 4.7.1 is deserialized on a .NET Framework 4.7.1 machine, the private field introduced in .NET 4.7.1 is reset to zero which turns the comparer into a case sensitive comparer.

## Impact

## Workarounds
