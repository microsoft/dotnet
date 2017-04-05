## 101: HtmlTextWriter does not render `<br/>` element correctly

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description
Beginning in the .NET Framework 4.6, calling `HtmlTextWriter.RenderBeginTag()` and `HtmlTextWriter.RenderEndTag()` with a `<BR />` element will correctly insert only one `<BR />` (instead of two)

- [x] Quirked
- [ ] Build-time break

### Recommended Action
If an app depended on the extra `<BR />` tag, `HtmlTextWriter.RenderBeginTag()` should be called a second time. Note that this behavior change only affects apps that are targeting the .NET Framework 4.6, so another option is to target a previous version of the .NET Framework in order to get the old behavior.

### Affected APIs
* `M:System.Web.UI.HtmlTextWriter.RenderBeginTag(System.String)`
* `M:System.Web.UI.HtmlTextWriter.RenderBeginTag(System.Web.UI.HtmlTextWriterTag)`

### Category
ASP.NET

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/813061/htmltextwriter-does-not-render-br-element-correctly)
