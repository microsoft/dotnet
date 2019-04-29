# WPF Binding stops working after an item container leaves the visual tree

## Symptoms
This issue affects bindings whose path contains an explicit use of the `DataContext`
property of an element that belongs to the subtree generated for an item within an
`System.Windows.Controls.ItemsControl`.  When the element leaves the visual tree,
the binding stops working; any subsequent changes to other properties mentioned in
the path are ignored.

The visible symptoms depend on how the binding is used. For example, an app
may want to share a `System.Windows.Controls.ContextMenu` among the
item containers within an `System.Windows.Controls.ItemsControl`, and have the
content and behavior of the menu depend on the item container for which it is
displayed. This can be implemented by declaring the menu as a resource and binding its
`DataContext` to that of its `PlacementTarget`:

```xml
<UserControl.Resources>
    <ContextMenu x:Key="SharedContextMenu" 
                 DataContext="{Binding RelativeSource={RelativeSource Self}, Path=PlacementTarget.DataContext}">
        ... other content ...
    </ContextMenu>
</UserControl.Resources>
```

Then refer to the resource in the appropriate data template:

```xml
<DataTemplate>
    <StackPanel ContextMenu="{StaticResource SharedContextMenu}">
        ... other content ....
    </StackPanel>
</DataTemplate>
```

When the user right-clicks the `StackPanel` for a particular data item, the shared context menu
is displayed, its `PlacementTarget` is changed to be the `StackPanel`, the binding sets its
`DataContext` to the data item, and the menu's content and behavior can depend on the data item.

The issue arises if the app removes the item container from the visual tree while the menu
is visible. (There are many ways this can happen:  removing the data item from the underlying
collection, replacing the `ItemsSource`, scrolling enough to re-virtualize the data item, etc.)
When this happens, the binding stops working, and any subsequent changes to the `PlacementTarget`
property are ignored. The visible symptom is that right-clicking a different data item
will bring up the menu and reset its `PlacementTarget`, but its content and behavior are
still attached to the original item rather than to the newly-chosen one.

## Cause
When an item container leaves the visual tree, its `DataContext` is changed to `{DisconnectedItem}`.
The binding recognizes this sentinel value and suppresses the normal data transfer, but
mistakenly leaves itself in a state where it ignores subsequent changes to other properties
along the path (such as `PlacementTarget` in the example).

## Resolution
A hotfix for this issue is planned for .Net Framework 4.8. This page will be updated with a link to the hotfix when it becomes available.
