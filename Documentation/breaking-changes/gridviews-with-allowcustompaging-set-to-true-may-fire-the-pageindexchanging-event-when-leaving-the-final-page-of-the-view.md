## 116: GridViews with AllowCustomPaging set to true may fire the PageIndexChanging event when leaving the final page of the view

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Planned

### Change Description
A bug in the .NET Framework 4.5 causes `PageIndexChanging` to sometimes not fire for GridViews that have enabled `AllowCustomPaging`

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This issue has been fixed in the .NET Framework 4.6 and may be addressed by upgrading to that version of the .NET Framework. As a work-around, the app can do an explicit BindGrid on any `Page_Load` that would hit these conditions (the GridView is on the last page and LastPageSize is different from PageSize). Alternatively, the app can be modified to allow paging (instead of custom paging), as that scenario does not demonstrate the problem.

### Affected APIs
* `P:System.Web.UI.WebControls.GridView.AllowCustomPaging`

### Category
ASP.NET

[More information](http://stackoverflow.com/questions/18793795/asp-net-4-5-gridview-postback-of-last-page)

<!--
    ### Notes
    An analyzer could usefully scan XAML (where custom paging is more likely to be enabled)
-->

