## The .NET Framework 4.6 does not use a 4.5.x.x version when registering itself in the registry

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Not planned

### Change Description
As one might expect, the version key set in the registry (at `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\NET Framework Setup\NDP\v4\Full`) for the .NET Framework 4.6 begins with '4.6', not '4.5'. Apps that depend on these registry keys to know which .NET Framework versions are installed on a machine should be updated to understand that 4.6 is a new possible version, and one that is compatible with previous 4.5.x releases.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Update apps probing for a .NET Framework 4.5 install by looking for 4.5 registry keys to also accept 4.6.

### Affected APIs
* Not detectable via API analysis

### Category
Setup and Deployment

[More information](~/docs/framework/migration-guide/mitigation-product-versioning.md)

<!-- breaking change id: 122 -->
