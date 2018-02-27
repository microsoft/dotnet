## Long path support

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description

Starting with apps that target the .NET Framework 4.6.2, long paths (of up to
32K characters) are supported, and the 260-character (or `MAX_PATH`) limitation
on path lengths has been removed.

For apps that are recompiled to target the .NET Framework 4.6.2, code paths that
previously threw a <xref:System.IO.PathTooLongException?displayProperty=name>
because a path exceeded 260 characters will now throw a
<xref:System.IO.PathTooLongException?displayProperty=name> only under the
following conditions:

- The length of the path is greater than <xref:System.Int16.MaxValue> (32,767) characters.
- The operating system returns `COR_E_PATHTOOLONG` or its equivalent.

For apps that target the .NET Framework 4.6.1 and earlier versions, the runtime
automatically throws a
<xref:System.IO.PathTooLongException?displayProperty=name> whenever a path
exceeds 260 characters.

- [X] Quirked
- [ ] Build-time break

### Recommended Action

For apps that target the .NET Framework 4.6.2, you can opt out of long path
support if it is not desirable by adding the following to the `<runtime>`
section of your `app.config` file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.IO.BlockLongPaths=true" />
   </runtime>
   ```

For apps that target earlier versions of the .NET Framework but run on the .NET
Framework 4.6.2 or later, you can opt in to long path support by adding the
following to the `<runtime>` section of your `app.config` file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.IO.BlockLongPaths=false" />
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

<!-- breaking change id: 162 -->
