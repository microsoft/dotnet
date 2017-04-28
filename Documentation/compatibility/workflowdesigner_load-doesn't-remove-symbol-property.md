## WorkflowDesigner.Load doesn't remove symbol property

### Scope
Major

### Version Introduced
4.5

### Version Reverted
4.5.2

### Source Analyzer Status
Planned

### Change Description

When targeting the .NET Framework 4.5 in the workflow designer, and loading a
re-hosted 3.5 workflow with the
<xref:System.Activities.Presentation.WorkflowDesigner.Load>
method, a <xref:System.Xaml.XamlDuplicateMemberException?displayProperty=name>
is thrown while saving the workflow.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

This bug only manifests when targeting .NET Framework 4.5 in the workflow designer, so it can be worked around by setting the `WorkflowDesigner.Context.Services.GetService<DesignerConfigurationService>().TargetFrameworkName` to the 4.0 .NET Framework.

Alternatively, the issue may be avoided by using the
<xref:System.Activities.Presentation.WorkflowDesigner.Load(System.String)>
method to load the workflow, instead of
<xref:System.Activities.Presentation.WorkflowDesigner.Load>.

### Affected APIs
* `M:System.Activities.Presentation.WorkflowDesigner.Load`

### Category
Windows Workflow Foundation (WF)

[More information](https://connect.microsoft.com/VisualStudio/feedback/details/786503/)

<!-- breaking change id: 82 -->
