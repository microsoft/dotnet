## 64: Managed browser hosting controls from the .NET Framework 1.1 and 2.0 are blocked

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Not planned

### Change Description
Hosting these controls is blocked in Internet Explorer. 

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Internet Explorer will fail to launch an application that uses managed browser hosting controls. The previous behavior can be restored by setting the EnableIEHosting value of the registry subkey `HKLM/SOFTWARE/MICROSOFT/.NETFramework` to `1` for x86 systems and for 32-bit processes on x64 systems, and by setting the `EnableIEHosting` value of the registry subkey `HKLM/SOFTWARE/Wow6432Node/Microsoft/.NETFramework` to `1` for 64-bit processes on x64 systems.

### Affected APIs
* Not detectable via API analysis

### Category
Web Applications

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#web)
