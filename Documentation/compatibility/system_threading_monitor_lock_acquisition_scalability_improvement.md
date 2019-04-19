## System.Threading.Monitor lock acquision scalability improvement

### Scope

Importance: Transparent
Type: Runtime

### Version Introduced

4.8

### Source Analyzer Status

NotPlanned
(not applicable)

### Change Description

The change is not expected to impact compatibility in the default mode (enabled).

Issue

`Monitor.Enter()` had a scalability issue. When thread T cannot acquire the lock and there are threads waiting to acquire the lock, thread T performs a spin-wait in a way that may make it more difficult for other threads to acquire the lock. This issue could cause a positive feedback loop that leads to a perpetual lock convoy.

Change

When there is a waiter present, a thread attempting to acquire the lock will skip the portion of spin-waiting that makes it more difficult for other threads to acquire the lock.

The change can be opted out of by setting the following environment variable before starting the process:
  `COMPlus_Monitor_SpinWithoutSleepWhenWaiterIsPresent=1`

### Recommended Action

None. Non-default modes do not receive as much testing as the default mode.

### Affected APIs

`System.Threading.Monitor.Enter()`
