## 145: CurrentCulture is not preserved across WPF Dispatcher operations

### Scope
Minor

### Version Introduced
4.6

### Version Reverted
4.6.2

### Source Analyzer Status
Planned

### Change Description
Beginning in the .NET Framework 4.6, changes to CurrentCulture or CurrentUICulture made within a [Dispatcher](https://msdn.microsoft.com/en-us/library/system.windows.threading.dispatcher%28v=vs.110%29.aspx) will be lost at the end of that dispatcher operation. Similarly, changes to CurrentCulture or CurrentUICulture made outside of a Dispatcher operation may not be reflected when that operation executes.

Practically speaking, this means that CurrentCulture and CurrentUICulture changes may not flow between WPF UI callbacks and other code in a WPF application.

This is due to a change in [ExecutionContext](https://msdn.microsoft.com/en-us/library/system.threading.executioncontext%28v=vs.110%29.aspx) that causes CurrentCulture and CurrentUICulture to be stored in the execution context beginning with apps targeting the .NET Framework 4.6. WPF dispatcher operations store the execution context used to begin the operation and restore the previous context when the operation is completed. Because CurrentCulture and CurrentUICulture are now part of that context, changes to them within a dispatcher operation are not persisted outside of the operation.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
Apps affected by this change may work around it by storing the desired CurrentCulture or CurrentUICulture in a field and checking in all Dispatcher operation bodies (including UI event callback handlers) that the correct CurrentCulture and CurrentUICulture are set. Alternatively, because the ExecutionContext change underlying this WPF change only affects apps targeting the .NET Framework 4.6 or newer, this break can be avoided by targeting the .NET Framework 4.5.2.

Apps that target .NET Framework 4.6 or later can also work around this by setting the following compatibility switch: 

    ```
    AppContext.SetSwitch("Switch.System.Globalization.NoAsyncCurrentCulture", true);
    ```

This issue has been fixed by WPF in .NET Framework 4.6.2. It has also been fixed in .NET Frameworks 4.6, 4.6.1 through [KB 3139549](https://support.microsoft.com/en-us/kb/3139549). 
Applications targeting .NET 4.6 or later will automatically get the right behavior in WPF applications - CurrentCulture/CurrentUICulture would be preserved across Dispatcher operations. 

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Notes
    This issue is not marked as detectable via API analysis because simply looking for CurrentCulture or CurrentUICulture being set is insufficient in most cases - it must be done in a WPF app.
    Also, looking for WPF Dispatcher invocations is insufficient because many dispatcher invocations are automatic and, besides that, there is no way to know if CurrentCulture or CurrentUICulture matters for those dispatchers.
-->
