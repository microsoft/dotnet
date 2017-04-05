## 130: Marshal.SizeOf and Marshal.PtrToStructure overloads break dynamic code

### Scope
Minor

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description
Beginning in the .NET Framework 4.5.1, dynamically binding to the methods `Marshal.SizeOf` or `Marshal.PtrToStructure `
(via Windows PowerShell, IronPython, or the C# dynamic keyword, for example) can result in `MethodInvocationExceptions` because
new overloads of these methods have been added that may be ambiguous to the scripting engines. 

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Update scripts to clearly indicate which overload shouldbe used. This can typically done by explicitly casting the 
methods' type parameters as `System.Type`. See [this link](https://support.microsoft.com/en-us/kb/2909958/) for more
detail and examples of how to workaround the issue.

### Affected APIs
* Not detectable via API analysis

### Category
Core

[More information](https://support.microsoft.com/en-us/kb/2909958/)

<!--
    ### Notes
    The only case that we can reasonably find with C# analyzers will be the case of dynamic objects being passed to SizeOf 
    or PtrToStructure methods without an explicit cast.  Also, note that APIs for ApiPort are not listed to search for 
    since the broken cases are so narrow that the rules would likely add more noise than they're worth.
-->

