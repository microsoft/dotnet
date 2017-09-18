## ServiceBase doesn't propagate OnStart exceptions

### Scope

Minor

### Version Introduced

4.7.1

### Source Analyzer Status

NotPlanned

### Change Description

Exceptions from services that fail to start will now be propagated from ServiceBase.Run

- [x] Quirked
- [ ] Build-time break

### Recommended Action
On service start, if there is an exception, that exception will be propagated. This should help diagnose cases where services fail to start.

### Affected APIs
* `M:System.ServiceProcess.ServiceBase.Run`
