## System.Threading.Timer lock contention improvement

### Scope

Importance: Transparent
Type: Runtime

### Version Introduced

4.8

### Source Analyzer Status

NotPlanned
(not applicable)

### Change Description

The change is not expected to impact compatibility in the default mode (disabled).

Issue

Timers use a lock and timers may contend with one another, causing excessive CPU usage.

Change

An alternate implementation of the Timer that fixes the issue to some degree has been provided for optional use.

The change can be opted into by setting the following [AppContext switch](https://docs.microsoft.com/en-us/dotnet/api/system.appcontext?view=netframework-4.7.2#appcontext-for-library-consumers):
  `Switch.System.Threading.UseNetCoreTimer=true`

### Recommended Action

None. Non-default modes do not receive as much testing as the default mode.

### Affected APIs

`System.Threading.Timer`
