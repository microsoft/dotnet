## Accessibility improvements in WPF

### Scope
Major

### Version Introduced
4.8

### Source Analyzer Status
NotPlanned

### Change Description
**Tooltips show on Keyboard focus**
In .NET Framework 4.7.2 and earlier versions, tooltips only display when a user hovers the mouse cursor over a WPF control. Starting with .NET Framework 4.8, , tooltips are displayed on keyboard focus as well as via a keyboard shortcut.
To enable this feature, an application needs to target .NET Framework 4.8 or opt-in via [SystemColors.HighlightTextBrushKey](xref:System.Windows.SystemColors.HighlightTextBrushKey) `Switch.UseLegacyAccessibilityFeatures.3` and `Switch.UseLegacyToolTipDisplay`., as the following example shows:
```xml
<?xml version="1.0" encoding="utf-8" ?> 
<configuration> 
    <startup>  
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7" /> 
    </startup> 
  <runtime> 
    <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=false;Switch.UseLegacyToolTipDisplay=false" /> 
  </runtime> 
</configuration> 
```

Once enabled, all controls containing a tooltip will display it once the control receives keyboard focus. The tooltip can be dismissed over time or when keyboard focus changes. Users can also dismiss the tooltip manually with a new keyboard shortcut, Ctrl + Shift + F10. Once the tooltip has been dismissed, it can be displayed again by using the same keyboard shortcut.

Note: [RibbonToolTips](xref:System.Windows.Controls.Ribbon.RibbonToolTip) on [RibbonControls](xref:System.Windows.Controls.Ribbon.RibbonControl) don’t show on keyboard focus; they only show by using the keyboard shortcut.

**Elements with Collapsed or Hidden visibility are no longer announced by screen readers**
User interfaces containing <xref:System.Windows.Visibility.Collapsed?displayProperty=nameWithType> or <System.Windows.Visibility.Hidden?displayProperty=nameWithType> elements can be misrepresented by screen readers if such elements are announced to the user. In .NET Framework 4.8, WPF no longer includes Collapsed or Hidden elements in the Control View of the UIAutomation tree, so that screen readers no longer announce these elements.

**SizeOfSet and PositionInSet Support**
Windows 10 introduced the  SizeOfSet and PositionInSet [UIAutomation properties](/windows/desktop/winauto/uiauto-automation-element-propids), which are used by applications to describe the count of items in a set. UIAutomation client applications such as screen readers can then query an application for these properties and announce an accurate representation of the application’s UI.

This feature adds support for WPF applications to expose these two properties to UIAutomation. These two properties can be exposed to UIAutomation in either of two ways:

- __Dependency Properties__<br/> The  [SizeOfSet](xref:System.Windows.Automation.AutomationProperties.SizeOfSetProperty) and [PositionInSet](xref:System.Windows.Automation.AutomationProperties.PositionInSetProperty) [dependency properties](xref:System.Windows.DependencyProperty) have been added to the <xref:System.Windows.Automation.AutomationProperties> class. A developer can set their values via XAML:
```xaml
    <Button AutomationProperties.SizeOfSet="3" 
            AutomationProperties.PositionInSet="1">Button 1</Button> 
    <Button AutomationProperties.SizeOfSet="3" 
            AutomationProperties.PositionInSet="2">Button 2</Button> 
    <Button AutomationProperties.SizeOfSet="3" 
            AutomationProperties.PositionInSet="3">Button 3</Button> 
```


