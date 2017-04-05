## 88: Unexpected InvalidCastException from InvokeMethod activity in WF4

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Planned

### Change Description
Using a System.Activities.Statements.InvokeMethod that targets a method with a nullable parameter can throw an InvalidCastException.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This behavior was reverted in a .NET Framework 4.5 servicing release. Please update the .NET Framework 4.5 (or upgrade to .NET Framework 4.5.1 or later) to fix the issue.

### Affected APIs
* `P:System.Activities.Statements.InvokeMethod.Parameters`

### Category
Windows Workflow Foundation (WF)

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/758736/unexpected-invalidcastexception-from-invokemethod-activity-in-wf4-after-net-4-5-install)

<!--
    ### Notes
    Activities can be defined in xaml (as well as programmatically), so it will be good to create a non-code analyzer to identify those. See the repro in the linked bug for an example.
-->


