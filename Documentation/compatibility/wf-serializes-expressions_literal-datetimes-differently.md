## WF serializes Expressions.Literal&lt;T&gt; DateTimes differently now (breaks custom XAML parsers)

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

The associated
<xref:System.Windows.Markup.ValueSerializer> object
will convert a <xref:System.DateTime?displayProperty=name> or
<xref:System.DateTimeOffset?displayProperty=name> object whose Second and
<xref:System.DateTime.Millisecond?displayProperty=name> components are non-zero
and (for a <xref:System.DateTime?displayProperty=name> value) whose
<xref:System.DateTime.Kind> property is not
Unspecified to property element syntax instead of a string. This change allows
<xref:System.DateTime?displayProperty=name> and
<xref:System.DateTimeOffset?displayProperty=name> values to be round-tripped.
Custom XAML parsers that assume that input XAML is in the attribute syntax will
not function correctly.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This change allows <xref:System.DateTime?displayProperty=name> and
<xref:System.DateTimeOffset?displayProperty=name> values to be round-tripped.
Custom XAML parsers that assume that input XAML is in the attribute syntax will
not function correctly.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

<!--
    ### Notes
    Will need to dig in a bit to figure out exactly what a repro for this looks like. Probably, identifying Literal<DateTime>/Literal<DateTimeOffset> usage will be sufficient to give an informational diagnostic.
-->

<!-- breaking change id: 36 -->
