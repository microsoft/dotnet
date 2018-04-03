## WPF TextBox defaults to undo limit of 100

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
In .NET Framework 4.5, the default undo limit for a WPF textbox is 100 (as opposed to being unlimited in .NET Framework 4.0)

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If an undo limit of 100 is too low, the limit can be set explicitly with <xref:System.Windows.Controls.Primitives.TextBoxBase.UndoLimit>

### Affected APIs
* `T:System.Windows.Controls.TextBox`

### Category
Windows Presentation Foundation (WPF)

<!-- breaking change id: 51 -->
