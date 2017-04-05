## 144: Application.FilterMessage no longer throws for re-entrant implementations of IMessageFilter.PreFilterMessage

### Scope
Edge

### Version Introduced
4.6.1

### Source Analyzer Status
Planned

### Change Description
Prior to the .NET Framework 4.6.1, calling Application.FilterMessage with an IMessageFilter.PreFilterMessage which called AddMessageFilter or RemoveMessageFilter (while also calling Application.DoEvents) would cause an IndexOutOfRangeException.

Beginning with applications targeting the .NET Framework 4.6.1, this exception is no longer thrown, and re-entrant filters as described above may be used.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
Be aware that Application.FilterMessage will no longer throw for the re-entrant IMessageFilter.PreFilterMessage behavior described above. This only affects applications targeting the .NET Framework 4.6.1.

Apps targeting the .NET Framework 4.6.1 can opt out of this change (or apps targeting older Frameworks may opt in) by using the [DontSupportReentrantFilterMessage](https://msdn.microsoft.com/en-us/library/mt620032%28v=vs.110%29.aspx) compatibility switch.

### Affected APIs
* `M:System.Windows.Forms.Application.FilterMessage(System.Windows.Forms.Message@)`

### Category
Windows Forms

[More information](https://msdn.microsoft.com/en-us/library/mt620031%28v=vs.110%29.aspx#WinForms)

<!--
    ### Notes
    It's unclear if this one will be better analyzed by Application.FilterMessage callers (who would have seen the exception previously) 
    or the IMessageFilter.PreFilterMessage implementers (who caused the exception previously). Unfortunately, the analyzer on the caller is probably
    more useful, even though it would be easier to be 'precise' if we analyzed the interface implementer.
-->


