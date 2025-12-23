## Page.LoadComplete event no longer causes System.Web.UI.WebControls.EntityDataSource control to invoke data binding

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

The <xref:System.Web.UI.Page.LoadComplete> event no
longer causes the
<xref:System.Web.UI.WebControls.EntityDataSource?displayProperty=name> control
to invoke data binding for changes to create/update/delete parameters. This
change eliminates an extraneous trip to the database, prevents the values of
controls from being reset, and produces behavior that is consistent with other
data controls, such as
<xref:System.Web.UI.WebControls.SqlDataSource?displayProperty=name> and
<xref:System.Web.UI.WebControls.ObjectDataSource?displayProperty=name>. This
change produces different behavior in the unlikely event that applications rely
on invoking data binding in the
<xref:System.Web.UI.Page.LoadComplete> event.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If there is a need for databinding, manually invoke databind in an event that is
earlier in the post-back.

### Affected APIs
* Investigate applicable APIs

### Category
ASP.NET

<!--
    ### Notes
    This change produces different behavior in the unlikely event that applications rely on invoking data binding in the Page.LoadComplete event.
-->

<!-- breaking change id: 60 -->
