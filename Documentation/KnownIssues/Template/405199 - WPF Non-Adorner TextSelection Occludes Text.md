# WPF Non-Adorner Text Selection Occludes Text in FlowDocumentScrollViewer, FlowDocumentReader, and SinglePageViewer.

## Symptoms
When the WPF Non-Adorner text selection feature is enabled on .NET Framework 4.7.2 (see snippet below), text selections in `System.Windows.Controls.FlowDocumentScrollViewer`, `System.Windows.Controls.FlowDocumentReader`,
and `System.Windows.Controls.SinglePageViewer` will occlude the selected text.

## Cause
The root cause of this issue is an incorrect default selection opacity value being applied to `System.Windows.Controls.FlowDocumentScrollViewer`, `System.Windows.Controls.FlowDocumentReader`,
and `System.Windows.Controls.SinglePageViewer`.

## Resolution
This issue will be fixed in the next version of .NET.

To work around this problem, developers can explicitly set the selection opacity to the correct value of ".4".  Once this is done, the selected text will again be visible underneath the text selection.

```xml 
<FlowDocumentScrollViewer SelectionOpacity=".4" />
```