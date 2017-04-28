## FlowDocument may show an extra line of text

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

In some cases, a
<xref:System.Windows.Documents.FlowDocument>
element will display an extra line of text when running on the .NET Framework
4.5 compared to how it displayed when run on the .NET Framework 4.0. There are
no known cases of the change causing any text to be displayed poorly or
illegibly, but it could cause text to appear that previously was omitted from a
<xref:System.Windows.Documents.FlowDocument>'s
view.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

In some cases, decreasing the display element's PageHeight property by one can
restore the previous number of displayed lines.

### Affected APIs
* `M:System.Windows.Documents.FlowDocument.#ctor`
* `M:System.Windows.Documents.FlowDocument.#ctor(System.Windows.Documents.Block)`
* `M:System.Windows.Controls.FlowDocumentReader.#ctor`
* `M:System.Windows.Controls.FlowDocumentPageViewer.#ctor`
* `M:System.Windows.Controls.Primitives.DocumentPageView.#ctor`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Notes
    Analyzer would just look for FlowDocument/FlowDocunmentReader/FlowDocumentPageViewer/DocumentPageView usage in xaml
-->

<!-- breaking change id: 120 -->
