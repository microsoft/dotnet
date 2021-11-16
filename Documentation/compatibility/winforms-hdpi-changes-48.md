## High DPI (HDPI) improvements in Windows Forms controls for .NET 4.8

### Scope
Major

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
The Windows Forms Framework is continuing to improve the scaling and rendering of its controls to better support Windows Forms customers on high resolution devices. As a result of these improvemeents, Windows Forms applications are able to better handle DPI changes that occur, for example, when moving the application from one monitor to another monitor that has different DPI settings. These include the following changes:
- Changes to improve the scaling of <xref:System.Windows.Forms.PropertyGrid> controls when the DPI of the application changes.
- Changes to improve the scaling of Toolstrip menus, buttons, and glyphs when the DPI of the application changes.
- Changes to improve the scaling of <xref:System.Windows.Forms.RadioButton> and <xref:System.Windows.Forms.CheckBox> controls when setting different styles on them, and the DPI of the application changes.
- Changes to improve the scaling of font-based controls when the DPI of the application changes.
- Changes to improve the scaling of the <xref:System.Windows.Forms.Button> control when the DPI of the application changes.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__
  
In order for the application to benefit from these changes, it must run on the .NET Framework 4.8. The application can opt in to these changes in either of the following ways:
- It is recompiled to target the .NET Framework 4.8. These high DPI improvement changes are enabled by default on Windows Forms applications that target the .NET Framework 4.8.
- It targets the .NET Framework 4.7.2 or earlier versions and opts in to this new behaviour by adding the following [Windows Forms Configuration Section](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/winforms/) to the app config file and then adding the required flag to opt-in specific feature improvements.

```xml
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <configuration>
        <System.Windows.Forms.ApplicationConfigurationSection>
        ...
        </System.Windows.Forms.ApplicationConfigurationSection>
      </configuration>
    </configuration>
```    
-  High DPI improvements in each major category has its own opt-in setting. Applications can set the required setting by following instructions found at [High DPI support in Windows Forms](~/docs/framework/winforms/high-dpi-support-in-windows-forms.md) and the [Windows Forms add configuration element](~/docs/framework/configure-apps/file-schema/winforms/windows-forms-add-configuration-element.md) .

Note that many of these improvements are enabled only on Windows 10, and your application must be enabled to run in Windows 10 compatible mode. You can set this in the application manifest file as defined in [High DPI support in Windows Forms](~/docs/framework/winforms/high-dpi-support-in-windows-forms.md).

__Opting out
Applications that target the .NET Framework 4.8 and want to preserve the legacy high dpi behavior can do so by explicitly setting the switches described below to `true`.

__Improved PropertyGrid scaling when DPI changes.__
- Improved scaling of the PropertyGrid control and its child controls when the DPI of the application is changed (for example, when the application moves from one monitor to another with different DPI settings). All changes made for this improvement are controlled by the `DisableDpiChangedHighDpiImprovements` switch.

__Improved scaling of Toolstrip Menus/Buttons/Glyphs when the DPI of the application changed__
All changes in this area are controlled by the `ToolStrip.DisableHighDpiImprovements` & `DisableDpiChangedHighDpiImprovements` switches.

__Improved scaling of RadioButton and CheckBox when application DPI changes__
- Improved the scaling of the RadioButton and CheckBox, when setting different styles on them and the DPI of the application changes. All changes made for this improvement are quirked under the `DisableDpiChangedHighDpiImprovements` switch.

__Improved scaling of Button control when application DPI changed__
All changes made in this area are controlled by the `DisableDpiChangedHighDpiImprovements` switch.

__Improved scaling of Font based controls when application DPI changes__
All changes made in this area are controlled by the `DisableDpiChangedHighDpiImprovements` switch.
 
### Affected APIs 
- Not detectable via API analysis.

### Category
Windows Forms

<!--
    ### Original Bug
616661
378542
519500
597091
645041
656271
664147
671791
-->

<!-- breaking change id:  -->

