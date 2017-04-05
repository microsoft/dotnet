## 53: WinForm's CheckForOverflowUnderflow property is now true for System.Drawing

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Not planned

### Change Description
The CheckForOverflowUnderflow property for the System.Drawing.dll assembly is set to true.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Previously when overflows occurred, the result would be silently truncated. Now an OverflowException exception is thrown.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Forms

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx)
