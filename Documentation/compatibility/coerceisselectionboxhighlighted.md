## CoerceIsSelectionBoxHighlighted

### Scope
Minor

### Version Introduced
4.6

### Version Reverted
4.6.2

### Source Analyzer Status
Planned

### Change Description
Certain sequences of actions involving a <xref:System.Windows.Controls.ComboBox?displayProperty=name>
and its data source can result in a <xref:System.NullReferenceException?displayProperty=name>.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If possible, upgrade to .NET Framework 4.6.2.

### Affected APIs
* `P:System.Windows.Controls.ComboBox.IsSelectionBoxHighlighted`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    125219
-->

<!-- breaking change id: 179 -->
