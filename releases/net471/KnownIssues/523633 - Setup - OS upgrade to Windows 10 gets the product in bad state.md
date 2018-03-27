# Application crashes occur when running on the .NET Framework 4.7.1 after upgrading from Windows 10 Anniversary Update to Windows 10 Creators Update

## Symptoms
When you install the .NET Framework 4.7.1 on Windows 10 Anniversary Update (version 1607) and your system is upgraded to Windows 10 Creators Update (version 1703), applications that depend on any version of the .NET Framework 4.x may experience unexpected crashes.

Consider the following scenario:
  1. On a Windows 10 Anniversary Update (version 1607) machine, install the .NET Framework 4.7.1.
  2. Upgrade the machine to Windows 10 Creators Update (version 1703) from Windows Update.
  3. Run an application that uses any version of .NET 4.X.
  4. The application experiences an unexpected crash. 

Note:  Windows 10 Anniversary Update (version 1607) comes pre-installed with .NET Framework 4.6.2, and you can install .NET 4.7.1 on it using an offline (or web) installer. Similarly, Windows 10 Creators Update (version 1703) comes pre-installed with .NET Framework 4.7.

## Cause
This issue occurs because the .NET Framework 4.7.1 product installation gets into a corrupted state after the OS upgrade.  The OS upgrade preserves all the .NET Framework 4.7.1 assemblies in the GAC as is, but the in-box assemblies are reverted to the in-box version (4.7). Due to this mixed state, the .NET applications exhibit unexpected behaviors.

## Impact
Applications may experience unexpected crashes in certain scenarios. For example, Visual Studio will experience a crash soon after opening a C# or VB project when .NET Framework is in this corrupted state.

Note: This issue does not occur when you do an upgrade from Windows 10 Anniversary Update (version 1607) to Windows 10 Fall Creators Update (version 1709).

## Resolution
To get the .NET Framework 4.7.1 product into a working state, you need to reinstall [.NET Framework 4.7.1](http://go.microsoft.com/fwlink/?LinkId=852107).
