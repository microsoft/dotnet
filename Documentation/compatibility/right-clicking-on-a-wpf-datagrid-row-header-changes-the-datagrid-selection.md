## Right clicking on a WPF DataGrid row header changes the DataGrid selection

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Planned

### Change Description

Right-clicking a selected
<xref:System.Windows.Controls.DataGrid?displayProperty=name> row header while
multiple rows are selected results in the <xref:System.Windows.Controls.DataGrid?displayProperty=name>'s selection changing to only
that row.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This issue has been fixed in the .NET Framework 4.6 and may be addressed by
upgrading to that version of the .NET Framework.

### Affected APIs
* `M:System.Windows.Controls.DataGrid.#ctor`

### Category
Windows Presentation Foundation (WPF)

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/1001771/right-clicking-on-wpf-data-grid-row-header-changes-selection)

<!-- breaking change id: 103 -->
