## Changing the IsEnabled property of the parent of a TextBlock control affects any child controls

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with the .NET Framework 4.6.2, changing the
<xref:System.Windows.UIElement.IsEnabled?displayProperty=name> property of the
parent of a <xref:System.Windows.Controls.TextBlock?displayProperty=name>
control affects any child controls (such as hyperlinks and buttons) of the
<xref:System.Windows.Controls.TextBlock?displayProperty=name> control.

In the .NET Framework 4.6.1 and earlier versions, controls inside a
<xref:System.Windows.Controls.TextBlock?displayProperty=name> did not always
reflect the state of the
<xref:System.Windows.UIElement.IsEnabled?displayProperty=name> property of the
<xref:System.Windows.Controls.TextBlock?displayProperty=name> parent.

- [ ] Quirked
- [ ] Build-time break 

### Recommended Action
None. This change conforms to the expected behavior for controls inside a <xref:System.Windows.Controls.TextBlock?displayProperty=name> control.

### Affected APIs
- `P:System.Windows.UIElement.IsEnabled`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    213267
-->

<!-- breaking change id: 161 -->
