## WPF Aero2 and AeroLite themes toggle button doesn't show any state

### Scope
Major

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Not planned

### Change Description
In the .NET Framework 4.5, WPF's Aero2 and AeroLite themes do not show a difference between the 'on' and 'off' states of a toggle button.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue was fixed in a servicing update. Update the .NET Framework 4.5, or upgrade to .NET Framework 4.5.1 or later, to fix this issue. Alternatively, toggle buttons may be explicitly styled to work around this issue.

### Affected APIs
* T:System.Windows.Controls.Primitives.ToggleButton
* M:System.Windows.Controls.Primitives.ToggleButton.#ctor

### Category
Windows Presentation Foundation (WPF)

[More information](https://stackoverflow.com/questions/12450751/togglebutton-doesnt-show-any-state)

<!--
    ### Notes
    Analyzer can check xaml
-->

<!-- breaking change id: 90 -->
