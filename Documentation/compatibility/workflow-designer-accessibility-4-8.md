## Accessibility improvements in Windows Workflow Foundation (WF) workflow designer

### Scope
Minor

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
The Windows Workflow Foundation (WF) workflow designer is improving how it works with accessibility technologies. These improvements include the following changes:
- Users using Narrator will see improvements in FlowSwitch case labels.
- Users who choose High Contrast themes will see many improvements in the visibility of the Workflow Designer and its controls, like better contrast ratios between elements and more noticeable selection boxes used for focus elements.
- Users using Narrator will see improvements in button descriptions.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
If you have an application with a re-hosted workflow designer, your application can benefit from these changes by performing either of these actions:
- Recompile your application to target the .NET Framework 4.8 or later. These accessibility changes are enabled by default.
- If your application targets the .NET Framework 4.7.2 or earlier but is running on the .NET Framework 4.8 or later, you can opt out of these legacy accessibility behaviors by adding the following [AppContext switch](~/docs/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element.md) to the `<runtime>` section of the app.config file and set it to `false`, as the following example shows.
```xml
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <runtime>
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures.3=false" />
      </runtime>
    </configuration>
```
Applications that target the .NET Framework 4.8 and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to `true`.


### Affected APIs
  * Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

<!--
    ### Original Bug
    Bug link goes here

https://devdiv.visualstudio.com/DevDiv/_workitems/edit/604810
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/613975
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/682170

-->