- __AutomationPeer virtual methods__<br/> The <xref:System.Windows.Automation.Peers.AutomationPeer.GetSizeOfSetCore> and <xref:System.Windows.Automation.Peers.AutomationPeer.GetPositionInSetCore> virtual methods  have been added to the <xref:System.Windows.Automation.Peers.AutomationPeer> class. A developer can provide values for `SizeOfSet` and `PositionInSet` by overriding these methods:
```csharp
    public class MyButtonAutomationPeer : ButtonAutomationPeer 
    { 
        protected override int GetSizeOfSetCore() 
        { 
            // Call into your own logic to provide a value for SizeOfSet 
            return CalculateSizeOfSet(); 
        } 

         protected override int GetPositionInSetCore() 
        { 
            // Call into your own logic to provide a value for PositionInSet 
            return CalculatePositionInSet(); 
        } 
    } 
```
- __Automatic Values__<br/>Items in [ItemsControls](xref:System.Windows.Controls.ItemsControl)  provide a value for these properties automatically without additional action from the developer. If an ItemsControl is grouped, the collection of groups is represented as a set, and each group is counted as a separate set, with each item inside that group providing its position inside that group as well as the size of the group. Automatic values are not affected by virtualization. Even if an item is not realized, it is still counted toward the total size of the set and affects the position in the set of its sibling items.

**ControllerFor property support**
UIAutomation’s ControllerFor property returns an array of automation elements that are manipulated by the automation element that supports this property. This property is commonly used for Auto-suggest accessibility. ControllerFor is used when an automation element affects one or more segments of the application UI or the desktop. Otherwise, it is hard to associate the impact of the control operation with UI elements. This feature adds the ability for controls to provide a value for the ControllerFor property.

A new virtual method has been added to the <xref:System.Windows.Automation.Peers.AutomationPeer> class:
```csharp
    virtual protected List<AutomationPeer> GetControlledPeersCore()
```
To provide a value for the ControllerFor property, simply override this method and return a list of [AutomationPeers](xref:System.Windows.Automation.Peers.AutomationPeer) for the controls being manipulated by this <xref:System.Windows.Automation.Peers.AutomationPeer>:
```csharp
public class AutoSuggestTextBox: TextBox
    {
        protected override AutomationPeer OnCreateAutomationPeer()
        {
            return new AutoSuggestTextBoxAutomationPeer(this);
        }

        public ListBox SuggestionListBox;
    }

    internal class AutoSuggestTextBoxAutomationPeer : TextBoxAutomationPeer
    {
        public AutoSuggestTextBoxAutomationPeer(AutoSuggestTextBox owner) : base(owner)
        {        
        }

        protected override List<AutomationPeer> GetControlledPeersCore()
        {
            List<AutomationPeer> controlledPeers = new List<AutomationPeer>();
            AutoSuggestTextBox owner = Owner as AutoSuggestTextBox;

            controlledPeers.Add(UIElementAutomationPeer.CreatePeerForElement(owner.SuggestionListBox));
            return controlledPeers;
        }
    }
```

**The Name Automation property is now correctly propagated for the DatePicker and RibbonComboBox controls**
Starting with .NET Framework 4.8, the <xref:System.Windows.Controls.DatePicker> and <xref:System.Windows.Controls.Ribbon.RibbonComboBox> controls reflect the <xref:System.Windows.Automation.AutomationProperties.Name?displayProperty=nameWithType> value assigned to them when read by a screen reader.

**Expanders in GroupItem headers are now announced by screen readers**
Starting with .NET Framework 4.8, an <xref:System.Windows.Controls.Expander> in a re-templated <xref:System.Windows.Controls.GroupItem> header is announced by screen readers.

**Improved focus move logic when WPF is hosted in Windows Forms**
The focus no longer loops inside a WPF <xref:System.Windows.Controls.UserControl> instead of breaking out of it under some hosting scenarios.

**Changed the padding header in GridView to not focusable**
In the .NET Framework 4.7.2 and earlier versions, the automatically generated padding header in a <xref:System.Windows.Controls.GridView> control was focusable, creating a bad experience for keyboard-only users. Starting with .NET Framework 4.8, it is not focusable.

**Fixed automation tree for plain ItemsControl**
Fixed an accessibility problem where the automation tree exposed for a plain <xref:System.Windows.Controls.ItemsControl> (as opposed to a derived class like ListBox or DataGrid) was not correct.

