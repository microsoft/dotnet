## New enum values in WPF's PageRangeSelection

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

Two new members (<xref:System.Windows.Controls.PageRangeSelection.CurrentPage?displayProperty=name>
and
<xref:System.Windows.Controls.PageRangeSelection.SelectedPages?displayProperty=name>)
have been added to the
<xref:System.Windows.Controls.PageRangeSelection?displayProperty=name> enum.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

In most cases, these changes won't impact user code. Code that depends on a
particular number of elements existing in
<xref:System.Enum.GetNames(System.Type)> or
<xref:System.Enum.GetValues(System.Type)> calls on
the <xref:System.Windows.Controls.PageRangeSelection?displayProperty=name> type
should be modified, though.

### Affected APIs
* `T:System.Windows.Controls.PageRangeSelection`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Notes
    Look for cast to PageRangeSelection, or <xref:System.Enum.GetNames(System.Type)> or <xref:System.Enum.GetValues(System.Type)> calls taking this type as input
-->

<!-- breaking change id: 37 -->
