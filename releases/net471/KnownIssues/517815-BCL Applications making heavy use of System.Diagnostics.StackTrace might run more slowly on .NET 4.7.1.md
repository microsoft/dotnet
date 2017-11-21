# BCL Applications making heavy use of System.Diagnostics.StackTrace or Exception.StackTrace might run more slowly on .NET 4.7.1

## Symptoms
Application that had acceptable performance running on .NET 4.7 executes more slowly when running on .NET 4.7.1

## Cause
.NET 4.7.1 added support for detecting and parsing the Portable PDB format to show file and line number information in stack traces. As part of this change each function in a 
stack trace needed to have its defining module checked to determine if that module used the Portable PDB format. Due to some differences in the internal caching policy the 
runtime would spend far more time searching for Portable PDBs than previous .NET versions spent searching for classic Windows PDBs. This caused formatted stack traces to be
produced more slowly than before. 

The issue was originally reported here: https://github.com/Microsoft/dotnet/issues/529

## Workarounds
Calling the System.Diagnostics.StackTrace..ctor(bool) with a parameter of false will avoid capturing source information. This avoids the portion of the code where performance
regressed.

## Resolution
The fix for Windows 10 Fall Creators Update is expected in a future servicing update. 
