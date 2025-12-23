## ClickOnce supports SHA-256 on 4.0-targeted apps

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
Planned

### Change Description
Previously, a ClickOnce app with a certificate signed with SHA-256 would require
.NET Framework 4.5 or later to be present, even if the app targeted 4.0. Now, .NET Framework 4.0-targeted
ClickOnce apps can run on .NET Framework 4.0, even if signed with SHA-256.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
This change removes that dependency and allows SHA-256 certificates to be used
to sign ClickOnce apps that target .NET Framework 4 and earlier versions.

### Affected APIs
* Not detectable via API analysis

### Category
ClickOnce

<!--
    ### Notes
    We could possibly detect this by analyzing ClickOnce manifests and looking for SHA-256 certs.
-->

<!-- breaking change id: 79 -->
