# .NET Framework 4.7.1 installation gets into a bad state on upgrading from Windows 10 Anniversary Update

## Symptoms
When you upgrade your Windows 10 Anniversary Update (version 1607) machine to Windows 10 Creators Update (version 1703), after installing .NET Framework 4.7.1, then applications depending on any version of .NET 4.X start experiencing unexpected crashes.

Consider the following scenario:
  1. On a Windows 10 Anniversary Update (version 1607) machine install .NET Framework 4.7.1.
  2. Upgrade the machine to Windows 10 Creators Update (version 1703) from Windows Update.
  3. Run an application that uses any version of .NET 4.X.
  4. The application experiences a crash unexpectedly. 

Note:  Windows 10 Anniversary Update (version 1607) comes pre-installed with .NET Framework 4.6.2 and you can install .NET 4.7.1 on it using an offline (or web) installer. Similarly, Windows 10 Creators Update (version 1703) comes pre-installed with .NET Framework 4.7.

## Cause
This issue occurs as the .NET 4.7.1 product installation gets into a corrupted state after the OS upgrade.  The OS upgrade preserves all the .NET 4.7.1 assemblies in the GAC as-is, but the inbox assemblies are reverted to the inbox version (4.7). Due to this mixed state, the .NET exhibits unexpected behaviors.

## Impact
Applications may experience unexpected crashes in certain scenarios.

Note: This issue does not occur when you do an OS upgrade from Windows 10 Anniversary Update (version 1607) to Windows 10 Fall Creators Update (version 1709).

## Resolution
To get the .NET Framework 4.7.1 product into a working state you need to reinstall .NET 4.7.1.
