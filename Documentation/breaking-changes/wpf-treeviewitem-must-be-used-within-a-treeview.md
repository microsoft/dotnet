## 141: WPF TreeViewItem must be used within a TreeView

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
A change was introduced in 4.5 that restricts usage of TreeViewItem elements outside of a TreeView. This manifests under the following conditions:

- TreeViewItem's visual parent is not a panel. (A TreeViewItem generated for a TreeView will have a panel as its parent)
- The TreeViewItem is a descendant of a VirtualizingStackPanel acting as the "items host" for a list control (ListBox, DataGrid, ListView, etc.). Virtualization doesn't need to be enabled.
- The VirtualizingStackPanel is item-scrolling (`ScrollUnit="Item"`).
- Someone calls `VirtualizingStackPanel.MakeVisible(v)` to scroll an element `v` into view. This can be done explicitly, or implicitly in a number of ways; perhaps the most common way is simply clicking on `v` to give it the keyboard focus.
- The visual-parent chain from `v` to the VirtualizingStackPanel passes through the TreeViewItem.

In other words, this is seen when a TreeViewItem is used outside of a TreeView, and the user clicks on a descendant of the TreeViewItem to bring it into view. If the TreeViewItem has no 
focusable descendants, you'll never see this issue. An example of a situation where this is hit is when a TreeViewItem is the root of a DataTemplate.  When this issue is hit, there is an 
InvalidCastException that occurs within the WPF framework.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
A hotfix will be made available for this.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)