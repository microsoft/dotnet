## WPF TreeViewItem must be used within a TreeView

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

A change was introduced in 4.5 that restricts usage of
<xref:System.Windows.Controls.TreeViewItem?displayProperty=name> elements
outside of a <xref:System.Windows.Controls.TreeView?displayProperty=name>. This
manifests under the following conditions:

- <xref:System.Windows.Controls.TreeViewItem?displayProperty=name>'s visual parent is not a panel. (A <xref:System.Windows.Controls.TreeViewItem?displayProperty=name> generated for a <xref:System.Windows.Controls.TreeView?displayProperty=name> will have a panel as its parent)
- The <xref:System.Windows.Controls.TreeViewItem?displayProperty=name> is a descendant of a <xref:System.Windows.Controls.VirtualizingStackPanel?displayProperty=name> acting as the "items host" for a list control (ListBox, DataGrid, ListView, etc.). Virtualization doesn't need to be enabled.
- The <xref:System.Windows.Controls.VirtualizingStackPanel?displayProperty=name> is item-scrolling (`ScrollUnit="Item"`).
- Someone calls `VirtualizingStackPanel.MakeVisible(v)` to scroll an element `v` into view. This can be done explicitly, or implicitly in a number of ways; perhaps the most common way is simply clicking on `v` to give it the keyboard focus.
- The visual-parent chain from `v` to the <xref:System.Windows.Controls.VirtualizingStackPanel?displayProperty=name> passes through the <xref:System.Windows.Controls.TreeViewItem?displayProperty=name>.

In other words, this is seen when a
<xref:System.Windows.Controls.TreeViewItem?displayProperty=name> is used outside
of a <xref:System.Windows.Controls.TreeView?displayProperty=name>, and the user
clicks on a descendant of the
<xref:System.Windows.Controls.TreeViewItem?displayProperty=name> to bring it
into view. If the
<xref:System.Windows.Controls.TreeViewItem?displayProperty=name> has no
focusable descendants, you'll never see this issue. An example of a situation
where this is hit is when a
<xref:System.Windows.Controls.TreeViewItem?displayProperty=name> is the root of
a DataTemplate. When this issue is hit, there is an InvalidCastException that
occurs within the WPF framework.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
A hotfix will be made available for this.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!-- breaking change id: 141 -->
