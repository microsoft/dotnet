## IPad should not be used in custom capabilities file because it is now a browser capability

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
Beginning in .NET Framework 4.5, iPad is an identifier in the default ASP.NET browser capabilities file, so it should not be used in a custom capabilities file

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If iPad-specific capabilities are required, it is necessary to modify iPad behavior by setting capabilities on the pre-defined gateway refID "IPad" instead of by generating a new "IPad" ID by user agent matching.

### Affected APIs
* Not detectable via API analysis

### Category
ASP.NET

<!--
    ### Notes
    For analyzer, can look for 'iPad' in .browser capability files
-->

<!-- breaking change id: 118 -->
