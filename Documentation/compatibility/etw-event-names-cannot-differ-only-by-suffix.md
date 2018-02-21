## ETW event names cannot differ only by a "Start" or "Stop" suffix

### Scope
Edge

### Version Introduced
4.6


### Version Reverted
4.6.2

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.6 and 4.6.1, the runtime throws an <xref:System.ArgumentException> when two Event Tracing for Windows (ETW) event names differ only by a "Start" or "Stop" suffix (as when one event is named `LogUser` and another is named `LogUserStart`). In this case, the runtime cannot construct the event source, which cannot emit any logging.

- [X] Quirked 
- [ ] Build-time break 

### Recommended Action

To prevent the exception, ensure that no two event names differ only by a "Start" or "Stop" suffix.

This requirement is removed starting with the .NET Framework 4.6.2; the runtime can disambiguate event names that differ only by the "Start" and "Stop" suffix.

### Affected APIs
* Not detectable via API analysis

### Category
Core

<!-- breaking change id: 190 -->


