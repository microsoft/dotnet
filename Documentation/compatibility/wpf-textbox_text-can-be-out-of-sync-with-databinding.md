## WPF TextBox.Text can be out-of-sync with databinding

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

In some cases, the
<xref:System.Windows.Controls.TextBox.Text>
property reflects a previous value of the databound property value if the
property is modified during a databinding write operation.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

This should have no negative impact. However, you can restore the previous
behavior by setting the
<xref:System.Windows.FrameworkCompatibilityPreferences.KeepTextBoxDisplaySynchronizedWithTextProperty>
property to `false`.

### Affected APIs
* `P:System.Windows.Controls.TextBox.Text`

### Category
Windows Presentation Foundation (WPF)

<!-- breaking change id: 52 -->
