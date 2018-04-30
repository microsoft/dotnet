## WinForm's Domain upbutton and downbutton actions are in sync now

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
Not planned

### Change Description
In the .NET Framework 4.7.1 and previous versions the <xref:System.Windows.Forms.DomainUpDown> 
control's <xref:System.Windows.Forms.DomainUpDown.UpButton?displayProperty=nameWithType>
action is ignored when control text is present, and the developer is required to use <xref:System.Windows.Forms.DomainUpDown.DownButton?displayProperty=nameWithType> action on the control before using <xref:System.Windows.Forms.DomainUpDown.UpButton?displayProperty=nameWithType> action.
Starting with the .NET Framework 4.7.2 both the <xref:System.Windows.Forms.DomainUpDown.UpButton?displayProperty=nameWithType> and <xref:System.Windows.Forms.DomainUpDown.DownButton?displayProperty=nameWithType> actions work independently in this scenario and remain in sync.

- [X] Quirked
- [ ] Build-time break

### Recommended Action

In order for an application to benefit from these changes, it must run on the .NET Framework 4.7.2 or later. The application can benefit from these changes in either of the following ways:
- It is recompiled to target the .NET Framework 4.7.2. This change is enabled by default on Windows Forms applications that target the .NET Framework 4.7.2 or later.
- It opts out of the legacy scrolling behavior by adding the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the `<runtime>` section of the app config file and setting it to `false`, as the following example shows.

```xml
<runtime>
        <AppContextSwitchOverrides value="Switch.System.Windows.Forms.DomainUpDown.UseLegacyScrolling=false"/>
</runtime>
```

### Affected APIs
`M:System.Windows.Forms.DomainUpDown.UpButton`
`M:System.Windows.Forms.DomainUpDown.DownButton`


### Category
Windows Forms

<!-- breaking change id: 53 -->
