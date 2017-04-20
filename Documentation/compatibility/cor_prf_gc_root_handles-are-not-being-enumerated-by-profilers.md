## COR_PRF_GC_ROOT_HANDLEs are not being enumerated by profilers

### Scope
Minor

### Version Introduced
4.5.1

### Version Reverted
4.6

### Source Analyzer Status
Not planned

### Change Description

In the .NET Framework v4.5.1, the profiling API `RootReferences2()` is incorrectly never returning `COR_PRF_GC_ROOT_HANDLE` (they are returned as `COR_PRF_GC_ROOT_OTHER` instead). This issue is fixed beginning in the .NET Framework 4.6.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue has been fixed in the .NET Framework 4.6 and may be addressed by upgrading to that version of the .NET Framework.

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!--
    ### Notes
    Native code analysis needed. Also, this could be categorized as 'profiling' but I chose to call it 'core' because there are no other profiling issues. We can add that category in the future if enough issues crop up to justify it.
-->

<!-- breaking change id: 117 -->
