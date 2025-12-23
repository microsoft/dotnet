## ETW EventListeners do not capture events from providers with explicit keywords (like the TPL provider)

### Scope
Edge

### Version Introduced
4.5

### Version Reverted
4.6

### Source Analyzer Status
Available

### Change Description

ETW EventListeners with a blank keyword mask do not properly capture events from
providers with explicit keywords. In the .NET Framework 4.5, the TPL provider
began providing explicit keywords and triggered this issue. In the .NET
Framework 4.6, EventListeners have been updated to no longer have this issue.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

To work around this problem, replace calls to
<xref:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel)>
with calls to the EnableEvents overload that explicitly specifies the "any
keywords" mask to use: `EnableEvents(eventSource, level, unchecked((EventKeywords)0xFFFFffffFFFFffff))`.

Alternatively, this issue has been fixed in the .NET Framework 4.6 and may be
addressed by upgrading to that version of the .NET Framework.

### Affected APIs
* `M:System.Diagnostics.Tracing.EventListener.EnableEvents(System.Diagnostics.Tracing.EventSource,System.Diagnostics.Tracing.EventLevel)`

### Category
Core

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/816989/tpl-etw-events-for-task-not-captured-by-eventlistener-anymore)

<!-- breaking change id: 105 -->
