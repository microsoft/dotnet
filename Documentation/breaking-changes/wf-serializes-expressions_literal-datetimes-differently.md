## 36: WF serializes Expressions.Literal&lt;T&gt; DateTimes differently now (breaks custom XAML parsers)

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description
The associated [ValueSerializer](https://msdn.microsoft.com/en-us/library/system.windows.markup.valueserializer(v=vs.110).aspx) object will convert a DateTime or DateTimeOffset object whose Second and Millisecond components are non-zero and (for a DateTime value) whose DateTime.Kind property is not Unspecified to property element syntax instead of a string. This change allows DateTime and DateTimeOffset values to be round-tripped. Custom XAML parsers that assume that input XAML is in the attribute syntax will not function correctly.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
This change allows DateTime and DateTimeOffset values to be round-tripped. Custom XAML parsers that assume that input XAML is in the attribute syntax will not function correctly.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#wwf)

<!--
    ### Notes
    Will need to dig in a bit to figure out exactly what a repro for this looks like. Probably, identifying Literal<DateTime>/Literal<DateTimeOffset> usage will be sufficient to give an informational diagnostic.
-->
