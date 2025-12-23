## "dataAnnotations:dataTypeAttribute:disableRegEx" app setting is on by default in .NET Framework 4.7.2

### Scope
Minor 

### Version Introduced
4.7.2

### Change Description
In .NET Framework 4.6.1, an app setting (`"dataAnnotations:dataTypeAttribute:disableRegEx"`) was introduced that allows users to disable the use of regular expressions in data type attributes (such as <xref:System.ComponentModel.DataAnnotations.EmailAddressAttribute?displayProperty=nameWithType>, <xref:System.ComponentModel.DataAnnotations.UrlAttribute?displayProperty=nameWithType>, and <xref:System.ComponentModel.DataAnnotations.PhoneAttribute?displayProperty=nameWithType>). This helps to reduce security vulnerability such as avoiding the possibility of a Denial of Service attack using specific regular expressions.<br/>
 
In .NET Framework 4.6.1, this app setting to disable RegEx usage was set to `false` by default. Staring with .NET Framework 4.7.2, this config switch is set to `true` by default to further reduce secure vulnerability for web applications that target .NET Framework 4.7.2 and above.


### Recommended Action
If you find that regular expressions in your web application do not work after upgrading to .NET Framework 4.7.2, you can update the value of the `"dataAnnotations:dataTypeAttribute:disableRegEx"` setting to `false` to revert to the previous behavior.

```xml
    <configuration>
      <appSettings>
      ...
        <add key="dataAnnotations:dataTypeAttribute:disableRegEx" value="false"/>
      ...
      </appSettings>
    </configuration>
```

### Category
Web Applications
