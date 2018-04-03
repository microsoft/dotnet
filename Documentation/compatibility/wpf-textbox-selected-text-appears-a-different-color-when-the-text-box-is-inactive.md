## WPF TextBox selected text appears a different color when the text box is inactive

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

In .NET Framework 4.5, when a WPF text box control is inactive (it doesn't have focus),
the selected text inside the box will appear a different color than when the
control is active.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

The previous (.NET Framework 4.0) behavior may be restored by setting the
<xref:System.Windows.FrameworkCompatibilityPreferences.AreInactiveSelectionHighlightBrushKeysSupported>
property to `false`.

### Affected APIs
* `T:System.Windows.Controls.TextBox`

### Category
Windows Presentation Foundation (WPF)

<!-- breaking change id: 4 -->
