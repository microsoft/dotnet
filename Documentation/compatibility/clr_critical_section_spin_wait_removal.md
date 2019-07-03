## CLR critical section spin-wait removal

### Scope

Transparent

### Version Introduced
4.8

### Source Analyzer Status

NotPlanned

### Change Description

By default, when a thread cannot acquire a critical section, it spin-waits for a while before blocking the thread unless it can acquire the critical section. This behavior can lead to poor scalability.

Starting with applications running under .NET Framework 4.8, it is possible to disable the spin-waiting. This is an opt-in behavior; spin-waiting when a critical section cannot be acquired is the default behavior on all versions of the .NET Framework.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

You can disable the default behavior of spin-waiting when a critical section cannot be acquired, in one of the following ways:

By setting the following environment variable before starting the process:
  `COMPlus_Crst_DisableSpinWait=1`

By including the runtime configuration option in <app>.exe.config. Example:
  ```xml
  <?xml version="1.0" encoding="utf-8" ?>
  <configuration>
    <runtime>
      <Crst_DisableSpinWait enabled="1"/>
    </runtime>
  </configuration>
  ```

### Affected APIs

None
