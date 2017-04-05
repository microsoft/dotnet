## 173: WPF Printing Stack Update

### Scope
Edge

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description
WPF's Printing APIs using PrintQueue now call Window's Print Document Package API in favor of the now deprecated XPS Print API, neither users nor developers should see any changes in behaviour or API usage, the change was made with serviceability in mind.
The new printing stack is by default enabled when running in Windows 10 Creators Update.
The old printing stack will still continue to work just as before in older Windows versions.

- [x] Quirked 
- [ ] Build-time break 

### Recommended Action
If the user wants to use the old stack in Windows 10 Creators Update , the user should set registry key REG_DWORD `HKEY_CURRENT_USER\Software\Microsoft\.NETFramework\Windows Presentation Foundation\Printing\UseXpsOMPrinting = 1`

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

### Original Bug
https://devdiv.visualstudio.com/DevDiv/_workitems?id=113979


