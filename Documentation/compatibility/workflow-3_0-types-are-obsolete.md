## WorkFlow 3.0 types are obsolete

### Scope
Major

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Windows Workflow Foundation (WWF) 3.0 APIs (those from the System.Workflow namespace) are now obsolete.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
New WWF 4.0 APIs (in System.Activities) should be used instead. An example of using the new APIs can be found [here](~/docs/framework/windows-workflow-foundation/how-to-update-the-definition-of-a-running-workflow-instance.md) and further guidance is available [here](https://blogs.msdn.com/b/workflowteam/archive/2012/02/08/deprecatingwf3.aspx). Alternatively, since the WWF 3.0 APIs are still supported, they may be used and the build-time warning avoided either by suppressing it or by using an older compiler.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

<!-- breaking change id: 21 -->
