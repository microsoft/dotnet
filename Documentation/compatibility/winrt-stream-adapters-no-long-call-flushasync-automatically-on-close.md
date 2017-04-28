## WinRT stream adapters no long call FlushAsync automatically on close

### Scope
Transparent

### Version Introduced
4.5.1

### Source Analyzer Status
Not planned

### Change Description
In Windows Store apps, Windows Runtime stream adapters no longer call the FlushAsync method from the Dispose method.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This change should be transparent. Developers can restore the previous behavior by writing code like this:

```csharp
using (var stream = GetWindowsRuntimeStream() as Stream)
{
   // do something
   await stream.FlushAsync();
}
```

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 47 -->
