## Calling Items.Refresh on a WPF ListBox, ListView, or DataGrid with items selected can cause duplicate items to appear in the element

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Available

### Change Description
In the .NET Framework 4.5, calling ListBox.Items.Refresh from code while items
are selected in a <xref:System.Windows.Controls.ListBox?displayProperty=name>
can cause the selected items to be duplicated in the list. A similar issue
occurs with <xref:System.Windows.Controls.ListView?displayProperty=name> and
<xref:System.Windows.Controls.DataGrid?displayProperty=name>. This is fixed in
the .NET Framework 4.6.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue may be worked around by programatically unselecting items before
<xref:System.Windows.Data.CollectionView.Refresh?displayProperty=name> is called
and then re-selecting them after the call is completed. Alternatively, this
issue has been fixed in the .NET Framework 4.6 and may be addressed by upgrading
to that version of the .NET Framework.

### Affected APIs
* `M:System.Windows.Data.CollectionView.Refresh`

### Category
Windows Presentation Foundation (WPF)

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/873075/on-net-4-5-the-selected-items-in-a-wpf-listbox-listview-control-are-incorrect-when-items-refresh-is-called-from-code-behind)

<!-- breaking change id: 104 -->
