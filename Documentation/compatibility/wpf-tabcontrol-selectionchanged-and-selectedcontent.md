## TabControl SelectionChanged event and SelectedContent property

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
When its selection changes, a `T:System.Windows.Controls.TabControl` now updates the value of its
`P:System.Windows.Controls.TabControl.SelectedContent` property before raising the
`E:System.Windows.Controls.Primitives.Selector.SelectionChanged` event.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
Apps that target the .NET Framework 4.7.1 or later can opt out of this change and use legacy behavior
(updating SelectedContent after raising the SelectionChanged event)
by adding the following to the `<runtime>` section of the application configuration file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.Windows.Controls.TabControl.SelectionPropertiesCanLagBehindSelectionChangedEvent=true" />
   </runtime>
   ```

Apps that target the .NET Framework 4.7 or earlier but are running on the .NET Framework 4.7.1 or later can enable the changes to path normalization by adding the following line to the `<runtime>` section of the application .configuration file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.Windows.Controls.TabControl.SelectionPropertiesCanLagBehindSelectionChangedEvent=false" />
   </runtime>
   ```

### Affected APIs
* `P:System.Windows.Controls.TabControl.SelectedContent`
* `E:System.Windows.Controls.Primitives.Selector.SelectionChanged`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    208019
-->


