## Improved WCF chain trust certificate validation for Net.Tcp certificate authentication

### Scope
Minor

### Version Introduced
.NET 4.7.2 and serviced on all .NET 3.5+ released versions via windows security roll-up

### Source Analyzer Status
NotPlanned

### Change Description
Improved chain trust certificate validation when using certificate authentication with transport security with WCF. With this improvement client certificates that are used to authenticate to a server must be configured for Client Authentication.  Similarly server certificates that are for the authenticating a server must be configured for Server Authentication. With this change if the root certificate is disabled, the certificate chain validation will fail. 

This change is on by default, and can be turned off by config setting.

### Recommended Action
  - Validate if your server and client certification has the required EKU, if not, update your certification
  - Validate if your root certificate is invalid, if so, update the root certificate 
  - How to opt out of change:
  If you can't update the certificate and need to work around the breaking change temporarily, you can use the config setting documented [here](https://support.microsoft.com/en-us/help/4055269/security-only-update-for-net-framework-3-5-1-4-5-2-4-6-4-6-1-4-6-2-4-7) to opt out. However, opting out of the change will leave your system vulnerable to the security issue.

### Affected APIs


### Category
Runtime


[More information](https://support.microsoft.com/en-us/help/4055269/security-only-update-for-net-framework-3-5-1-4-5-2-4-6-4-6-1-4-6-2-4-7)

   ### Original Bug
  [516393](https://devdiv.visualstudio.com/DevDiv/_workitems/edit/516393)
