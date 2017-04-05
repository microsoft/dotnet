## 131: PreviewLostKeyboardFocus is called repeatedly if its handler shows a Windows Forms message box

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Beginning in the .NET Framework 4.5, calling `System.Windows.Forms.MessageBox.Show` from a `UIElement.PreviewLostKeyboardFocus`
handler will cause the handler to re-fire when the message box is closed, potentially resulting in an infinite loop of 
message boxes.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
There are two options to work around this issue -

1. It may be avoided by calling `System.Windows.MessageBox.Show` instead of `System.Windows.Forms.MessageBox.Show`. 
2. It may be avoided by showing the message box from a `LostKeyboardFocus` event handler (as opposed to a `PreviewLostKeyboardFocus` event handler).

### Affected APIs
* `M:System.Windows.ContentElement.add_PreviewLostKeyboardFocus(System.Windows.Input.KeyboardFocusChangedEventHandler)`
* `M:System.Windows.IInputElement.add_PreviewLostKeyboardFocus(System.Windows.Input.KeyboardFocusChangedEventHandler)`
* `M:System.Windows.UIElement.add_PreviewLostKeyboardFocus(System.Windows.Input.KeyboardFocusChangedEventHandler)`
* `M:System.Windows.UIElement3D.add_PreviewLostKeyboardFocus(System.Windows.Input.KeyboardFocusChangedEventHandler)`

### Categories
Windows Forms
Windows Presentation Foundation (WPF)

[More information](http://stackoverflow.com/questions/17988219/system-windows-forms-messagebox-in-netversion-4-0-4-5-behaves-differently-in-wi)

<!--
    ### Notes
    Scan XAML for PreviewLostKeyboardFocus use and then examine the handlers
-->

