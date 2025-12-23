# Setup fails to install files on OS when upgraded from Windows 7 SP1 or Windows Server 2008 R2 with .NET Framework 4.7.2

## Symptoms
When you install the .NET Framework 4.7.2 on Windows 10 version 1803 or lower and your system was upgraded from Windows 7 SP1 with .NET Framework 4.7.2 , .NET 4.7.2 setup installation reports success but fails to install .NET 4.7.2 files on the machine.

Consider the following scenario:
  1. On Windows 7 SP1 or Windows Server 2008 R2, install the .NET Framework 4.7.2
  2. Upgrade the machine to Windows 10 Fall Creators (version 1709) or lower. The upgraded OS can be any version of Windows 8.1, Windows 10, or Windows Server 2008 R2.
  3. Run .NET 4.7.2 setup.
  4. .NET Framework 4.7.2 setup reports successful installation but fails to install .NET Framework files.

Note: This issue does not occur when upgrading to Windows 10 April 2018 Update (version 1803) because it comes pre-installed with .NET Framework 4.7.2.

## Cause
This issue occurs because the OS upgrade leaves behind .NET Framework 4.7.2 setup files in the Windows installer cache and its registration. Due to a bug in .NET Framework setup that checks for the setup files in Windows installer, setup determines that .NET Framework 4.7.2 is already installed and thus skips installing .NET framework files on the upgraded Windows 10 machine.

## Impact
.NET 4.7.2 setup reports successful installation but skips installing its files and registry entries.

Note: This issue occurs only when you upgrade from Windows 7 or Windows Server 2008 R2 with .NET Framework 4.7.2 already installed.

## Resolution
Upgrade to Windows 10 April 2018 Update (Version 1803) or later version.They come pre-installed with .NET Framework 4.7.2 or a later version.

Alternatively, you can install .NET Framework 4.7.2 on the failed machine by directly installing the respective MSU from Microsoft Update Catalog:
* [Windows Server 2012](https://www.catalog.update.microsoft.com/Search.aspx?q=4054542)
* [Windows 8.1 or Windows Server 2012 R2](https://www.catalog.update.microsoft.com/Search.aspx?q=4054566)
* [Windows 10 Anniversary Update or Windows 10 Creator Update](https://www.catalog.update.microsoft.com/Search.aspx?q=4054590)
* [Windows 10 Fall Creators ](https://www.catalog.update.microsoft.com/Search.aspx?q=4073120)

If you choose not to follow the previous two resolutions, you can run the following commands from an administrator command prompt to remove the setup registration and re-run .NET Framework 4.7.2 setup.

On a Windows x64 machine:
```
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Patches\0AE22574CBE1266379CC1B5852EA79B8 /f
```

On a Windows x86 machine:
```
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Patches\4758749C64399713BA590E9520B4EEC8 /f
```
