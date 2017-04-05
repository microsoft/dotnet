## 161: Changing the IsEnabled property of the parent of a TextBlock control affects any child controls

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with the .NET Framework 4.6.2, changing the `IsEnabled` property of the parent of a `T:System.Windows.Controls.TextBlock` control affects any child controls (such as hyperlinks and buttons) of the `T:System.Windows.Controls.TextBlock` control.

In the .NET Framework 4.6.1 and earlier versions, controls inside a `T:System.Windows.Controls.TextBlock` did not always reflect the state of the IsEnabled property of the `T:System.Windows.Controls.TextBlock` parent.

- [ ] Quirked // Uses some mechanism to turn the feature on or off, usually using runtime targeting, AppContext or config files. Needs to be turned on automatically for some situations.
- [ ] Build-time break // Causes a break if attempted to recompile

### Recommended Action
None. This change conforms to the expected behavior for controls inside a `T:System.Windows.Controls.TextBlock` control.

### Affected APIs
- `P:System.Windows.UIElement.IsEnabled`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    213267
-->