**Fixed bounding rectangles in Per-Monitor DPI**
In .NET Framework 4.7.2 and earlier versions, certain bounding rectangles around text are drawn incorrectly by Accessibility tools when WPF is run in Per-Monitor Aware mode. Starting with .NET Framework 4.8, they are drawn correctly.

</br>

- [x] Quirked
- [ ] Build-time break

### Recommended Action
__How to opt in or out of these changes__
  
In order for the application to benefit from these changes, it must run on the .NET Framework 4.8 or later. The application can benefit from these changes in either of the following ways:
- It is recompiled to target the .NET Framework 4.8. These accessibility changes are enabled by default on WPF applications that target the .NET Framework 4.8 or later.
- It targets the .NET Framework 4.7.2 or an earlier version and opts out of the legacy accessibility behaviors by adding the following [AppContext switch](https://docs.microsoft.com/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) to the `<runtime>` section of the app config file and setting it to `false`, as the following example shows.

```xml
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7"/>
      </startup>
      <runtime>
        <!-- AppContextSwitchOverrides value attribute is in the form of 'key1=true|false;key2=true|false  -->
        <AppContextSwitchOverrides value="Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=false" />
      </runtime>
    </configuration>
```    
Note that to opt in to the accessibility features added in .NET Framework 4.8, you must also opt in to the accessibility features of .NET Framework 4.7.2 and .NET Framework 4.7.1 as well.
Applications that target the .NET Framework 4.8 or later and want to preserve the legacy accessibility behavior can opt in to the use of legacy accessibility features by explicitly setting this AppContext switch to `true`.

### Affected APIs

* `M:System.Windows.Automation.Peers.AutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.AutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.AutomationPeer.GetControlledPeersCore`
* `M:System.Windows.Automation.Peers.AutomationPeer.GetSizeOfSet`
* `M:System.Windows.Automation.Peers.AutomationPeer.GetPositionInSet`
* `M:System.Windows.Automation.Peers.AutomationPeer.GetControlledPeers`
* `M:System.Windows.Automation.Peers.ContentElementAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.ContentElementAutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.UIElementAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.UIElementAutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.UIElement3DAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.UIElement3DAutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.DataGridCellItemAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.DataGridCellItemAutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.DateTimeAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.DateTimeAutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.GroupItemAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.GroupItemAutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.ItemAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.ItemAutomationPeer.GetPositionInSetCore`
* `M:System.Windows.Automation.Peers.MenuItemAutomationPeer.GetSizeOfSetCore`
* `M:System.Windows.Automation.Peers.MenuItemAutomationPeer.GetPositionInSetCore`
* `F:System.Windows.Automation.AutomationProperties.SizeOfSetProperty`
* `M:System.Windows.Automation.AutomationProperties.SetSizeOfSet(System.Windows.DependencyObject,int)`
* `M:System.Windows.Automation.AutomationProperties.GetSizeOfSet(System.Windows.DependencyObject)`
* `F:System.Windows.Automation.AutomationProperties.PositionInSetProperty`
* `M:System.Windows.Automation.AutomationProperties.SetPositionInSet(System.Windows.DependencyObject,int)`
* `M:System.Windows.Automation.AutomationProperties.GetPositionInSet(System.Windows.DependencyObject)`
* `F:System.Windows.Automation.AutomationElement.SizeOfSetProperty`
* `F:System.Windows.Automation.AutomationElement.PositionInSetProperty`
* `F:System.Windows.Automation.AutomationElementIdentifiers.SizeOfSetProperty`
* `F:System.Windows.Automation.AutomationElementIdentifiers.PositionInSetProperty`
* `F:System.Windows.Automation.AutomationElementIdentifiers.ControllerForProperty`

### Category
WPF

<!--
    ### Original Bug
        410007
        433560
        488213
        503411
        520147
        542626
        559546
        614397
        617457
        646633
-->
