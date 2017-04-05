## 77: Reflection objects can no longer be passed from managed code to out-of-process DCOM clients

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description
Reflection objects can no longer be passed from managed code to out-of-process DCOM clients. The following types are affected: 

- Assembly
- MemberInfo (and its derived types, including FieldInfo, MethodInfo, Type, and TypeInfo)
- MethodBody
- Module
- ParameterInfo. 

Calls to `IMarshal` for the object return `E_NOINTERFACE`.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Update marshaling code to work with non-reflection objects

### Affected APIs
* Investigate applicable APIs

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/dn833125(v=vs.110).aspx#Core)
