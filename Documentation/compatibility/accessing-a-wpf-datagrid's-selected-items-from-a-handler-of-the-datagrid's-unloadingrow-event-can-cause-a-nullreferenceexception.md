## Accessing a WPF DataGrid's selected items from a handler of the DataGrid's UnloadingRow event can cause a NullReferenceException

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Planned

### Change Description

Due to a bug in the .NET Framework 4.5, event handlers for
<xref:System.Windows.Controls.DataGrid> events involving the removal of a row
can cause a <xref:System.NullReferenceException?displayProperty=name> to be
thrown if they access the
<xref:System.Windows.Controls.DataGrid>'s
<xref:System.Windows.Controls.Primitives.Selector.SelectedItem?displayProperty=name>
or <xref:System.Windows.Controls.Primitives.MultiSelector.SelectedItems?displayProperty=name>
properties.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue has been fixed in the .NET Framework 4.6 and may be addressed by upgrading to that version of the .NET Framework.

### Affected APIs
* `E:System.Windows.Controls.DataGrid.UnloadingRow`
* `E:System.Windows.Controls.DataGrid.UnloadingRowDetails`

### Category
Windows Presentation Foundation (WPF)

<!-- breaking change id: 107 -->
