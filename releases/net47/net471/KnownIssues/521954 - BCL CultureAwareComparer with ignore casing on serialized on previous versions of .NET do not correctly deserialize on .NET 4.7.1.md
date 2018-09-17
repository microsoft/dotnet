# CultureAwareComparer with ignore casing serialized on previous versions of .NET Framework does not correctly deserialize on .NET Framework 4.7.1 

## Symptoms

When deserializing a CultureAwareComparer that was serialized using ignore case on a previous version of .NET Framework on a machine running .NET Framework 4.7.1, the comparer becomes case sensitive.

## Cause

In the .NET Framework 4.7.1 we added the ability to specify more comparer options when doing a culture-aware comparison. 
As part of that change we introduced a new field on the comparer that holds the information about what kind of comparison is requested.

When that type, coming from a version of .NET Framework prior to 4.7.1 is deserialized on a .NET Framework 4.7.1 machine, the private field introduced in the .NET Framework 4.7.1 is reset to zero, which makes the comparer case sensitive.

## Impact

The following 2 comparers are susceptible to this issue. These comparers are usually used with collection types like Dictionary and Hashtable.
P:System.StringComparer.InvariantCultureIgnoreCase
P:System.StringComparer.CurrentCultureIgnoreCase

## Workarounds

Ensure that both serialization and deserialization occurs on systems running a version of the .NET Framework starting with 4.7.1.

## Resolution

If you are running on Windows 10 Fall Creators Update, an update is available that addresses this issue. Select one of the following links based on your processor architecture:

    x86: https://go.microsoft.com/fwlink/?linkid=862758

    x64: https://go.microsoft.com/fwlink/?linkid=862762

[09-Jan-2018] The fix for this issue is included  in the [Update for .NET Framework 4.7.1 - KB4054856](http://go.microsoft.com/fwlink/?LinkId=866028) for all platforms except Windows 10 Fall Creators Update.