## WPF TextBox/PasswordBox Text Selection Does Not Follow System Colors

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
In .NET Framework 4.7.1 and earlier versions, WPF `System.Windows.Controls.TextBox` and `System.Windows.Controls.PasswordBox` could only render a text selection in the Adorner layer.
In some system themes this would occlude text, making it hard to read.  In .NET Framework 4.7.2 and later, developers have an option of enabling a non-Adorner-based selection rendering 
scheme that alleviates this issue.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
A developer who wants to utilize this change must set the following AppContext flag appropriately.  To utilize this feature, the installed .NET Framework version must be 4.7.2 or greater.

To enabled the non-adorner-based selection, use the following AppContext flag.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.System.Windows.Controls.Text.UseAdornerForTextboxSelectionRendering=false"/>
    </runtime>
</configuration>
```

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    405199
-->