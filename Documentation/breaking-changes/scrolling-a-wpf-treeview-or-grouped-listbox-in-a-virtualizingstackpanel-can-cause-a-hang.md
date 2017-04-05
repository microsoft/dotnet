## 86: Scrolling a WPF TreeView or grouped ListBox in a VirtualizingStackPanel can cause a hang

### Scope
Major

### Version Introduced
4.5

### Version Reverted
4.5.1

### Source Analyzer Status
Planned

### Change Description
In the .NET Framework v4.5, scrolling a WPF TreeView in a virtualized stack panel can cause hangs if there are margins in the viewport (between the items in the TreeView, for example, or on an ItemsPresenter element). Additionally, in some cases, different sized items in the view can cause instability even if there are no margins.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This bug can be avoided by upgrading to .NET Framework 4.5.1. Alternatively, margins can be removed from view collections (like TreeViews) within virtualized stack panels if all contained items are the same size.

### Affected APIs
* `M:System.Windows.Controls.VirtualizingStackPanel.SetIsVirtualizing(System.Windows.DependencyObject,System.Boolean)`

### Category
Windows Presentation Foundation (WPF)

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/763639/wpf-application-built-on-net-4-0-freezes-under-system-with-net-4-5-while-scrolling-the-treeview-under-specific-conditions)
