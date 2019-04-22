## Workflow XAML checksums for symbols changed from SHA1 to SHA256

### Scope
Minor

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
To support debugging with Visual Studio, 
the Workflow runtime generates a checksum for a workflow XAML file using a hashing algorithm.
In the .NET Framework 4.6.2 and earlier versions, workflow checksum hashing used the MD5 
algorithm, which caused issues on FIPS-enabled systems. Starting with the .NET Framework 4.7, 
the default algorithm was changed to SHA1. Starting with the .NET Framework 4.8, the default
algorithm was changed to SHA256.

- [x] Quirked 
- [ ] Build-time break 

### Recommended Action
If your code is unable to load workflow instances or to find appropriate symbols
due to a checksum failure, try setting 
the `AppContext` switch "Switch.System.Activities.UseSHA1HashForDebuggerSymbols" to true.

In code:
```csharp
System.AppContext.SetSwitch("Switch.System.Activities.UseSHA1HashForDebuggerSymbols", true);
```

Or in configuration:
```xml
<configuration>
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.Activities.UseSHA1HashForDebuggerSymbols=true" /> 
   </runtime>
</configuration>
```

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

<!--
    ### Original Bug
    Bug link goes here

https://devdiv.visualstudio.com/DevDiv/_workitems/edit/537692

-->
