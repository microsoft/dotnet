## Compiler support for type forwarding when multi-targeting mscorlib

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Not planned

### Change Description
A new CodeDOM feature allows a compiler to compile against the targeted version
of mscorlib.dll instead of the .NET Framework 4.5 version of mscorlib.dll.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action This change prevents compiler warnings (and compilation
failure in cases where warnings are treated as errors) when CodeDOM finds two
definitions for types that have been type-forwarded. This change may have
unintended side effects only if different versions of reference assemblies are
mixed in a single location.

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 56 -->
