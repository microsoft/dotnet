## XSLT forward compat now works

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
In the .NET Framework 4, XSLT 1.0 forward compatibility had the following issues:

- Loading a style sheet failed if its version was set to 2.0 and the parser encountered an unrecognized XSLT 1.0 construct.
- The `xsl:sort` construct failed to sort data if the style sheet version was set to 1.1.

In the .NET Framework 4.5, these issues have been fixed, and XSLT 1.0 forward compatibility mode works properly.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Most apps should be unaffected, however data will be sorted differently in some cases now that xsl:sort is respected. If `xsl:sort` is used in 1.1 style sheets, confirm that apps were not depending on the unsorted order of data. If apps rely on the 4.0 sorting behavior, remove `xsl:sort` from the style sheet.

### Affected APIs
* `T:System.Xml.Xsl.XslCompiledTransform`

### Category
XML, XSLT

<!-- breaking change id: 34 -->
