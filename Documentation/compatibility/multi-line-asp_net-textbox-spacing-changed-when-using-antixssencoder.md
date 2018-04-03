## Multi-line ASP.Net TextBox spacing changed when using AntiXSSEncoder

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description

In .NET Framework 4.0, extra lines were inserted between lines of a multi-line
text box on postback, if using the
<xref:System.Web.Security.AntiXss.AntiXssEncoder?displayProperty=name>. In .NET
Framework 4.5, those extra line breaks are not included, but only if the web app
is targeting .NET Framework 4.5

- [x] Quirked
- [ ] Build-time break

### Recommended Action

Be aware that 4.0 web apps retargeted to .NET Framework 4.5 may have multi-line text boxes
improved to no longer insert extra line breaks. If this is not desirable, the
app  can have the old behavior when running on .NET Framework 4.5 by targeting
the .NET Framework 4.0.

### Affected APIs
* Not detectable via API analysis

### Category
ASP.NET

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/748052/textbox-with-multiline-textmode-adds-additional-linebreak-to-the-output)

<!--
    ### Notes
    Encoder is set in a config file. See bug repro for example.
-->

<!-- breaking change id: 92 -->
