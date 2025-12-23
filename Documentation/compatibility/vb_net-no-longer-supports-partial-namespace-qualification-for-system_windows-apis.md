## VB.NET no longer supports partial namespace qualification for System.Windows APIs

### Scope
Minor

### Version Introduced
4.5.2

### Source Analyzer Status
Available

### Change Description
Beginning in .NET Framework 4.5.2, VB.NET projects cannot specify System.Windows APIs with partially-qualified namespaces. For example, referring to `Windows.Forms.DialogResult` will fail. Instead, code must refer to the fully qualified name (<xref:System.Windows.Forms.DialogResult>) or import the specific namespace and refer simply to <xref:System.Windows.Forms.DialogResult?displayProperty=name>.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
Code should be updated to refer to `System.Windows` APIs either with simple names (and importing the relevant namespace) or with fully qualified names.

### Affected APIs
* Not detectable via API analysis

### Category
Visual Basic .NET

[More information](https://stackoverflow.com/questions/23573659/forms-is-not-a-member-of-windows)

<!-- breaking change id: 127 -->
