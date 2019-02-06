## [|Breaking Change Title|]

// There is no built in way to do comments in Markdown, so this C# style comment used to mark comments. Please remove all of these before submission
// Please use proper markdown syntax for code snippets. See https://daringfireball.net/projects/markdown/syntax for examples
// Entries with [| ... |] are fields that must be updated.

### Scope
[|Major|Minor|Edge|Transparent|]
//A description of the Scope values can be found at https://docs.microsoft.com/dotnet/articles/framework/migration-guide/net-compatibility-diagnostics

### Version Introduced
[|Version in which the breaking change first occurred|]

### Version Reverted
[|Version in which the breaking change was reverted. If not applicable, please remove|]

### Source Analyzer Status
// Flag that specifies whether an analyzer for Microsoft.DotNet.FrameworkCompatibilityDiagnostics has been or will be written
// For more information on the diagnostics, see this blog: https://blogs.msdn.microsoft.com/dotnet/2016/03/03/net-framework-compatibility-diagnostics/
[|Investigating|Planned|Available|NotPlanned|]

### Change Description
[|Description of what a change does and how it may affect someone|]

// Replace the space with an 'x' if applicable
- [ ] Quirked // Uses some mechanism to turn the feature on or off, usually using runtime targeting, AppContext or config files. Needs to be turned on automatically for some situations.
- [ ] Build-time break // Causes a break if attempted to recompile

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
[|Pick a category from [the list of supported categories](!categories.md)|]

// If no link is available, please remove this line
[More information]([|LinkForMoreInformation|])

<!--
    ### Original Bug
    Bug link goes here
-->


