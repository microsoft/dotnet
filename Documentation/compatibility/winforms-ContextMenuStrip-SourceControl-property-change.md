## ContextMenuStrip.SourceControl property contains a valid control in the case of nested ToolStripMenuItems

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.7.1 and previous versions, the <xref:System.Windows.Forms.ContextMenuStrip.SourceControl?displayProperty=nameWithType> property incorrectly returns null when the user opens the menu from nested <xref:System.Windows.Forms.ToolStripMenuItem> controls. 
In the .NET Framework 4.7.2 and later, <xref:System.Windows.Forms.ContextMenuStrip.SourceControl> property is always set to the actual source control.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__

In order for an application to benefit from these changes, it must run on the .NET Framework 4.7.2 or later. The application can benefit from these changes in either of the following ways:

- It targets the .NET Framework 4.7.2. This change is enabled by default on Windows Forms applications that target the .NET Framework 4.7.2 or later.
- It targets the .NET Framework 4.7.1 or an earlier version and opts out of the legacy accessibility behaviors by adding the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the `<runtime>` section of the app.config file and setting it to `false`, as the following example shows.

```xml
<runtime>
  <AppContextSwitchOverrides value="Switch.System.Windows.Forms.UseLegacyContextMenuStripSourceControlValue=false"/>
</runtime>
``` 

Applications that target the .NET Framework 4.7.2 or later, and want to preserve the legacy behavior can opt in to the use of the legacy source control value by explicitly setting this AppContext switch to `true`. 


### Affected APIs
 * `P:System.Windows.Forms.ContextMenuStrip.SourceControl`

### Category
Windows Forms

<!--
    ### 460662 
-->


