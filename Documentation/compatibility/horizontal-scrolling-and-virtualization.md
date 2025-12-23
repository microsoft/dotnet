## Horizontal scrolling and virtualization

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Planned

### Change Description

This change applies to an
<xref:System.Windows.Controls.ItemsControl?displayProperty=name> that does its
own virtualization in the direction orthogonal to the main scrolling direction
(the chief example is
<xref:System.Windows.Controls.DataGrid?displayProperty=name> with
EnableColumnVirtualization="True").  The outcome of certain horizontal scrolling
operations has been changed to produce results that are more intuitive and more
analogous to the results of comparable vertical operations.<p/>

The operations include "Scroll Here" and "Right Edge", to use the names from the
menu obtained by right-clicking a horizontal scrollbar.  Both of these compute a
candidate offset and call
<xref:System.Windows.Controls.Primitives.IScrollInfo.SetHorizontalOffset(System.Double)>.<p/>

After scrolling to the new offset, the notion of "here" or "right edge" may have
changed because newly de-virtualized content has changed the value of
<xref:System.Windows.Controls.Primitives.IScrollInfo.ExtentWidth?displayProperty=name>.<p/>

Prior to .NET Framework 4.6.2, the scroll operation simply uses the candidate offset, even
though it may not be "here" or at the "right edge" any more.  This results in
effects like "bouncing" the scroll thumb, best illustrated by example. Suppose a
<xref:System.Windows.Controls.DataGrid?displayProperty=name> has
ExtentWidth=1000 and Width=200.  A scroll to "Right Edge" uses candidate offset
1000 - 200 = 800.  While scrolling to that offset, new columns are de-
virtualized; let's suppose they are very wide, so that the
<xref:System.Windows.Controls.Primitives.IScrollInfo.ExtentWidth?displayProperty=name>
changes to 2000.  The scroll ends with HorizontalOffset=800, and the thumb
"bounces" back to near the middle of the scrollbar - precisely at 800/2000 =
40%.<p/>

The change is to recompute a new candidate offset when this situation occurs,
and try again. (This is how vertical scrolling works already.) <p/>

The change produces a more predictable and intuitive experience for the end
user, but it could also affect any app that depends on the exact value of
<xref:System.Windows.Controls.Primitives.IScrollInfo.HorizontalOffset?displayProperty=name>
after a horizontal scroll, whether invoked by the end user or by an explicit
call to
<xref:System.Windows.Controls.Primitives.IScrollInfo.SetHorizontalOffset(System.Double)>.

- [ ] Quirked 
- [ ] Build-time break

### Recommended Action

An app that uses a predicted value for
<xref:System.Windows.Controls.Primitives.IScrollInfo.HorizontalOffset?displayProperty=name>
should be changed to fetch the actual value (and the value of
<xref:System.Windows.Controls.Primitives.IScrollInfo.ExtentWidth?displayProperty=name>)
after any horizontal scroll that could change
<xref:System.Windows.Controls.Primitives.IScrollInfo.ExtentWidth?displayProperty=name>
due to de-virtualization.

### Affected APIs
* `T:System.Windows.Controls.Primitives.IScrollInfo`

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    123992
-->

<!-- breaking change id: 153 -->
