## [Keytips behavior improved in WPF]

### Scope
[Edge]

### Version Introduced
[4.7.2]

### Source Analyzer Status
[NotPlanned|]

### Change Description
[Keytips behavior has been modified to bring parity with behavior on Word, Explorer. By checking whether keytip state is enabled or not in the case of a SystemKey (Alt or F11 in particular here) being pressed, we handle keytip keys appropriately. Keytips now dismiss a menu even when opened by mouse]

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
[N/A]

### Affected APIs
[* Not detectable via API analysis]

### Category
[Windows Presentation Foundation (WPF)]

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems/edit/476533
-->
