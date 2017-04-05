## 46: EventListener truncates strings with embedded nulls

### Scope
Edge

### Version Introduced
4.5.1

### Source Analyzer Status
Available

### Change Description
EventListener truncates strings with embedded nulls. Null characters are not supported by the EventSource class. The change only affects apps that use EventListener to read EventSource data in process and that use null characters as delimiters.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
EventSource data should be updated, if possible, to not use embedded null characters.

### Affected APIs
* `M:System.Diagnostics.Tracing.EventListener.#ctor`
* `M:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel)`
* `M:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel,System.Diagnostics.Tracing.EventKeywords)`
* `M:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel,System.Diagnostics.Tracing.EventKeywords,System.Collections.Generic.IDictionary{System.String,System.String})`

### Category
Core

[More information](https://msdn.microsoft.com/en-us/library/dn458360%28v=vs.110%29.aspx#Core)
