## Improvements to Grid star-rows space allocating algorithm

### Scope
Major

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
Fixed a bug in the [algorithm for allocating sizes to *-rows](https://github.com/Microsoft/dotnet/blob/master/Documentation/compatibility/wpf-grid-allocation-of-space-to-star-columns.md) in a <xref:System.Windows.Controls.Grid> introduced in .NET Framework 4.7.  In some cases, such as a Grid with `Height="Auto"` containing empty rows, rows were arranged at the wrong position, possibly outside the Grid altogether.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
In order for the application to benefit from these changes, it must run on the .NET Framework 4.8 or later.

### Category
WPF

<!--
    ### Original Bug
        590061
-->
