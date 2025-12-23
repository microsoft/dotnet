## WPF Printing Stack Update

### Scope
Edge

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description

WPF's Printing APIs using <xref:System.Printing.PrintQueue?displayProperty=name>
now call Window's Print Document Package API in favor of the now deprecated XPS
Print API. The change was made with serviceability in mind; neither users nor developers 
should see any changes in behavior or API usage. The new printing
stack is enabled by default when running in Windows 10 Creators Update. The old
printing stack will still continue to work just as before in older Windows
versions.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

To use the old stack in Windows 10 Creators Update, set the `UseXpsOMPrinting` REG_DWORD value of the `HKEY_CURRENT_USER\Software\Microsoft\.NETFramework\Windows Presentation Foundation\Printing` registry key to `1`.

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

### Original Bug
https://devdiv.visualstudio.com/DevDiv/_workitems?id=113979

<!-- breaking change id: 173 -->
