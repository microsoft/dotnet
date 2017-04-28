## Workflow now throws original exception instead of NullReferenceException in some cases

### Scope
Minor

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description

In the .NET Framework 4.6.2 and earlier versions, when the Execute method of a
workflow activity throws an exception with a `null` value for the
<xref:System.Exception.Message> property, the
System.Activities Workflow runtime throws a
<xref:System.NullReferenceException?displayProperty=name>, masking the original
exception.

In the .NET Framework 4.7, the previously masked exception is thrown.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If your code relies on handling the
<xref:System.NullReferenceException?displayProperty=name>, change it to catch
the exceptions that could be thrown from your custom activities.

### Affected APIs
* `M:System.Activities.CodeActivity.Execute(System.Activities.CodeActivityContext)`
* `M:System.Activities.AsyncCodeActivity.BeginExecute(System.Activities.AsyncCodeActivityContext,System.AsyncCallback,System.Object)`
* `M:System.Activities.AsyncCodeActivity`1.BeginExecute(System.Activities.AsyncCodeActivityContext,System.AsyncCallback,System.Object)`
* `M:System.Activities.WorkflowInvoker.Invoke`

### Category
Windows Workflow Foundation (WF)

<!-- breaking change id: 170 -->
