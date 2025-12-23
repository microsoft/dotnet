## ASP.NET ValidationContext.MemberName is not NULL when using custom DataAnnotations.ValidationAttribute

### Version Introduced
4.8

### Change Description
In .NET Framework 4.7.2 and earlier versions, when using a custom <xref:System.ComponentModel.DataAnnotations.ValidationAttribute?displayProperty=nameWithType>, the <xref:System.ComponentModel.DataAnnotations.ValidationContext.MemberName?displayProperty=nameWithType> property returns `null`.  In .NET Framework 4.8, it returns the member name.


### Recommended Action
The default behavior of the <xref:System.ComponentModel.DataAnnotations.ValidationContext.MemberName?displayProperty=nameWithType> property remains the same.  To retrieve a valid value from the `ValidationContext.MemberName` property, add the following setting to your app config file:

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

* `P:System.ComponentModel.DataAnnotations.ValidationContext.MemberName`

### Category
ASP.NET

<!--
    ### 563497	<ASP.NET WebForms> ValidationContext.MemberName is NULL with custom DataAnnotations.ValidationAttribute

-->


