## WinForm's CheckForOverflowUnderflow property is now true for System.Drawing

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

Previously when overflows occurred, the result would be silently truncated. Now
an <xref:System.OverflowException?displayProperty=name> exception is thrown.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Forms

<!-- breaking change id: 53 -->
