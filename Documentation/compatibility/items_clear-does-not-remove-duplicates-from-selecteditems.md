## Items.Clear does not remove duplicates from SelectedItems

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.6.2

### Source Analyzer Status
NotPlanned

### Change Description

Suppose a Selector (with multiple selection enabled) has duplicates in its
<xref:System.Windows.Controls.Primitives.MultiSelector.SelectedItems?displayProperty=name>
collection - the same item appears more than once.  Removing those items from the
data source (e.g. by calling Items.Clear) fails to remove them from
<xref:System.Windows.Controls.Primitives.MultiSelector.SelectedItems?displayProperty=name>;
only the first instance is removed. Furthermore, subsequent use of
<xref:System.Windows.Controls.Primitives.MultiSelector.SelectedItems?displayProperty=name>
(e.g. SelectedItems.Clear()) can encounter problems such as
<xref:System.ArgumentException?displayProperty=name>, because
<xref:System.Windows.Controls.Primitives.MultiSelector.SelectedItems?displayProperty=name>
contains items that are no longer in the data source.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Upgrade if possible to .NET Framework 4.6.2.

### Affected APIs
* `P:System.Windows.Controls.Primitives.MultiSelector.SelectedItems`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    154627
-->

<!-- breaking change id: 154 -->
