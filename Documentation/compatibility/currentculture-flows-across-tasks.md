## CurrentCulture and CurrentUICulture flow across tasks

### Scope
Minor

### Version Introduced
4.6

### Version Reverted
4.6.2

### Source Analyzer Status
Planned

### Change Description

Beginning in the .NET Framework 4.6,
<xref:System.Globalization.CultureInfo.CurrentCulture?displayProperty=name> and
<xref:System.Globalization.CultureInfo.CurrentUICulture?displayProperty=name>
are stored in the thread's
<xref:System.Threading.ExecutionContext?displayProperty=name>, which flows
across asynchronous operations.

This means that changes to <xref:System.Globalization.CultureInfo.CurrentCulture?displayProperty=name>
or <xref:System.Globalization.CultureInfo.CurrentUICulture?displayProperty=name>
will be reflected in tasks which are later run asynchronously. This is different
from the behavior of previous .NET Framework versions (which would reset
<xref:System.Globalization.CultureInfo.CurrentCulture?displayProperty=name>
and <xref:System.Globalization.CultureInfo.CurrentUICulture?displayProperty=name>
in all asynchronous tasks).

- [x] Quirked
- [ ] Build-time break

### Recommended Action
Apps affected by this change may work around it by explicitly setting the desired <xref:System.Globalization.CultureInfo.CurrentCulture?displayProperty=name> or
<xref:System.Globalization.CultureInfo.CurrentUICulture?displayProperty=name>
as the first operation in an async Task. Alternatively, the old behavior (of not
flowing <xref:System.Globalization.CultureInfo.CurrentCulture?displayProperty=name>/<xref:System.Globalization.CultureInfo.CurrentUICulture?displayProperty=name>)
may be opted into by setting the following compatibility switch:

```csharp
AppContext.SetSwitch("Switch.System.Globalization.NoAsyncCurrentCulture", true);
```

This issue has been fixed by WPF in .NET Framework 4.6.2. It has also been fixed
in .NET Frameworks 4.6, 4.6.1 through [KB 3139549](https://support.microsoft.com/kb/3139549).
Applications targeting .NET Framework 4.6 or later will automatically get the right
behavior in WPF applications -
<xref:System.Globalization.CultureInfo.CurrentCulture?displayProperty=name>/<xref:System.Globalization.CultureInfo.CurrentUICulture?displayProperty=name>)
would be preserved across Dispatcher operations.

### Affected APIs
* `M:System.Globalization.CultureInfo.set_CurrentCulture(System.Globalization.CultureInfo)`
* `M:System.Threading.Thread.set_CurrentCulture(System.Globalization.CultureInfo)`
* `M:System.Globalization.CultureInfo.set_CurrentUICulture(System.Globalization.CultureInfo)`
* `M:System.Threading.Thread.set_CurrentUICulture(System.Globalization.CultureInfo)`

### Category
Core

[More information](https://docs.microsoft.com/dotnet/api/system.globalization.cultureinfo#Async)

<!-- breaking change id: 146 -->
