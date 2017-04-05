## 51: WPF TextBox defaults to undo limit of 100

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
In .NET 4.5, the default undo limit for a WPF textbox is 100 (as opposed to being unlimited in .NET 4.0)

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
If an undo limit of 100 is too low, the limit can be set explicitly with the TextBox's UndoLimit property

### Affected APIs
* `T:System.Windows.Controls.TextBox`

### Category
Windows Presentation Foundation (WPF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx)
