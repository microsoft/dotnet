## Keytips behavior improved in WPF

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Keytips behavior has been modified to bring parity with behavior on Microsoft Word and Windows Explorer. By checking whether keytip state is enabled or not in the case of a [SystemKey](xref:System.Windows.Input.KeyEventArgs.SystemKey) (in particular, [Alt](xref:System.Windows.Input.Key) or [F11](xref:System.Windows.Input.Key.F11)) being pressed, WPF handles keytip keys appropriately. Keytips now dismiss a menu even when it is opened by mouse.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
N/A

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems/edit/476533
-->
