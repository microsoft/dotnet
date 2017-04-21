## EventSource.WriteEvent impls must pass WriteEvent the same parameters that it received (plus ID)

### Scope
Minor

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description

The runtime now enforces the contract that specifies the following: A class
derived from <xref:System.Diagnostics.Tracing.EventSource?displayProperty=name>
that defines an ETW event method must call the base class `EventSource.WriteEvent`
method with the event ID followed by the same arguments that the ETW event
method was passed.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

An <xref:System.IndexOutOfRangeException?displayProperty=name> exception is
thrown if an <xref:System.Diagnostics.Tracing.EventListener?displayProperty=name>
reads <xref:System.Diagnostics.Tracing.EventSource?displayProperty=name> data in
process for an event source that violates this contract.

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 31 -->
