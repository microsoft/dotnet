## Selector SelectionChanged event and SelectedValue property

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
Starting with the .NET Framework 4.7.1, a <xref:System.Windows.Controls.Primitives.Selector> always updates the value of its
<xref:System.Windows.Controls.Primitives.Selector.SelectedValue%2A> property before raising the
<xref:System.Windows.Controls.Primitives.Selector.SelectionChanged> event, when its selection changes.
This makes the SelectedValue property consistent with the other selection properties 
(<xref:System.Windows.Controls.Primitives.Selector.SelectedItem%2A> and 
<xref:System.Windows.Controls.Primitives.Selector.SelectedIndex%2A>), which are updated before raising the event.<p/>  

In the .NET Framework 4.7 and earlier versions, the update to SelectedValue happened before the event in most cases, but it happened
after the event if the selection change was caused by changing the 
<xref:System.Windows.Controls.Primitives.Selector.SelectedValue%2A> property.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
Apps that target the .NET Framework 4.7.1 or later can opt out of this change and use legacy behavior
by adding the following to the `<runtime>` section of the application configuration file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides 
         value="Switch.System.Windows.Controls.TabControl.SelectionPropertiesCanLagBehindSelectionChangedEvent=true" />
   </runtime>
   ```

Apps that target the .NET Framework 4.7 or earlier but are running on the .NET Framework 4.7.1 or later can enable the new behavior by adding the following line to the `<runtime>` section of the application .configuration file:

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


