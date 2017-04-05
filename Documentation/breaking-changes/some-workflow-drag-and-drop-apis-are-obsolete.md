## 22: Some WorkFlow drag and drop APIs are obsolete

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
This WorkFlow Drag/Drop API is obsolete and will cause compiler warnings if the app is rebuilt against 4.5.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
New [DragDropHelper](https://msdn.microsoft.com/en-us/library/system.activities.presentation.dragdrophelper(v=vs.110).aspx) APIs that support operations with multiple objects should be used instead. Alternatively, the build warnings can be suppressed or they can be avoided by using an older compiler. The APIs are still supported.

### Affected APIs
* `M:System.Activities.Presentation.DragDropHelper.DoDragMove(System.Activities.Presentation.WorkflowViewElement,System.Windows.Point)`
* `M:System.Activities.Presentation.DragDropHelper.GetCompositeView(System.Windows.DragEventArgs)`
* `M:System.Activities.Presentation.DragDropHelper.GetDraggedModelItem(System.Windows.DragEventArgs)`
* `M:System.Activities.Presentation.DragDropHelper.GetDroppedObject(System.Windows.DependencyObject,System.Windows.DragEventArgs,System.Activities.Presentation.EditingContext)`

### Category
Windows Workflow Foundation (WF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887#wwf)
