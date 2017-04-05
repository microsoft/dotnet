## 164: Calls to ClaimsIdentity constructors

### Scope
Edge

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description
Starting with the .NET Framework 4.6.2, there is a change in how  `T:System.Security.Claims.ClaimsIdentity` constructors with an `T:System.Security.Principal.IIdentity` parameter set the `P:System.Security.Claims.ClaimsIdentify.Actor` property. If the `T:System.Security.Principal.IIdentity` argument is a `T:System.Security.Claims.ClaimsIdentity` object, and the `P:System.Security.Claims.ClaimsIdentify.Actor` property of that `T:System.Security.Claims.ClaimsIdentity` object is not `null`, the `P:System.Security.Claims.ClaimsIdentify.Actor` property is attached by using the `M:System.Security.Claims.ClaimsIdentity.Clone` method. In the Framework 4.6.1 and earlier versions, the `P:System.Security.Claims.ClaimsIdentify.Actor` property is attached as an existing reference.

Because of this change, starting with the .NET Framework 4.6.2, the `P:System.Security.Claims.ClaimsIdentify.Actor` property of the new `T:System.Security.Claims.ClaimsIdentity`  object is not equal to the `P:System.Security.Claims.ClaimsIdentify.Actor` property of the constructor's `T:System.Security.Principal.IIdentity`  argument. In the .NET Framework 4.6.1 and earlier versions, it is equal.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
If this behavior is undesirable, you can restore the previous behavior by setting the `Switch.System.Security.ClaimsIdentity.SetActorAsReferenceWhenCopyingClaimsIdentity` switch in your application configuration file to `true`. This requires that you add the following to the `<runtime>` section of your web.config file:

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
