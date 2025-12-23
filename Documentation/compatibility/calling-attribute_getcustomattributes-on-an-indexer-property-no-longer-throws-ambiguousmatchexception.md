## Calling Attribute.GetCustomAttributes on an indexer property no longer throws AmbiguousMatchException if the ambiguity can be resolved by index's type

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description
Prior to the .NET Framework 4.6, calling `GetCustomAttribute(s)` on an indexer
property which differed from another property only by the type of the index
would result in an
<xref:System.Reflection.AmbiguousMatchException?displayProperty=name>. Beginning
in the .NET Framework 4.6, the property's attributes will be correctly returned.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Be aware that GetCustomAttribute(s) will work more frequently now. If an app was previously relying on the <xref:System.Reflection.AmbiguousMatchException?displayProperty=name>, reflection should now be used to explicitly look for multiple indexers, instead.

### Affected APIs
* `M:System.Attribute.GetCustomAttribute(System.Reflection.MemberInfo,System.Type)`
* `M:System.Attribute.GetCustomAttribute(System.Reflection.MemberInfo,System.Type,System.Boolean)`
* `M:System.Attribute.GetCustomAttributes(System.Reflection.MemberInfo)`
* `M:System.Attribute.GetCustomAttributes(System.Reflection.MemberInfo,System.Boolean)`
* `M:System.Attribute.GetCustomAttributes(System.Reflection.MemberInfo,System.Type)`
* `M:System.Attribute.GetCustomAttributes(System.Reflection.MemberInfo,System.Type,System.Boolean)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttribute(System.Reflection.MemberInfo,System.Type)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttribute(System.Reflection.MemberInfo,System.Type,System.Boolean)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttribute``1(System.Reflection.MemberInfo)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttribute``1(System.Reflection.MemberInfo,System.Boolean)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttributes(System.Reflection.MemberInfo)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttributes(System.Reflection.MemberInfo,System.Boolean)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttributes(System.Reflection.MemberInfo,System.Type)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttributes(System.Reflection.MemberInfo,System.Type,System.Boolean)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttributes``1(System.Reflection.MemberInfo)`
* `M:System.Reflection.CustomAttributeExtensions.GetCustomAttributes``1(System.Reflection.MemberInfo,System.Boolean)`

### Category
Core

<!-- breaking change id: 112 -->
