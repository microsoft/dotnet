## Calling CreateDefaultAuthorizationContext with a null argument has changed

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description
The implementation of the <xref:System.IdentityModel.Policy.AuthorizationContext?displayProperty=name>
returned by a call to the
<xref:System.IdentityModel.Policy.AuthorizationContext.CreateDefaultAuthorizationContext(System.Collections.Generic.IList{System.IdentityModel.Policy.IAuthorizationPolicy})?displayProperty=name>
with a null authorizationPolicies argument has changed its implementation in the
.NET Framework 4.6.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
In rare cases, WCF apps that use custom authentication may see behavioral differences. In such cases, the previous behavior can be restored in either of two ways:

1. Recompile your app to target an earlier version of the .NET Framework than 4.6. For IIS-hosted services, use the &lt;httpRuntime targetFramework="x.x" /&gt; element to target an earlier version of the .NET Framework.
2. Add the following line to the `<appSettings>` section of your app.config file: `<add key="appContext.SetSwitch:Switch.System.IdentityModel.EnableCachedEmptyDefaultAuthorizationContext" value="true" />`

### Affected APIs
* `M:System.IdentityModel.Policy.AuthorizationContext.CreateDefaultAuthorizationContext(System.Collections.Generic.IList{System.IdentityModel.Policy.IAuthorizationPolicy})`

### Category
Windows Communication Foundation (WCF)

<!-- breaking change id: 138 -->
