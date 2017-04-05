## 107: Accessing a WPF DataGrid's selected items from a handler of the DataGrid's UnloadingRow event can cause a NullReferenceException

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Planned

### Change Description
Due to a bug in the .NET Framework 4.5, event handlers for DataGrid events involving the removal of a row can cause a NullReferenceException to be thrown if they access the DataGrid's SelectedItem or SelectedItems properties.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue has been fixed in the .NET Framework 4.6 and may be addressed by upgrading to that version of the .NET Framework.

### Affected APIs
* `E:System.Windows.Controls.DataGrid.UnloadingRow`
* `E:System.Windows.Controls.DataGrid.UnloadingRowDetails`

### Category
Windows Presentation Foundation (WPF)
