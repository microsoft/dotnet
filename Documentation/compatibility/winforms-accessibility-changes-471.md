## 195: Accessibility improvements in Windows Forms controls

### Scope
Major

### Version Introduced
4.7.1

### Source Analyzer Status
NotPlanned

### Change Description
Windows Forms Framework is improving how it works with accessibility technologies to better support Windows Forms customers. Specifically, there are changes to improve display during High Contrast mode, to improve the property browser experience and to implement missing UI accessibility patterns in controls. Property Browser improvements will include better keyboard navigation though the various drop down selection windows, reduced unnecessary tab stops, better reporting of control types, and improved Narrator behavior. 

- [x] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__
  
In order for the application to benefit from these changes, it should run on the 4.7.1 version of the Framework and be either re-compiled against the 4.7.1 .Net Framework, or application should opt out from the legacy, or 4.7 and below, accessibility behaviors by setting the following [AppContext Switch](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) is a .Net compatibility mechanism.  to false. Add an app.confog file to your application and add the following switch to the '<runtime/>' section:

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

If an application targets version 4.7.1 or above and has preserve the legacy accessibility behavior, please opt in into the use of legacy accessibility features explicitly by setting this AppContext switch value to *true*. 

__Support for UI Automation__
- Added [UIA](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/ui-automation-overview) [Expand/Collapse pattern](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/implementing-the-ui-automation-expandcollapse-control-pattern) to `T:System.Windows.Forms.ToolStripSplitButton`
- Added UIA [ControlType](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/ui-automation-support-for-the-menubar-control-type) property value "MenuItem" to `T:System.Windows.Forms.ToolStripMenuItem`
- Added UIA [Name](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.automationelement.nameproperty?view=netframework-4.7) property and Expand/Collapse pattern to `T:System.Windows.Forms.ToolStripItem`
- Added [AccessibleEvents](https://docs.microsoft.com/fr-fr/dotnet/api/system.windows.forms.accessibleevents?view=netframework-4.7) indicating StateChange and NameChange when drop down is expanded or collapsed to `T:System.Windows.Forms.ToolStripDropDownItem`
- Added UIA ControlType property value "Button" to `T:System.Windows.Forms.ToolStripDropDownButton`
- Added UIA [TogglePattern](https://docs.microsoft.com/en-us/dotnet/api/system.windows.automation.togglepattern?view=netframework-4.7) to `T:System.Windows.Forms.DataGridViewCheckBoxCell`
 
__Improvements to PropertyBrowser control__
- Added UIA Expand/Collapse pattern, state and name change notifications and ControlType property with value "Button" to the "Details" button in the error dialog that is displayed when the user enters incorect value in the `T:System.Windows.Forms.PropertyGrid` control 
- Changed [AccessibleRole](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.accessiblerole?view=netframework-4.7) of rows in PropertyGrid control from "Row" to "Cell", which maps to UIA ControlType "DataItem", in order to support appropriate keyboard shortcuts and Narrator announcements
- Improved keyboard navigation between the grid and the ToolBar above it. Pressing "Shift-Tab" now selects the first ToolBar button, instead of the whole ToolBar

__Support for High Contrast themes__

__Improved keyboard navigation__

### Affected APIs
* `M:System.Windows.Forms.ToolStripDropDownButton.CreateAccessibilityInstance`
* `P:System.Windows.Forms.DomainUpDown.DomainUpDownAccessibleObject.Name`

### Category
Windows Forms

<!--
    ### Original Bug

https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=364507
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=366444
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=382195
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=382373
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=386118
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=386123
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=386173
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=386221
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=386386
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=386420
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=387172
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=392706
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=394788
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=396905
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=399055
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=399067
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=399988
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=404882
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=404885
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=407451
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=411616
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=411645
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=426764
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=430685
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=434763
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=436154
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=436313
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=437700
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=437912
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=449452
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=457326
https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=461557

-->

<!-- breaking change id: 195 -->

