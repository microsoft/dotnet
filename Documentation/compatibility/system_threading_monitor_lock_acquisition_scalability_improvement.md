## System.Threading.Monitor lock acquision scalability improvement

### Scope

Transparent

### Version Introduced
4.8

### Source Analyzer Status

NotPlanned

### Change Description

In applications running on .NET Framework 4.7.2 and earlier versions, when a thread, `T`, cannot acquire a lock, and other threads are also waiting to acquire it, thread `T` performs a spin-wait that may make it more difficult for other threads to acquire the lock. This behavior can cause a positive feedback loop that leads to a perpetual lock convoy.

Starting with applications running on the .NET Framework 4.8, a thread attempting to acquire a lock when there is a waiter present skips the portion of spin-waiting that makes it more difficult for other threads to acquire the lock.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

For applications running on the .NET Framework 4.8, the spin-waiting behavior described above can be reverted to the behavior in .NET Framework 4.7.2 in one of the following ways:

By setting the following environment variable before starting the process:
  `COMPlus_Monitor_SpinWithoutSleepWhenWaiterIsPresent=1`

By including the runtime configuration option in <app>.exe.config. Example:
  ```xml
  <?xml version="1.0" encoding="utf-8" ?>
  <configuration>
    <runtime>
      <Monitor_SpinWithoutSleepWhenWaiterIsPresent enabled="1"/>
    </runtime>
  </configuration>
  ```

### Affected APIs

* `M:System.Threading.Monitor.Enter(System.Object)`
* `M:System.Threading.Monitor.Enter(System.Object,System.Boolean)`
* `M:System.Threading.Monitor.TryEnter(System.Object)
* `M:System.Threading.Monitor.TryEnter(System.Object,System.Boolean@)
* `M:System.Threading.Monitor.TryEnter(System.Object,System.Int32)
* `M:System.Threading.Monitor.TryEnter(System.Object,System.Int32,System.Boolean@)
* `M:System.Threading.Monitor.TryEnter(System.Object,System.TimeSpan)
* `M:System.Threading.Monitor.TryEnter(System.Object,System.TimeSpan,System.Boolean@)
