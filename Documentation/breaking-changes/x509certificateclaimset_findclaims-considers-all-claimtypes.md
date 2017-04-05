## 143: X509CertificateClaimSet.FindClaims Considers All claimTypes

### Scope
Minor

### Version Introduced
4.6.1

### Source Analyzer Status
Planned

### Change Description
In apps that target the .NET Framework 4.6.1, if an X509 claim set is initialized from a certificate that has multiple DNS entries in its SAN field, the FindClaims method attempts to match the claimType argument with all the DNS entries.

For apps that target previous versions of the .NET Framework, the FindClaims method attempts to match the claimType argument only with the last DNS entry.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
This change only affects applications targeting the .NET Framework 4.6.1. This change may be disabled (or enabled if targetting pre-4.6.1) with the [DisableMultipleDNSEntries](https://msdn.microsoft.com/en-us/library/mt620030%28v=vs.110%29.aspx) compatibility switch.

### Affected APIs
* `M:System.IdentityModel.Claims.X509CertificateClaimSet.FindClaims(System.String,System.String)`

### Category
Windows Communication Foundation (WCF)

[More information](https://msdn.microsoft.com/en-us/library/mt620031%28v=vs.110%29.aspx#WCF)
