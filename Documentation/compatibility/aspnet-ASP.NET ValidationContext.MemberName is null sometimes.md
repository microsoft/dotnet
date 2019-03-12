## ASP.NET ValidationContext.MemberName is not NULL when using custom DataAnnotations.ValidationAttribute

### Version Introduced
4.8

### Change Description
When using custom `DataAnnotations.ValidationAttribute`, `System.ComponentModel.DataAnnotations.ValidationContext.MemberName` returns null.  This issue is fixed in .NET 4.8.


### Recommended Action
Starting from .NET 4.8, the default behavior stays the same.  Please use the following appsettings to retrieve valud of `ValidationContext.MemberName` property:

```xml
    <configuration>
      <appSettings>
      ...
        <add key="aspnet:GetValidationMemberName"  value="true"/>
      ...
      </appSettings>
    </configuration>
```

### Affected APIs
`System.ComponentModel.DataAnnotations.ValidationContext.MemberName`

### Category
ASP.NET

<!--
    ### 563497	<ASP.NET WebForms> ValidationContext.MemberName is NULL with custom DataAnnotations.ValidationAttribute

-->


