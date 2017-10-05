## Selector SelectionChanged event and SelectedValue property

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
When its selection changes, a `T:System.Windows.Controls.Primitives.Selector` now updates the value of its
`P:System.Windows.Controls.Primitives.Selector.SelectedValue` property before raising the
`E:System.Windows.Controls.Primitives.Selector.SelectionChanged` event.
This makes the SelectedValue property consistent with the other selection properties (SelectedItem and SelectedIndex), which are updated before raising the event.

Prior to this fix, the update to SelectedValue happened before the event in most cases, but happened
after the event if the selection change was caused by changing the 
`P:System.Windows.Controls.Primitives.Selector.SelectedValue` property.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
Apps that target the .NET Framework 4.7.1 or later can opt out of this change and use legacy behavior
(updating SelectedValue after raising the SelectionChanged event, in the case when the selection was changed by setting SelectedValue)
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
    96884
-->


