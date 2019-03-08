## .NET Interop will now QueryInterface for IAgileObject (a WinRT interface)

### Scope
Edge

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
When using a WinRT event with a .NET delegate, Windows will QI for IAgileObject starting with the .NET Framework 4.8.  In previous versions of the .NET Framework, the runtime would fail that QI, and the event could not be subscribed.

- [ x ] Quirked
- [ ] Build-time break

### Recommended Action
If enabling the QI for IAgileObject breaks execution, you can disable this code by setting the following configuration.

#### Method 1: Environment variable

Set the following environment variable:

   COMPLUS_DisableCCWSupportIAgileObject=1

  This method affects any environment that inherits this environment variable. This might be just a single
  console session, or it might affect the entire machine if you set the environment variable globally.
  
  The environment variable name is not case-sensitive.

#### Method 2: Registry

Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then add the following:

        Value name: DisableCCWSupportIAgileObject
        Type: DWORD (32-bit) Value (also called REG_WORD)
        Value: 1

  You can use the Windows REG.EXE tool to add this value from a command-line or scripting environment. For example:
  
```console
reg add HKLM\SOFTWARE\Microsoft\.NETFramework /v DisableCCWSupportIAgileObject /t REG_DWORD /d 1
```
  
  In this case, `HKLM` is used instead of `HKEY_LOCAL_MACHINE`. Use `reg add /?` to see help on this syntax.

  The registry value name is not case-sensitive.

### Category
Core


