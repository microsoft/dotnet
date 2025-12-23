## IL ret not allowed in a try region

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
Planned

### Change Description
Unlike the JIT64 just-in-time compiler, RyuJIT (used in .NET Framework 4.6) does not allow an IL ret instruction in a try region. Returning from a try region is disallowed by the ECMA-335 specification, and no known managed compiler generates such IL. However, the JIT64 compiler will execute such IL if it is generated using reflection emit.

- [x] Quirked
- [ ] Build-time break

### Recommended Action
If an app is generating IL that includes a ret opcode in a try region, the app may target .NET Framework 4.5 to use the old JIT and avoid this break. Alternatively, the generated IL may be updated to return after the try region.

### Affected APIs
* Not detectable via API analysis

### Category
JIT

<!--
    ### Notes
    We could maybe detect this by looking for apps that emit ret opcodes, but we'd have to also know whether they were emitted into a try block.
-->

<!-- breaking change id: 80 -->
