## Apps published with ClickOnce that use a SHA-256 code-signing certificate may fail on Windows 2003

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Available

### Change Description
The executable is signed with SHA256. Previously, it was signed with SHA1 regardless of whether the code-signing certificate was SHA-1 or SHA-256. This applies to:

- All applications built with Visual Studio 2012 or later.
- Applications built with Visual Studio 2010 or earlier on systems with the .NET Framework 4.5 present.

In addition, if the .NET Framework 4.5 or later is present, the ClickOnce manifest is also signed with SHA-256 for SHA-256 certificates regardless of the .NET Framework version against which it was compiled.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
The change in signing the ClickOnce executable affects only Windows Server 2003 systems; they require that KB 938397 be installed.

The change in signing the manifest with SHA-256 even when an app targets the .NET Framework 4.0 or earlier versions introduces a runtime dependency on the .NET Framework 4.5 or a later version.

### Affected APIs
* Investigate applicable APIs

### Category
ClickOnce

<!--
    ### Notes
    Only affects WinServer 2003; there is a KB to address it.  Could flag it if we detect click-once being used (especially if it has a SHA-1 code-signing cert)
-->

<!-- breaking change id: 63 -->
