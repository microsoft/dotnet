## Icon.ToBitmap successfully converts icons with PNG frames into Bitmap objects

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
Investigating

### Change Description

Starting with the apps that target the .NET Framework 4.6, the <xref:System.Drawing.Icon.ToBitmap%2A?displayProperty=nameWithType> method successfully converts icons with PNG frames into Bitmap objects.<p/>

In apps that target the .NET Framework 4.5.2 and earlier versions, the  <xref:System.Drawing.Icon.ToBitmap%2A?displayProperty=nameWithType> method throws an <xref:System.ArgumentOutOfRangeException> exception if the Icon object has PNG frames.<p/>

This change affects apps that are recompiled to target the .NET Framework 4.6 and that implement special handling for the <xref:System.ArgumentOutOfRangeException> that is thrown when an Icon object has PNG frames. When running under the .NET Framework 4.6, the conversion is successful, an <xref:System.ArgumentOutOfRangeException> is no longer thrown, and therefore the exception handler is no longer invoked.

- [X] Quirked 
- [ ] Build-time break 

### Recommended Action
If this behavior is undesirable, you can retain the previous behavior by adding the following element to the `<runtime>` section of your app.config file:

```xml
<AppContextSwitchOverrides   
      value="Switch.System.Drawing.DontSupportPngFramesInIcons=true" />  
```
  
If the app.config file already contains the `AppContextSwitchOverrides` element, the new value should be merged with the value attribute like this:

```xml
<AppContextSwitchOverrides   
      value="Switch.System.Drawing.DontSupportPngFramesInIcons=true;<previous key>=<previous value>" />  
```
  
### Affected APIs
* `M:System.Drawing.Icon.ToBitmap`

### Category
Windows Forms

<!-- breaking change id: 194 -->


