## 177: NullReferenceException in exception handling code from ImageSourceConverter.ConvertFrom

### Scope
Edge

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description
An error in the exception handling code for ImageSourceConverter.ConvertFrom caused an incorrect NullReferenceException to be thrown instead of the intended exception (e.g. DirectoryNotFoundException , FileNotFoundException), this change corrects that error so that the method now throws the right exception.
By default all applications targeting .NET Framework 4.6.2 and below will continue to throw NullReferenceException for compatibility, developers targeting .NET Framework 4.7 and above should see the right exceptions.

// Replace the space with an 'x' if applicable
- [x] Quirked 
- [ ] Build-time break 

### Recommended Action
Developers who wish to revert to getting NullReferenceException when targeting .NET Framework 4.7 can add/merge the following to their application's App.config file:

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.System.Windows.Media.ImageSourceConverter.OverrideExceptionWithNullReferenceException=true"/>
    </runtime>
</configuration>
```

### Affected APIs
- `M:System.Windows.Media.ImageSourceConverter.ConvertFrom(System.ComponentModel.ITypeDescriptorContext,System.Globalization.CultureInfo,System.Object)`

### Category
Windows Presentation Foundation (WPF)

<!--
### Original Bug
223209
-->
