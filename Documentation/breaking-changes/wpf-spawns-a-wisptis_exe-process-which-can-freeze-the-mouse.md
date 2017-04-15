## WPF spawns a wisptis.exe process which can freeze the mouse

### Scope
Major

### Version Introduced
4.5.2

### Version Reverted
4.6

### Source Analyzer Status
Not planned

### Change Description
An issue was introduced in 4.5.2 that causes `wisptis.exe` to be spawned that can freeze mouse input.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
A fix for this issue is available in a servicing release of the .NET Framework 4.5.2 (hotfix rollup 3026376), or by upgrading to the .NET Framework 4.6

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/927119/net-framework-4-5-2-causes-applications-using-wpf-to-spawn-a-wisptis-exe-process-which-can-freeze-the-mouse)

<!-- breaking change id: 87 -->
