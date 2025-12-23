## Calls to ClaimsIdentity constructors

### Scope
Edge

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with the .NET Framework 4.6.2, there is a change in how <xref:System.Security.Claims.ClaimsIdentity>
constructors with an <xref:System.Security.Principal.IIdentity?displayProperty=name>
parameter set the <xref:System.Security.Claims.ClaimsIdentity.Actor?displayProperty=name>
property. If the <xref:System.Security.Principal.IIdentity?displayProperty=name>
argument is a <xref:System.Security.Claims.ClaimsIdentity>
object, and the <xref:System.Security.Claims.ClaimsIdentity.Actor?displayProperty=name>
property of that <xref:System.Security.Claims.ClaimsIdentity>
object is not `null`, the <xref:System.Security.Claims.ClaimsIdentity.Actor?displayProperty=name>
property is attached by using the <xref:System.Security.Claims.ClaimsIdentity.Clone>
method. In the Framework 4.6.1 and earlier versions, the
<xref:System.Security.Claims.ClaimsIdentity.Actor?displayProperty=name>
property is attached as an existing reference.

Because of this change, starting with the .NET Framework 4.6.2, the
<xref:System.Security.Claims.ClaimsIdentity.Actor?displayProperty=name> property
of the new <xref:System.Security.Claims.ClaimsIdentity>
object is not equal to the <xref:System.Security.Claims.ClaimsIdentity.Actor?displayProperty=name>
property of the constructor's <xref:System.Security.Principal.IIdentity?displayProperty=name>
argument. In the .NET Framework 4.6.1 and earlier versions, it is equal.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
If this behavior is undesirable, you can restore the previous behavior by setting
the `Switch.System.Security.ClaimsIdentity.SetActorAsReferenceWhenCopyingClaimsIdentity`
switch in your application configuration file to `true`. This requires that you
add the following to the `<runtime>` section of your web.config file:

   ```xml
   <configuration>
      <runtime>
         <AppContextSwitchOverrides value="Switch.System.Security.ClaimsIdentity.SetActorAsReferenceWhenCopyingClaimsIdentity=true" />
      </runtime>
   </configuration>
   ```

### Affected APIs
- `M:System.Security.Claims.ClaimsIdentity.#ctor(System.Security.Principal.IIdentity)`
- `M:System.Security.Claims.ClaimsIdentity.#ctor(System.Security.Principal.IIdentity,System.Collections.Generic.IEnumerable{System.Security.Claims.Claim})`
- `M:System.Security.Claims.ClaimsIdentity.#ctor(System.Security.Principal.IIdentity,System.Collections.Generic.IEnumerable{System.Security.Claims.Claim},System.String,System.String,System.String)`

### Category
Core

<!--
    ### Original Bug
    227024
-->

<!-- breaking change id: 164 -->
