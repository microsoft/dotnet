## HttpRuntime.AppDomainAppPath Throws a NullReferenceException

### Scope
Edge

### Version Introduced
4.6.2

### Version Reverted
4.7

### Source Analyzer Status
NotPlanned

### Change Description
In the .NET Framework 4.6.2, the runtime throws a `T:System.NullReferenceException` when retrieving a `P:System.Web.HttpRuntime.AppDomainAppPath` value that includes null characters. 

In the .NET Framework 4.6.1 and earlier versions, the runtime throws an `T:System.ArgumentNullException`.

- [ ] Quirked
- [X] Build-time break

### Recommended Action
You can do either of the follow to respond to this change: 

- Handle the `T:System.NullReferenceException` if you application is running on the .NET Framework 4.6.2.

- Upgrade to the .NET Framework 4.7, which restores the previous behavior and throws an `T:System.ArgumentNullException`.

### Affected APIs
`P:System.Web.HttpRuntime.AppDomainAppPath`

### Category
ASP.NET

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems?id=252467&_a=edit
-->

<!-- breaking change id: 183 -->

