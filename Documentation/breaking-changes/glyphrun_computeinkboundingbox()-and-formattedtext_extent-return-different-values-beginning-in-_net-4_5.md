## 114: GlyphRun.ComputeInkBoundingBox() and FormattedText.Extent return different values beginning in .NET 4.5

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
Improvements were made to GlyphRun.ComputeInkBoundingBox() and FormattedText.Extent in the .NET Framework 4.5 to address issues where the boxes were too small for the contained glyphs in some cases in the .NET Framework 4.0. As a result of this, some bounding boxes will be larger beginning in the .NET Framework 4.5, resulting in subtle differences in UI layout.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Be aware that some glyph bounding box sizes have increased. These changes will usually improve presentation and hit box testing, but if the older (pre-.NET 4.5) behavior is desired, it can be opted into by adding the following entry to the app.config file: 

```xml
<appsettings>
	<add key="IncludeAllInkInBoundingBox" value="false">
</appsettings>
```

### Affected APIs
* `M:System.Windows.Media.GlyphRun.ComputeInkBoundingBox`
* `P:System.Windows.Media.FormattedText.Extent`

### Category
Windows Presentation Foundation (WPF)

[More information](http://support.microsoft.com/en-us/kb/3009678)

