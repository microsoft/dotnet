## ICommand.CanExecuteChanged event behaviour changed in .NET Framework 4.5

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Planned

### Change Description

In the .NET Framework 4.5, a
<xref:System.Windows.Input.ICommand.CanExecuteChanged?displayProperty=name> was
ignored unless the sender of the event was the same object as the object that
raised the event. This bug was fixed in .NET Framework 4.5 servicing updates.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This bug has been fixed in the .NET Framework 4.5 servicing releases, so it can
be avoided by making sure that the .NET Framework is up-to-date or by upgrading
to .NET Framework 4.5.1. Alternatively, application code using
<xref:System.Windows.Input.ICommand?displayProperty=name> can be modified to
make sure that the sender when raising a
<xref:System.Windows.Input.ICommand.CanExecuteChanged?displayProperty=name>
command is the same as the object raising the event.

### Affected APIs
* `E:System.Windows.Input.ICommand.CanExecuteChanged`

### Category
Windows Presentation Foundation (WPF)

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/751429/wpf-icommand-canexecutechanged-behaviour-change-in-net-4-5)

<!-- breaking change id: 84 -->
