## Chained Popups with StaysOpen=False 

### Scope
Edge

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
A Popup with StaysOpen=False is supposed to close when you click outside the Popup.
When two or more such Popups are chained (i.e. one contains another), there were many problems, including:
  * Open two levels, click outside P2 but inside P1.  Nothing happens.
  * Open two levels, click outside P1.  Both popups close.
  * Open and close two levels.  Then try to open P2 again.  Nothing happens.
  * Try to open three levels.  You can't.  (Either nothing happens or the first two levels close, depending on where you click.)
These cases (and other variants) now work as expected.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

### Affected APIs
* `P:System.Windows.Controls.Primitives.Popup.StaysOpen`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    94132
-->
