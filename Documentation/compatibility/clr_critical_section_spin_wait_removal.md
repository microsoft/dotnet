## CLR critical section spin-wait removal

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

In the CLR's `Crst` type, when a critical section cannot be acquired, spin-waiting is done and that can lead to poor scalability.

Change

An option has been exposed to remove the spin-waiting.

The change can be opted into by setting the following environment variable before starting the process:
  `COMPlus_Crst_DisableSpinWait=1`

### Recommended Action

None. Non-default modes do not receive as much testing as the default mode.

### Affected APIs

None
