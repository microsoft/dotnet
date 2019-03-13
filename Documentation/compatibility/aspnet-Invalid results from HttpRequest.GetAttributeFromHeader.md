## ASP.NET System.Web.HttpRequest.GetAttributeFromHeader can return invalid results

### Version Introduced
4.8

### Change Description
In applications that target .NET Framework 4.7.2 and earlier versions, ASP.Net might return a value that includes
a trailing delimiter when parsing an HTTP header value using `GetAttributeFromHeader`. In applications that target .NET Framework 4.8 or later versions, 
have all delimiters stripped from return values.

### Recommended Action
Starting with applications running on .NET Framework 4.8, when targeting .NET Framework 4.8 or later by using the `targetFrameworkVersion` element, the default behavior changes to strip
delimiters. When targeting previous framework versions, or not using `targetFrameworkVersion`, trailing delimiters for
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
`System.Web.HttpRequest.GetAttributeFromHeader`

### Category
ASP.NET

<!--
    ### 684397	<ASP.NET WebForms> Invalid results of the function GetAttributeFromHeader in System.Web.HttpRequest

-->


