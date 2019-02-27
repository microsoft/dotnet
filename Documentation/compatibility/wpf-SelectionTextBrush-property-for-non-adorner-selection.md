## Add SelectionTextBrush public property to TextBox/PasswordBox non-adorner selection

### Scope
Major

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
In WPF applications using non-adorner based text selection for [TextBox](xref:System.Windows.Controls.TextBox) and [PasswordBox](xref:System.Windows.Controls.PasswordBox)  via [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) "Switch.System.Windows.Controls.Text.UseAdornerForTextboxSelectionRendering=false", developers may now set the SelectionTextBrush property in order to alter the rendering of the selected text.  By default, this color changes with [SystemColors.HighlightTextBrushKey](xref:System.Windows.SystemColors.HighlightTextBrushKey).  If non-adorner based text selection is not enabled, this property does nothing.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
Once non-adorner based text selection is enabled, an application developer can use the new SelectionTextBrush property to change the appearance of the selected text, this can be achieved via XAML:


```xml
        <TextBox SelectionBrush="Red" SelectionTextBrush="White"  SelectionOpacity="0.5"
                Foreground="Blue" CaretBrush="Blue">
            This is some text.
        </TextBox>
```


### Affected APIs
* `F:System.Windows.Controls.Primitives.TextBoxBase.SelectionTextBrushProperty`
* `P:System.Windows.Controls.Primitives.TextBoxBase.SelectionTextBrush`
* [System.Windows.Controls.TextBox](xref:System.Windows.Controls.TextBox) 
* [System.Windows.Controls.PasswordBox](xref:System.Windows.Controls.PasswordBox) 

### Category
WPF

<!--
    ### Original Bug
        433560
        488213
        503411
        614397
-->
