## 21: WorkFlow 3.0 types are obsolete

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
New WWF 4.0 APIs (in System.Activities) should be used instead. An example of using the new APIs can be found [here](https://msdn.microsoft.com/en-us/library/jj205427.aspx) and further guidance is available [here](http://blogs.msdn.com/b/workflowteam/archive/2012/02/08/deprecatingwf3.aspx). Alternatively, since the WWF 3.0 APIs are still supported, they may be used and the build-time warning avoided either by suppressing it or by using an older compiler.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887#wwf)
