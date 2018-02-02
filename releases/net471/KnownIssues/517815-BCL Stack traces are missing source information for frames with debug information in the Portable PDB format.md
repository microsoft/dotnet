# Stack traces are missing source information for frames with debug information in the Portable PDB format when running on .Net Framework 4.7.1

## Symptoms

An application that formats stack traces is missing source information for some or all frames. This includes stack traces formatted via [System.Exception.ToString()](https://docs.microsoft.com/en-us/dotnet/api/system.exception.tostring?view=netframework-4.7.1), [System.Exception.StackTrace](https://docs.microsoft.com/en-us/dotnet/api/system.exception.stacktrace?view=netframework-4.7.1) and [System.Diagnostics.StackTrace.ToString()](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.stacktrace.tostring?view=netframework-4.7.1).
The frames missing source information must reside in assemblies that have pdbs in the [Portable PDB format](https://github.com/dotnet/core/blob/master/Documentation/diagnostics/portable_pdb.md) present on disk.

## Cause

The .NET Framework 4.7.1 added support for detecting and parsing the Portable PDB file format to show file and line number information in stack traces. However due to an unfortunate [implementation issue](https://github.com/Microsoft/dotnet/blob/master/releases/net471/KnownIssues/517815-BCL%20Applications%20making%20heavy%20use%20of%20System.Diagnostics.StackTrace%20might%20run%20more%20slowly%20on%20.NET%204.7.1.md) the feature introduced unacceptable performance impact for some customers and Microsoft intentionally disabled it.

## Workarounds

- If you are in control of the build process for the problematic assemblies you may be able to configure it to generate the classic Windows PDB format instead.
- You can use a [conversion utility](https://github.com/dotnet/symreader-converter) to create equivalent classic Windows format PDBs and use those in lieu of the Portable PDBs when running on .Net Framework 4.7.1. 

## Resolution

A fix is anticipated for .Net Framework 4.7.2 that restores Portable PDB functionality with greatly improved performance.