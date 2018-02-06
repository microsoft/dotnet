## TLS 1.x by default passes the SCH_SEND_AUX_RECORD flag to the underlying SCHANNEL API

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
NotPlanned

### Change Description

When using TLS 1.x, the .NET Framework relies on the underlying Windows SCHANNEL API. Starting with .NET Framework 4.6, the [`SCH_SEND_AUX_RECORD`](https://msdn.microsoft.com/en-us/library/windows/desktop/aa379810(v=vs.85).aspx) flag is passed by default to SCHANNEL. This causes SCHANNEL to split data to be encrypted into two separate records, the first as a single byte and the second as *n*-1 bytes.   

In rare cases, this breaks communication between clients and existing servers that make the assumption that the data resides in a single record.

- [X] ] Quirked
- [ ] Build-time break

### Recommended Action

If this changes breaks communication with an existing server, you can prevent the [`SCH_SEND_AUX_RECORD`](https://msdn.microsoft.com/en-us/library/windows/desktop/aa379810(v=vs.85).aspx) flag from being uses and restore the previous behavior of not splitting data into separate records by adding the following switch to the [`\<AppContextSwitchOverrides>` element](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/appcontextswitchoverrides-element) in the [`\<runtime> section](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/runtime-element) of your app configuration file:

```xml
<runtime>
   <AppContextSwitchOverrides   
          value="Switch.System.Net.DontEnableSchSendAuxRecord=true" /> 
</runtime>
```


[|
  Suggested steps if user is affected go here:

  - Example of code changes to handle change
  - How to opt out of change
  - For earlier versions, how to opt in to change
|]

### Affected APIs
[| List of APIs affected by change referred to using docids|]

// For details on how to generate docids, please look at other change files or
// see https://msdn.microsoft.com/en-us/library/fsbx0t7x.aspx for the spec.
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
Networking

<!--
    ### Original Bug #186985
-->


