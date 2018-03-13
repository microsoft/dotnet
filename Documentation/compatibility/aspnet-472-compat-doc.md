## Appsetting "dataAnnotations:dataTypeAttribute:disableRegEx" is On by Default in .NET 4.7.2

### Scope
Minor 

### Version Introduced
.NET 4.6.1

### Version Reverted
.NET 4.7.2

### Change Description
In 4.6.1, an appsetting (**"dataAnnotations:dataTypeAttribute:disableRegEx"**) was introduced which allows users to disable the use of Regular Expressions (RegExs) in data type attributes (such as EmailAddressAttribute, UrlAttribute, and PhoneAttribute) in System.ComponentModel.DataAnnotations.  This helps to reduce security vulnerability such as avoiding the possibility of Denial of Service attack using specific Regular Expressions.
 
In 4.6.1, this appsetting to disable RegEx usage was set to **false** by default. Now in 4.7.2, this config switch will be set to **true** by default to further reduce secure vulnerability for web applications targetting 4.7.2 and above.


### Recommended Action
If you find that your Regular Expressions in your web application does not work any more after upgrade to .NET 4.7.2, you could update value for **"dataAnnotations:dataTypeAttribute:disableRegEx"** to **false** to revert back the behavior.

```
    <configuration>
      <appsettings>
      ...
        <add key="dataAnnotations:dataTypeAttribute:disableRegEx" value="false"/>
      ...
      </appsettings>
    </configuration>
```

### Category
Web Application
