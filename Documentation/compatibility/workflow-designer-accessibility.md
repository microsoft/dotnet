## Accessibility improvements in WF workflow designer

### Scope
Minor

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
The Windows Workflow Foundation (WF) workflow designer is improving how it works with accessibility technologies. These improvements include the following changes:
- Tab order changed to left->right & top->bottom in some controls
  - Initialize correlation window for setting correlation data for the InitializeCorrelation activity
  - Content definition window for Receive, Send, SendReply, and ReceiveReply activities
- More functions available via keyboard
  - When editing the properties of an activity, fixed an issue where property groups could not be collapsed by keyboard the first time they are focused
  - Warning icons are now accessible by keyboard
  - More Properties button in properties window is no accessible by keyboard
  - Keyboard users now can access the header items in the arguments and variables panes of the workflow designer
- Improved visibility of focused items such as when
  - Adding rows to data grids used by the workflow designer and activity designers
  - Tabbing through fields in the ReceiveReply and SendReply activities
  - Setting default values for variables or arguments
- Users of screen readers will see several improvements where the screen reader can now correctly recognize
  - Breakpoints set in the workflow designer
  - FlowSwitch, FlowDecision, and CorrelationScope activities
  - Contents of the Receive activity
  - Target type for the InvokeMethod activity
  - Exception combobox and Finally section in the TryCatch activity
  - Message type combobox, splitter in Add Correlation Initializers window, Content Definition window, and CorrelatesOn Defintion window in messaging activities
  - State machine transitions and transitions destinations
  - Annotations and connectors on FlowDecision activities
  - Context (right-click) menus for activities
  - Property value editors, clear search button, By Category and Alphabetical sort buttons, and expression editing dialog in the properties grid
  - Zoom percentage in the workflow designer
  - Separator in parallel and pick activities
  - InvokeDelegate activity
  - Select Types window for Dictionary activities
  - Browse and Select .NET Type window
  - Breadcrumbs in workflow designer
- Users who choose High Contrast themes will see many improvements in the visibility of the workflow designer and its controls


- [x] Quirked
- [ ] Build-time break

### Recommended Action
If you have an application with a re-hosted workflow designer, your application can benefit from these changes by performing either of these actions:
- Recompile your application targeting .NET Framework 4.7.1. These accessibility changes are enabled by default.
- Opt out of the legacy accessibility behaviors by adding the following [AppContext switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the `<runtime>` section of the app.config file and set it to `false`, as the following example shows.
```
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <runtime>
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false" />
      </runtime>
    </configuration>
```
Applications that target the .NET Framework 4.7.1 or later and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to `true`.


### Affected APIs
  * Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

<!--
    ### Original Bug
    Bug link goes here

https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407444
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407450
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407414
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407436
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407442
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/434137
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407428
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407415
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407463
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407462
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407411
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407407
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407097
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407076
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407067
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407068
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407069
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407086
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407080
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407072
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407408
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407467
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408077
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/409723
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/409731
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408043
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408315
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/445109
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/409719
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408282
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408030
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408035
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408073
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/459631
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/409645
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/410280
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/409027
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407085
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407070
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407062
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/408158
https://devdiv.visualstudio.com/DevDiv/_workitems/edit/407075

-->


