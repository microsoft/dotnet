## Binding a WPF selector property (such as 'SelectedItem') to a static property does not work

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Planned

### Change Description
In the .NET Framework 4.5, WPF Selector properties (such as 'SelectedItem' on <xref:System.Windows.Controls.ListBox?displayProperty=name> or <xref:System.Windows.Controls.DataGrid?displayProperty=name>) that are data-bound to static properties do not properly update when their bound property is updated.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This behavior was reverted in a servicing update for the .NET Framework 4.5. To fix this issue, update the .NET Framework 4.5, or upgrade to .NET Framework 4.5.1 or later.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

[More information](https://social.msdn.microsoft.com/Forums/vstudio/56ff3199-5abc-454e-87f7-bafff43e7422/net-45-critical-selecteditem-not-setting-binding-item?forum=wpf)

<!--
    ### Notes
    We could look for FrameworkElement.SetBinding calls, but this is such a corner case of that (selected properties and static properties) that it would probably be too noisy. A xaml analyzer is probably our best bet, and that's not even going to be perfect
-->

<!-- breaking change id: 99 -->
