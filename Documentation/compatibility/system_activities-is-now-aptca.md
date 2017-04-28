## System.Activities is now APTCA

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

The assembly is marked with the <xref:System.Security.AllowPartiallyTrustedCallersAttribute?displayProperty=name> attribute.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Derived classes cannot be marked with the
<xref:System.Security.SecurityCriticalAttribute?displayProperty=name>.
Previously, derived types had to be marked with the
<xref:System.Security.SecurityCriticalAttribute?displayProperty=name>. However,
this change should have no real impact.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

<!-- breaking change id: 20 -->
