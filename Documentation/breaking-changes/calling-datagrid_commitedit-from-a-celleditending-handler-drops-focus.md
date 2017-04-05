## 124: Calling DataGrid.CommitEdit from a CellEditEnding handler drops focus

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.5.2

### Source Analyzer Status
Available

### Change Description
Calling DataGrid.CommitEdit from one of the DataGrid's CellEditEnding event handlers causes the DataGrid to lose focus.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This bug has been fixed in the .NET Framework 4.5.2, so it can be avoided by upgrading the .NET Framework. Alternatively, it can be avoided by explicitly re-selecting the DataGrid after calling CommitEdit.

### Affected APIs
* `M:System.Windows.Controls.DataGrid.CommitEdit`
* `M:System.Windows.Controls.DataGrid.CommitEdit(System.Windows.Controls.DataGridEditingUnit,System.Boolean)`

### Category
Windows Presentation Foundation (WPF)