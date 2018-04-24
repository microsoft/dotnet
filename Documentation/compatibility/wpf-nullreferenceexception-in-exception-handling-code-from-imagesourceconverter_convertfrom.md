## NullReferenceException in exception handling code from ImageSourceConverter.ConvertFrom

### Scope
Edge

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description

An error in the exception handling code for
<xref:System.Windows.Media.ImageSourceConverter.ConvertFrom(System.ComponentModel.ITypeDescriptorContext,System.Globalization.CultureInfo,System.Object)>
caused an incorrect <xref:System.NullReferenceException?displayProperty=name> to
be thrown instead of the intended exception (
<xref:System.IO.DirectoryNotFoundException?displayProperty=name> or 
<xref:System.IO.FileNotFoundException?displayProperty=name>). This change
corrects that error so that the method now throws the right exception. <p/>

By default all applications targeting .NET Framework 4.6.2 and earlier continue to throw <xref:System.NullReferenceException?displayProperty=name> for
compatibility. Developers targeting .NET Framework 4.7 and above should see the
right exceptions.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

Developers who wish to revert to getting
<xref:System.NullReferenceException?displayProperty=name> when targeting .NET
Framework 4.7 or later can add/merge the following to their application's App.config
file:

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

<!-- breaking change id: 177 -->
