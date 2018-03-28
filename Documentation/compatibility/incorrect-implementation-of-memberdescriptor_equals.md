## Incorrect implementation of MemberDescriptor.Equals

### Scope
Edge

### Version Introduced
4.6.2

### Source Analyzer Status
Planned

### Change Description
The original implementation of the <xref:System.ComponentModel.MemberDescriptor.Equals%2A?displayProperty=nameWithType> method compares two different string properties from 
the objects being compared: the category name and the description string. The fix is to compare 
the <xref:System.ComponentModel.MemberDescriptor.Category> of the first object to the <xref:System.ComponentModel.MemberDescriptor.Category> of the second one, and the <xref:System.ComponentModel.MemberDescriptor.Description> of the first to the <xref:System.ComponentModel.MemberDescriptor.Description> of the second.  

- [x] Quirked
- [ ] Build-time break

### Recommended Action
If your application depends on <xref:System.ComponentModel.MemberDescriptor.Equals%2A?displayProperty=nameWithType> sometimes returning `false` when descriptors 
are equivalent, and you are targeting the .NET Framework 4.6.2 or later, you have several options:

1. Make code changes to compare the <xref:System.ComponentModel.MemberDescriptor.Category> and <xref:System.ComponentModel.MemberDescriptor.Description> fields manually in addition to 
calling the <xref:System.ComponentModel.MemberDescriptor.Equals%2A?displayProperty=nameWithType> method.

2. Opt out of this change by adding the following value to the app.config file:

   ```xml
   <runtime>
      <AppContextSwitchOverrides value="Switch.System.MemberDescriptorEqualsReturnsFalseIfEquivalent=true" />
   </runtime>
   ```

If your application targets .NET Framework 4.6.1 or earlier and is running on the .NET Framework 4.6.2 or later and you want this change 
enabled, you can set the compatibility switch to `false` by adding the following value to the 
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

<!-- breaking change id: 150 -->
