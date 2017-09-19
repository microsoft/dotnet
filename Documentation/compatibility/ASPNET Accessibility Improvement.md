## ASP.NET Accessibility Improvement in .NET 4.7.1

### Scope
Minor


### Version Introduced
.NET 4.7.1


### Source Analyzer Status
NotPlanned


### Change Description
ASP.NET is improving how ASP.NET Web Controls work with accessibility technology in Visual Studio to better support ASP.NET customers.  These includ the following changes:
- Changes to implement missing UI accessbility patters in controls, like the Add Field dialog in Details View wizard.
- Changes to improve display in High Contrast mode, like the Data Pager Fields Editor.
- Improve the keyboard navigation experiences for controls, like Configure Object Context Window or Configure Data Source Window, etc.


### Recommended Action
+__How to opt in or out of these changes__

+In order for the Visual Studio IDE designer to benefit from these changes, it must run on the .NET Framework 4.7.1 or later. The web application can benefit from these changes in either of the following ways:
- Install Visual Studio 2017 15.3 or later, which ships with the following AppContext Switch by default.
- Opt out of the legacy accessibility behaviors by adding the __Switch.UseLegacyAccessibility__ AppContext Switch to the ```<runtime>``` section in the devenv.exe.config file and setting it to false, as the following example shows.
```
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <runtime>
      ...
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
      <AppContextSwitchOverrides value="...;Switch.UseLegacyAccessibilityFeatures=false" />
      ...
      </runtime>
    </configuration>
```
Applications that target the .NET Framework 4.7.1 or later and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to true.

### Affected APIs
 * Not detectable via API analysis

### Category
ASP.NET


