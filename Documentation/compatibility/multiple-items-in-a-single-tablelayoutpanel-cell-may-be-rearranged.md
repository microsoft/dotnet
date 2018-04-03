## Multiple items in a single TableLayoutPanel cell may be rearranged

### Scope
Minor

### Version Introduced
4.5

### Version Reverted
4.5

### Source Analyzer Status
Available

### Change Description

In the .NET Framework 4.5, if multiple items are placed in the same
<xref:System.Windows.Forms.TableLayoutPanel?displayProperty=name> cell, they may
be displayed in a different order than they were in the .NET Framework 4.0.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This behavior was reverted in a servicing update for the .NET Framework 4.5.
Update the .NET Framework 4.5, or upgrade to .NET Framework 4.5.1 or
later, to fix this issue. Alternatively, avoid the ambiguous case of multiple
items in the same
<xref:System.Windows.Forms.TableLayoutPanel?displayProperty=name> cell.

### Affected APIs
* `M:System.Windows.Forms.TableLayoutControlCollection.Add(System.Windows.Forms.Control,System.Int32,System.Int32)`

### Category
Windows Forms

<!--
    ### Notes
    Although we're looking for <xref:System.Windows.Forms.TableLayoutPanel?displayProperty=name> APIs, what's really needed here is an analyzer that can look for XAML with multiple items in a single <xref:System.Windows.Forms.TableLayoutPanel?displayProperty=name> cell
    Source analyzer status: Pri 1
-->

<!-- breaking change id: 98 -->
