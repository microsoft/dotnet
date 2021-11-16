## System.Threading.Timer lock contention improvement

### Scope

Transparent

### Version Introduced
4.8

### Source Analyzer Status

NotPlanned

### Change Description

Timers use a lock, and multiple timers can contend with one another for a lock, which can result in excessive CPU usage.

For apps that run under .NET Framework 4.8, an opt-in configuration section may reduce the impact of timers contending for a lock. This change is especially important for high-performance applications.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Applications running on .NET Framework 4.8 can opt into this change by setting the following [`AppContext` switch](https://docs.microsoft.com/dotnet/api/system.appcontext?view=netframework-4.7.2#appcontext-for-library-consumers):
  `Switch.System.Threading.UseNetCoreTimer=true`

### Affected APIs

* `T:System.Threading.Timer`
