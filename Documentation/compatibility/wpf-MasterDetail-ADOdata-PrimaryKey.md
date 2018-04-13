## WPF Changing a primary key when displaying ADO data in a Master/Detail scenario

### Scope
Minor

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Suppose you have an ADO collection of items of type `Order`, with a relation named "OrderDetails"
relating it to a collection of items of type `Detail` via the primary key "OrderID".
In your WPF app, you can bind a list control to the details for a given order:

```xml
<ListBox ItemsSource="{Binding Path=OrderDetails}" >
```

where the DataContext is an `Order`.
WPF gets the value of the `OrderDetails` property - a collection D of all the `Detail` items whose `OrderID`
matches the `OrderID` of the master item.

The behavior change arises when you change the primary key `OrderID` of the master item.
ADO automatically changes the `OrderID` of each of the affected records in the Details collection
(namely the ones copied into collection D).  But what happens to D?

- Old behavior:   Collection D is cleared.   The master item does _not_ raise a change notification for property `OrderDetails`.  The ListBox continues to use collection D, which is now empty.

- New behavior:  Collection D is unchanged.   Each of its items raises a change notification for the `OrderID` property.  The ListBox continues to use collection D, and displays the details with the new `OrderID`.

WPF implements the new behavior by creating collection D in a different way:  by calling the ADO method
<xref:System.Data.DataRowView.CreateChildView(System.Data.DataRelation,System.Boolean)?displayProperty=nameWithType>
with the `followParent` argument set to `true`.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
An app gets the new behavior by using the following AppContext switch.

```xml
<configuration>
    <runtime>
        <AppContextSwitchOverrides value="Switch.System.Windows.Data.DoNotUseFollowParentWhenBindingToADODataRelation=false"/>
    </runtime>
</configuration>

```

The switch defaults to `true` (old behavior) for apps that target .NET 4.7.1 or below,
and to `false` (new behavior) for apps that target .NET 4.7.2 or above.

### Affected APIs
Not detectable via API analysis

### Category
Windows Presentation Foundation (WPF)

<!--
    457740
-->

