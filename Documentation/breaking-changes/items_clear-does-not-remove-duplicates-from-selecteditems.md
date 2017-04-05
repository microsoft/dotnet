## 154: Items.Clear does not remove duplicates from SelectedItems

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.6.2

### Source Analyzer Status
NotPlanned

### Change Description
Suppose a Selector (with multiple selection enabled) has duplicates in its SelectedItems
collection - the same item appears more than once.  Removing those items from the
data source (e.g. by calling Items.Clear) fails to remove them from SelectedItems;
only the first instance is removed.  Furthermore, subsequent use of SelectedItems
(e.g. SelectedItems.Clear()) can encounter problems such as ArgumentException, because
SelectedItems contains items that are no longer in the data source.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Upgrade if possible to .NET 4.6.2.

### Affected APIs
* `P:System.Windows.Controls.Primitives.MultiSelector.SelectedItems`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    154627
-->


