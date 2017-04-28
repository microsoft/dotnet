## Intermittently unable to scroll to bottom item in ItemsControls (like ListBox and DataGrid) when using custom DataTemplates

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5.2

### Source Analyzer Status
Available

### Change Description

In some instances, a bug in the .NET Framework 4.5 is causing ItemsControls
(like <xref:System.Windows.Controls.ListBox?displayProperty=name>,
<xref:System.Windows.Controls.ComboBox?displayProperty=name>,
<xref:System.Windows.Controls.DataGrid?displayProperty=name>, etc.)
to not scroll to their bottom item when using custom DataTemplates. If the
scrolling is attempted a second time (after scrolling back up), it will work
then.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This issue has been fixed in the .NET Framework 4.5.2 and may be addressed by
upgrading to that version (or a later version) of the .NET Framework.
Alternatively, users can still drag scroll bars to the final items in these
collections, but may need to try twice to do so successfully.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Notes
    This is difficult to detect with ApiPort because we can't know which of all ItemsControl instances have custom data templates that would make them susceptible to this. We should learn more about the issue to understand whether or not an analyzer could do a better job.
-->

<!-- breaking change id: 113 -->
