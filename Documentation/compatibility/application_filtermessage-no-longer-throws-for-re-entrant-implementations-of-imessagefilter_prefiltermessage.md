## Application.FilterMessage no longer throws for re-entrant implementations of IMessageFilter.PreFilterMessage

### Scope
Edge

### Version Introduced
4.6.1

### Source Analyzer Status
Planned

### Change Description

Prior to the .NET Framework 4.6.1, calling
<xref:System.Windows.Forms.Application.FilterMessage(System.Windows.Forms.Message@)>
with an
<xref:System.Windows.Forms.IMessageFilter.PreFilterMessage(System.Windows.Forms.Message@)>
which called
<xref:System.Windows.Forms.Application.AddMessageFilter(System.Windows.Forms.IMessageFilter)?displayProperty=name>
or <xref:System.Windows.Forms.Application.RemoveMessageFilter(System.Windows.Forms.IMessageFilter)?displayProperty=name>
(while also calling
<xref:System.Windows.Forms.Application.DoEvents>)
would cause an <xref:System.IndexOutOfRangeException?displayProperty=name>.<p/>

Beginning with applications targeting the .NET Framework 4.6.1, this exception is no longer thrown, and re-entrant filters as described above may be used.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

Be aware that
<xref:System.Windows.Forms.Application.FilterMessage(System.Windows.Forms.Message@)>
will no longer throw for the re-entrant
<xref:System.Windows.Forms.IMessageFilter.PreFilterMessage(System.Windows.Forms.Message@)>
behavior described above. This only affects applications targeting the .NET
Framework 4.6.1.

Apps targeting the .NET Framework 4.6.1 can opt out of this change (or apps
targeting older Frameworks may opt in) by using the
[DontSupportReentrantFilterMessage](~/docs/framework/migration-guide/mitigation-custom-imessagefilter-prefiltermessage-implementations.md#mitigation)
compatibility switch.

### Affected APIs
* `M:System.Windows.Forms.Application.FilterMessage(System.Windows.Forms.Message@)`

### Category
Windows Forms

<!--
    ### Notes
    It's unclear if this one will be better analyzed by Application.FilterMessage callers (who would have seen the exception previously)
    or the IMessageFilter.PreFilterMessage implementers (who caused the exception previously). Unfortunately, the analyzer on the caller is probably
    more useful, even though it would be easier to be 'precise' if we analyzed the interface implementer.
-->

<!-- breaking change id: 144 -->
