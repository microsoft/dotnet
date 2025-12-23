## Calls to System.Windows.Input.PenContext.Disable on touch-enabled systems may throw an ArgumentException

### Scope
Edge

### Version Introduced
4.6.1

### Version Reverted
4.7

### Source Analyzer Status
NotPlanned

### Change Description
Under some circumstances, calls to the internal **System.Windows.Intput.PenContext.Disable** method on touch-enabled systems may throw an unhandled `T:System.ArgumentException` because of reentrancy.

- [ ] Quirked
- [X] Build-time break

### Recommended Action
This issue has been addressed in the .NET Framework 4.7. To prevent the exception, upgrade to a version of the .NET Framework starting with the .NET Framework 4.7.

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems?id=252467&_a=edit
-->

<!-- breaking change id: 182 -->


