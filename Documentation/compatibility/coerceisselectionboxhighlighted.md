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
Certain sequences of actions involving a ComboBox and its data source can result in a `NullReferenceException`.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If possible, please upgrade to .NET 4.6.2.

### Affected APIs
* `P:System.Windows.Controls.ComboBox.IsSelectionBoxHighlighted`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    125219
-->

<!-- breaking change id: 179 -->
