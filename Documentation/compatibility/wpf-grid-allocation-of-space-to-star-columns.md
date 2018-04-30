## WPF Grid allocation of space to star-columns

### Scope
Minor

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description

Starting with the .NET Framework 4.7, WPF replaces the algorithm that
<xref:System.Windows.Controls.Grid> uses to allocate
space to *-columns. This will change the actual width assigned to *-columns in
a number of cases:

- When one or more *-columns also have a minimum or maximum width that overrides the proportional allocation for that colum. (The minimum width can derive from an explicit MinWidth declaration, or from an implicit minimum obtained from the column's content. The maximum width can only be defined explicitly, from a MaxWidth declaration.)

- When one or more *-columns declare an extremely large *-weight, greater than 10^298.

- When the *-weights are sufficiently different to encounter floating-point instability (overflow, underflow, loss of precision).

- When layout rounding is enabled, and the effective display DPI is sufficiently high.

In the first two cases, the widths produced by the new algorithm can be significantly different from those produced by the old algorithm; in the last case, the difference will be at most one or two pixels.<p/>

The new algorithm fixes several bugs present in the old algorithm:

1. Total allocation to columns can exceed the Grid's width. This can occur when allocating space to a column whose proportional share is less than its minimum size. The algorithm allocates the minimum size, which decreases the space available to other columns. If there are no *-columns left to allocate, the total allocation will be too large.

2. Total allocation can fall short of the Grid's width. This is the dual problem to #1, arising when allocating to a column whose proportional share is greater than its maximum size, with no *-columns left to take up the slack.

3. Two *-columns can receive allocations not proportional to their *-weights. This is a milder version of #1/#2, arising when allocating to *-columns A, B, and C (in that order), where B's proportional share violates its min (or max) constraint. As above, this changes the space available to column C, who gets less (or more) proportional allocation than A did,

4. Columns with extremely large weights (> 10^298) are all treated as if they had weight 10^298. Proportional differences between them (and between columns with slightly smaller weights) are not honored.

5. Columns with inifinte weights are not handled correctly. [Actually you can't set a weight to Infinity, but this is an artificial restriction. The allocation code was trying to handle it, but doing a bad job.]

6. Several minor problems while avoiding overflow, underflow, loss of precision and similar floating-point issues.

7. Adjustments for layout rounding are incorrect at sufficiently high DPI.

The new algorithm produces results that meet the following criteria:<p/>

A. The actual width assigned to a *-column is never less than its minimum width nor greater than its maximum width.<br/>

B. Each *-column that is not assigned its minimum or maximum width is assigned a width proportional to its *-weight. To be precise, if two columns are declared with width x* and y* respectively, and if neither column receives its minimum or maximum width, the actual widths v and w assigned to the columns are in the same proportion: v / w == x / y.<br/>

C. The total width allocated to "proportional" *-columns is equal to the space available after allocating to the constrained columns (fixed, auto, and *-columns that are allocated their min or max width). This might be zero, for instance if the sum of the minimum widths exceeds the Grid's availbable width.<br/>

D. All these statements are to be interpreted with respect to the "ideal" layout. When layout rounding is in effect, the actual widths can differ from the ideal widths by as much as one pixel.<br/>

The old algorithm honored (A) but failed to honor the other criteria in the cases outlined above.<p/>

Everything said about columns and widths in this article applies as well to rows and heights.

- [x] Quirked
- [ ] Build-time break

### Recommended Action

By default, apps that target versions of the .NET Framework starting with the .NET Framework 4.7 will see the new algorithm, while apps that target the .NET Framework 4.6.2 or earlier versions will see the old algorithm.<p/>

To override the default, use the following configuration setting:

```xml
<runtime>
    <AppContextSwitchOverrides value="Switch.System.Windows.Controls.Grid.StarDefinitionsCanExceedAvailableSpace=true" />
</runtime>
```

The value `true` selects the old algorithm, `false` selects the new algorithm.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    ### Original Bug
    245278
-->

<!-- breaking change id: 171 -->
