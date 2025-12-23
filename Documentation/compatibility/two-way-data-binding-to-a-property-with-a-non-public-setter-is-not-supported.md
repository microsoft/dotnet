## Two-way data-binding to a property with a non-public setter is not supported

### Scope
Minor

### Version Introduced
4.5.1

### Source Analyzer Status
Planned

### Change Description

Attempting to data bind to a property without a public setter has never been a
supported scenario. Beginning in the .NET Framework 4.5.1, this scenario will
throw an <xref:System.InvalidOperationException?displayProperty=name>. Note that
this new exception will only be thrown for apps that specifically target the
.NET Framework 4.5.1. If an app targets the .NET Framework 4.5, the call will be
allowed. If the app does not target a particular .NET Framework version, the
binding will be treated as one-way.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

The app should be updated to either use one-way binding, or expose the
property's setter publicly. Alternatively, targeting the .NET Framework 4.5 will
cause the app to exhibit the old behavior.

### Affected APIs
* `F:System.Windows.Data.BindingMode.TwoWay`

### Category
Windows Presentation Foundation (WPF)

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/773682/wpf-property-with-private-setter-is-updated-by-a-twoway-binding)

<!--
    ### Notes
    This is a good candidate for a non-code source analyzer since most cases of two-way binding will be defined in XAML
-->

<!-- breaking change id: 129 -->
