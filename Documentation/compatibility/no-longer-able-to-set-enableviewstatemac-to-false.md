## No longer able to set EnableViewStateMac to false

### Scope
Major

### Version Introduced
4.5.2

### Source Analyzer Status
Available

### Change Description
ASP.NET no longer allows developers to specify `<pages enableViewStateMac="false"/>` or `<@Page EnableViewStateMac="false" %>`. The view state message authentication code (MAC) is now enforced for all requests with embedded view state. Only apps that explicitly set the EnableViewStateMac property to `false` are affected.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
EnableViewStateMac must be assumed to be true, and any resulting MAC errors must be resolved (as explained in [this guidance](https://support.microsoft.com/kb/2915218), which contains multiple resolutions depending on the specifics of what is causing MAC errors).

### Affected APIs
* Not detectable via API analysis

### Category
ASP.NET

<!-- breaking change id: 14 -->
