# WPF Non-Adorner Text Selection Occludes Text in FlowDocumentScrollViewer, FlowDocumentReader, and FlowDocumentPageViewer.

## Symptoms
When the WPF Non-Adorner text selection feature is enabled on .NET Framework 4.7.2, selected text in `System.Windows.Controls.FlowDocumentScrollViewer`, `System.Windows.Controls.FlowDocumentReader`,
and `System.Windows.Controls.FlowDocumentPageViewer` occludes the selected text.

## Cause
The root cause of this issue is an incorrect default selection opacity value being applied for `System.Windows.Controls.FlowDocumentScrollViewer`, `System.Windows.Controls.FlowDocumentReader`,
and `System.Windows.Controls.FlowDocumentPageViewer`.

## Resolution
This issue will be fixed in the next version of the .NET Framework.

To work around this problem, developers can explicitly set the selection opacity to the correct value of .4.  Once this is done, the selected text is again visible underneath the text selection.

```xml 
<FlowDocumentScrollViewer SelectionOpacity=".4" />
```