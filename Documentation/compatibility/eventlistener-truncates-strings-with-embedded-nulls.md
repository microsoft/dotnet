## EventListener truncates strings with embedded nulls

### Scope
Edge

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description

<xref:System.Diagnostics.Tracing.EventListener?displayProperty=name> truncates
strings with embedded nulls. Null characters are not supported by the
<xref:System.Diagnostics.Tracing.EventSource?displayProperty=name> class. The
change only affects apps that use
<xref:System.Diagnostics.Tracing.EventListener?displayProperty=name> to read
<xref:System.Diagnostics.Tracing.EventSource?displayProperty=name> data in
process and that use null characters as delimiters.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

<xref:System.Diagnostics.Tracing.EventSource?displayProperty=name> data should
be updated, if possible, to not use embedded null characters.

### Affected APIs
* `M:System.Diagnostics.Tracing.EventListener.#ctor`
* `M:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel)`
* `M:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel,System.Diagnostics.Tracing.EventKeywords)`
* `M:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel,System.Diagnostics.Tracing.EventKeywords,System.Collections.Generic.IDictionary{System.String,System.String})`

### Category
Core

<!-- breaking change id: 46 -->
