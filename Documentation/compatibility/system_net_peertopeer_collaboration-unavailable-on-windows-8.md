## System.Net.PeerToPeer.Collaboration unavailable on Windows 8

### Scope
Major

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

The System.Net.PeerToPeer.Collaboration namespace is unavailable on Windows 8 or above.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Apps that support Windows 8 or above must be updated to not depend on this namespace or its members.

### Affected APIs
* `N:System.Net.PeerToPeer.Collaboration`

### Category
Networking

<!-- breaking change id: 11 -->
