## ASP.NET Fix handling of InputAttributes and LabelAttributes for WebForms CheckBox control

### Version Introduced
4.8

### Change Description
For applications that target .NET Framework 4.7.2 and earlier versions, <xref:System.Web.UI.WebControls.CheckBox.InputAttributes?displayProperty=nameWithType> and <xref:System.Web.UI.WebControls.CheckBox.LabelAttributes?displayProperty=nameWithType> that are programmatically added to a WebForms  <xref:System.Web.UI.WebControls.CheckBox> control are lost
after postback. For applications that target .NET Framework 4.8 or later versions, they are preserved after postback.

### Recommended Action
To use correct behavior for restoring attributes on postback, set `targetFrameworkVersion` to 4.8 or higher. Setting
it lower, or not at all, will preserve the old incorrect behavior.

```xml
    <configuration>
      <system.web>
        <httpRuntime targetFramework="4.8"/>
      </system.web>
    </configuration>
```

### Affected APIs
`System.Web.UI.WebControls.CheckBox`

### Category
ASP.NET

<!--
    ### 643614	<ASP.NET WebForms> Buggy handling of InputAttributes and LabelAttributes in ASP.NET WebForms CheckBox control

-->


