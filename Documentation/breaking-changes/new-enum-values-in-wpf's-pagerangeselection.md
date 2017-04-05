## 37: New enum values in WPF's PageRangeSelection

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Two new members (CurrentPage and SelectedPage) have been added to the [PageRangeSelection](https://msdn.microsoft.com/en-us/library/system.windows.controls.pagerangeselection(v=vs.110).aspx) enum.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
In most cases, these changes won't impact user code. Code that depends on a particular number of elements existing in Enum.GetNames or Enum.GetValues calls on the PageRangeSelection type should be modified, though.

### Affected APIs
* `T:System.Windows.Controls.PageRangeSelection`

### Category
Windows Presentation Foundation (WPF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#wpf)

<!--
    ### Notes
    Look for cast to PageRangeSelection, or Enum.GetNames or Enum.GetValues calls taking this type as input
-->
