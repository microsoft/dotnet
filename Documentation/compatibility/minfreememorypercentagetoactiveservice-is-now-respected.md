## MinFreeMemoryPercentageToActiveService is now respected

### Scope
Minor

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description

This setting establishes the minimum memory that must be available on the server
before a WCF service can be activated. It is designed to prevent
<xref:System.OutOfMemoryException?displayProperty=name> exceptions. In the .NET
Framework 4.5, this setting had no effect. In the .NET Framework 4.5.1, the
setting is observed.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

An exception occurs if the free memory available on the web server is less than
the percentage defined by the configuration setting. Some WCF services that
successfully started and ran in a constrained memory environment may now fail.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Communication Foundation (WCF)


<!-- breaking change id: 32 -->
