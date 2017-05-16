## Some WorkFlow drag-and-drop APIs are obsolete

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
This WorkFlow drag-and-drop API is obsolete and will cause compiler warnings if the app is rebuilt against 4.5.

- [ ] Quirked
- [x] Build-time break

### Recommended Action

New <xref:System.Activities.Presentation.DragDropHelper?displayProperty=name>
APIs that support operations with multiple objects should be used instead.
Alternatively, the build warnings can be suppressed or they can be avoided by
using an older compiler. The APIs are still supported.

### Affected APIs
* `M:System.Activities.Presentation.DragDropHelper.DoDragMove(System.Activities.Presentation.WorkflowViewElement,System.Windows.Point)`
* `M:System.Activities.Presentation.DragDropHelper.GetCompositeView(System.Windows.DragEventArgs)`
* `M:System.Activities.Presentation.DragDropHelper.GetDraggedModelItem(System.Windows.DragEventArgs)`
* `M:System.Activities.Presentation.DragDropHelper.GetDroppedObject(System.Windows.DependencyObject,System.Windows.DragEventArgs,System.Activities.Presentation.EditingContext)`

### Category
Windows Workflow Foundation (WF)

<!-- breaking change id: 22 -->
