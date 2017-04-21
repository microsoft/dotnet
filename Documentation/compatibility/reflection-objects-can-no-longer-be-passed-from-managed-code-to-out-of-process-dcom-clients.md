## Reflection objects can no longer be passed from managed code to out-of-process DCOM clients

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description

Reflection objects can no longer be passed from managed code to out-of-process
DCOM clients. The following types are affected:

- <xref:System.Reflection.Assembly?displayProperty=name>
- <xref:System.Reflection.MemberInfo?displayProperty=name> (and its derived types, including <xref:System.Reflection.FieldInfo?displayProperty=name>, <xref:System.Reflection.MethodInfo?displayProperty=name>, <xref:System.Type?displayProperty=name>, and <xref:System.Reflection.TypeInfo?displayProperty=name>)
- <xref:System.Reflection.MethodBody?displayProperty=name>
- <xref:System.Reflection.Module?displayProperty=name>
- <xref:System.Reflection.ParameterInfo?displayProperty=name>.

Calls to `IMarshal` for the object return `E_NOINTERFACE`.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Update marshaling code to work with non-reflection objects

### Affected APIs
* Investigate applicable APIs

### Category
Core

<!-- breaking change id: 77 -->
