## TabControl SelectionChanged event and SelectedContent property

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
Starting with the .NET Framework 4.7.1, a <xref:System.Windows.Controls.TabControl> updates the value of its
<xref:System.Windows.Controls.TabControl.SelectedContent> property before raising the
<xref:System.Windows.Controls.Primitives.Selector.SelectionChanged> event, when its selection changes.

In the .NET Framework 4.7 and earlier versions, the update to SelectedContent happened after the event.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
Apps that target the .NET Framework 4.7.1 or later can opt out of this change and use legacy behavior
by adding the following to the `<runtime>` section of the application configuration file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.Windows.Controls.TabControl.SelectionPropertiesCanLagBehindSelectionChangedEvent=true" />
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
    208019
-->


