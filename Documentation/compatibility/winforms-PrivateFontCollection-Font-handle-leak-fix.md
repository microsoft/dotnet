## PrivateFontCollection.AddFontFile method releases Font resources

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.7.1 and previous versions, the <xref:System.Drawing.Text.PrivateFontCollection?displayProperty=nameWithType> class does not release the GDI+ font resources after the <xref:System.Drawing.Text.PrivateFontCollection> is disposed for <xref:System.Drawing.Font> objects that are added to this collection using the <xref:System.Drawing.Text.PrivateFontCollection.AddFontFile(System.String)> method.
In the .NET Framework 4.7.2 and later [PrivateFontCollection.Dispose](xref:System.Drawing.Text.FontCollection.Dispose%2A) releases the GDI+ fonts that were added to the collection as files.

- [X] Quirked 
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__

In order for an application to benefit from these changes, it must run on the .NET Framework 4.7.2 or later. The application can benefit from these changes in either of the following ways:

- It is recompiled to target the .NET Framework 4.7.2. This change is enabled by default on Windows Forms applications that target the .NET Framework 4.7.2 or later.
- It targets the .NET Framework 4.7.1 or an earlier version and opts out of the legacy accessibility behaviors by adding the following [AppContext Switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the `<runtime>` section of the app.config file and setting it to `false`, as the following example shows.


```xml
<runtime>
  <AppContextSwitchOverrides value="Switch.System.Drawing.Text.DoNotRemoveGdiFontsResourcesFromFontCollection=false"/>
</runtime>
``` 

Applications that target the .NET Framework 4.7.2 or later, and want to preserve the legacy behavior can opt in to not release font resources by explicitly setting this AppContext switch to `true`. 


### Affected APIs
* `M:System.Drawing.Text.PrivateFontCollection.AddFontFile(System.String)`
* `M:System.Drawing.Text.FontCollection.Dispose`

### Category
Windows Forms


<!--
    ### 126279 
-->


