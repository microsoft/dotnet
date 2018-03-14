## ContextMenuStrip.SourceControl property contains a valid control in the case of nested ToolStripMenuItems

### Scope
Edge

### Version Introduced
4.7.3

### Source Analyzer Status
NotPlanned

### Change Description
ContextMenuStrip.SourceControl property now correctly returns the expected control source in nested ToolStripMenuItem cases.

- [X] Quirked
- [ ] Build-time break

### Recommended Action
[|
  Suggested steps if user is affected go here:

  - Example of code changes to handle change
  - How to opt out of change
  - For earlier versions, how to opt in to change
|]

### Affected APIs
[| List of APIs affected by change referred to using docids|]

// For details on how to generate docids, please look at other change files or
// see https://msdn.microsoft.com/library/fsbx0t7x.aspx for the spec.
//
// For example, if all members of System.Xml.XmlTextReader is affected, we would have the following item:
// * `T:System.Xml.XmlTextReader`
//
// Notice that only the type is included, as everything contained with it will be included as well. This works for any level of the type
// hierarchy and allows for whole namespaces to be included if needed.
//
// If no specific API is affected, use the following entry:
//  * Not detectable via API analysis

### Category
Windows Forms


<!--
    ### 460662 
    https://devdiv.visualstudio.com/0bdbc590-a062-4c3f-b0f6-9383f67865ee/_workitems/edit/460662
-->


