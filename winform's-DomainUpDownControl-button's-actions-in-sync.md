## WinForm's Domain upbutton and downbutton actions are in sync now

### Scope
Edge

### Version Introduced
4.7.1

### Source Analyzer Status
Not planned

### Change Description
The <xref:System.Windows.Forms.DomainUpDown> 
control's <xref:System.Windows.Forms.DomainUpDown.UpButton?displayProperty=nameWithType>
action is currently ignored when control text is present and the developer is required to use <xref:System.Windows.Forms.DomainUpDown.DownButton?displayProperty=nameWithType> action on the control before using <xref:System.Windows.Forms.DomainUpDown.UpButton?displayProperty=nameWithType> action.
This change is to make both <xref:System.Windows.Forms.DomainUpDown.UpButton?displayProperty=nameWithType> and <xref:System.Windows.Forms.DomainUpDown.DownButton?displayProperty=nameWithType> actions work independantly in this scenario and are in sync.

- [ ] Quirked

### Recommended Action

In order for the application to benefit from these changes, it must run on the .NET Framework 4.7.2 or later. The application can benefit from these changes in either of the following ways:
- It is recompiled to target the .NET Framework 4.7.2. This change is enabled by default on Windows Forms applications that target the .NET Framework 4.7.2 or later.
- It opts out of the legacy accessibility behaviors by adding the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the `<runtime>` section of the app config file and setting it to false, as the following example shows.
```
<runtime>
        <AppContextSwitchOverrides value="Switch.System.Windows.Forms.DomainUpDown.UseLegacyScrolling=false"/>
</runtime>
``` 


### Affected APIs
* Not detectable via API analysis

### Category
Windows Forms

<!-- breaking change id: 53 -->
