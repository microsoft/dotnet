## DataGridCellsPanel.BringIndexIntoView throws ArgumentOutOfRangeException

### Scope
Edge

### Version Introduced
4.6.2

### Version Reverted
4.7

### Source Analyzer Status
NotPlanned

### Change Description

<xref:System.Windows.Controls.DataGrid.ScrollIntoView(System.Object)>
will work asynchronously when column virtualization is enabled but the column
widths have not yet been determined.  If columns are removed before the
asynchronous work happens, an
<xref:System.ArgumentOutOfRangeException?displayProperty=name> can occur.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Any one of the following:
1. Upgrade to .NET Framework 4.7.
2. Install the latest servicing patch for .NET Framework 4.6.2.
3. Avoid removing columns until the asynchronous response to <xref:System.Windows.Controls.DataGrid.ScrollIntoView(System.Object)> has completed.

### Affected APIs
- `M:System.Windows.Controls.DataGrid.ScrollIntoView(System.Object)`
- `M:System.Windows.Controls.DataGrid.ScrollIntoView(System.Object,System.Windows.Controls.DataGridColumn)`

### Category
Windows Presentation Foundation (WPF)

<!--
Original Bug: 272673
-->

<!-- breaking change id: 151 -->
