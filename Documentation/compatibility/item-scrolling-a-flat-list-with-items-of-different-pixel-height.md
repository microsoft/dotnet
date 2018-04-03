## Item-scrolling a flat list with items of different pixel-height

### Scope
Minor

### Version Introduced
4.6.1

### Version Reverted
4.6.2

### Source Analyzer Status
Planned

### Change Description

When an <xref:System.Windows.Controls.ItemsControl?displayProperty=name>
displays a collection using virtualization (`IsVirtualizing=true`) and item-
scrolling (`ScrollUnit=Item`), and when the control scrolls to display an item
whose height in pixels differs from its neighbors, the
<xref:System.Windows.Controls.VirtualizingStackPanel?displayProperty=name>
iterates over all items in the collection. The UI is unresponsive during this
iteration; if the collection is large, this can be perceived as a hang.

The iteration occurs in other circumstances, even in previous .NET Framework releases. For
example, it occurs when pixel-scrolling (`ScrollUnit=Pixel`) upon encountering
an item with different pixel height, and when item-scrolling hierarchical data
(such as a <xref:System.Windows.Controls.TreeView?displayProperty=name> or an
<xref:System.Windows.Controls.ItemsControl?displayProperty=name> with grouping
enabled) upon encountering an item with a different number of descendant items
than its neighbors.

For the case of item-scrolling and different pixel height, the iteration was
introduced in .NET Framework 4.6.1 to fix bugs in the layout of hierarchical data.  It is
not needed if the data is flat (no hierarchy), and .NET Framework 4.6.2 does not do it in
that case.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If the iteration occurs in .NET Framework 4.6.1 but not in earlier releases - that is, if
the <xref:System.Windows.Controls.ItemsControl?displayProperty=name> is item-
scrolling a flat list with items of different pixel height - there are two
remedies:

1. Install .NET Framework 4.6.2.
2. Install hotfix HR 1605 for .NET Framework 4.6.1.

### Affected APIs
* `T:System.Windows.Controls.VirtualizingStackPanel`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    202599
-->

<!-- breaking change id: 152 -->
