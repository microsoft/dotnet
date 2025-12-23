## ASP.NET Incorrect multipart handling may result in lost form data.

### Version Introduced
4.8

### Change Description
In applications that target .NET Framework 4.7.2 and earlier versions, ASP.Net might incorrectly parse multipart boundary values, 
resulting in form data being unavailable during request execution. Applications that target .NET Framework 4.8 or later versions 
correctly parse multipart data, so form values are available during request execution.

### Recommended Action
Starting with applications running on .NET Framework 4.8, when targeting .NET Framework 4.8 or later by using the `targetFrameworkVersion` element, the default behavior changes to strip delimiters. When targeting previous framework versions or not using `targetFrameworkVersion`, trailing delimiters for
some values are still returned. 

This behavior can also be explicitly controlled with an `appSetting`:

```xml
    <configuration>
      <appSettings>
      ...
        <add key="aspnet:UseLegacyMultiValueHeaderHandling"  value="true"/>
      ...
      </appSettings>
    </configuration>
```

### Affected APIs

* `P:System.Web.HttpRequest.Form`
* `P:System.Web.HttpRequest.Files`
* `P:System.Web.HttpRequest.ContentEncoding`

### Category
ASP.NET

<!--
    ### 684397	<ASP.NET WebForms> Invalid results of the function GetAttributeFromHeader in System.Web.HttpRequest

-->


