## Changes in path normalization

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with apps that target the .NET Framework 4.6.2, the way in which the
runtime normalizes paths has changed.

Normalizing a path involves modifying the string that identifies a path or file
so that it conforms to a valid path on the target operating system.
Normalization typically involves:

- Canonicalizing component and directory separators.
- Applying the current directory to a relative path.
- Evaluating the relative directory (.) or the parent directory (..) in a path.
- Trimming specified characters.

Starting with apps that target the .NET Framework 4.6.2, the following changes
in path normalization are enabled by default:

- The runtime defers to the operating system's [GetFullPathName](https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfullpathnamew) function to normalize paths.
- Normalization no longer involves trimming the end of directory segments (such as a space at the end of a directory name).
- Support for device path syntax in full trust, including `\\.\` and, for file I/O APIs in mscorlib.dll, `\\?\`.
- The runtime does not validate device syntax paths.
- The use of device syntax to access alternate data streams is supported.

These changes improve performance while allowing methods to access previously inaccessible paths.
Apps that target the .NET Framework 4.6.1 and earlier versions but are running under the .NET Framework 4.6.2 or later are unaffected by this change.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
Apps that target the .NET Framework 4.6.2 or later can opt out of this change and use legacy normalization by adding the following to the `<runtime>` section of the application configuration file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.IO.UseLegacyPathHandling=true" />
   </runtime>
   ```

Apps that target the .NET Framework 4.6.1 or earlier but are running on the .NET Framework 4.6.2 or later can enable the changes to path normalization by adding the following line to the `<runtime>` section of the application .configuration file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.IO.UseLegacyPathHandling=false" />
   </runtime>
   ```

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!--
    ### Original Bug
    195340
-->

<!-- breaking change id: 163 -->
