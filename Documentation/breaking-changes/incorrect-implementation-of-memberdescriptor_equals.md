## 150: Incorrect implementation of MemberDescriptor.Equals

### Scope
Edge

### Version Introduced
4.6.2

### Source Analyzer Status
Planned

### Change Description
Original implementation of "Equals" method was comparing two different string properties from 
the objects under comparison: category name to description string. The fix is to compare 
"category" of first object to "category" of the second one and "description" to "description".  
MemberDescriptorEqualsReturnsFalseIfEquivalent configuration value can be set to true to opt out of 
the new behavior if targeting 4.6.2 or to false to enable this fix when targeting framework 
version is below 4.6.2.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
If your application depends on MemberDescriptor.Equals sometimes returning false when descriptors 
are equivalent, and you are targeting 4.6.2 version of the .NET Framework, you have several options:

1. Make code changes to compare "category" and "description" fields manually in addition to 
running Equals method.
2. Opt out from this change by adding the following value to the app.config file:

```xml
<runtime>
  <AppContextSwitchOverrides value="Switch.System.MemberDescriptorEqualsReturnsFalseIfEquivalent=true" />
</runtime>
```

If your application targets 4.6.1 or lower version of the .NET Framework, and you want this change 
enabled, you can set the compatibility switch to false by adding the following value to the 
app.config file:

```xml
<runtime>
  <AppContextSwitchOverrides value="Switch.System.MemberDescriptorEqualsReturnsFalseIfEquivalent=false" />
</runtime>
```

### Affected APIs
* `M:System.ComponentModel.MemberDescriptor.Equals(System.Object)`

### Category
Windows Forms
