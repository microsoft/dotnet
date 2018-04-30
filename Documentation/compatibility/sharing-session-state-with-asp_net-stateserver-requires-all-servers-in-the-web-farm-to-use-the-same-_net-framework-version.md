## Sharing session state with Asp.Net StateServer requires all servers in the web farm to use the same .NET Framework version

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

When enabling
<xref:System.Web.SessionState.SessionStateMode.StateServer?displayProperty=name>
session state, all of the servers in the given web farm must use the same
version of the .NET Framework in order for state to be properly shared.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

Be sure to upgrade .NET Framework versions on web servers that share state at
the same time.

### Affected APIs
* `F:System.Web.SessionState.SessionStateMode.StateServer`

### Category
ASP.NET

[More information](http://connect.microsoft.com/VisualStudio/feedback/details/823803/asp-net-stateserver-requests-are-not-compatible-between-4-0-and-4-5-1-versions-of-net-framework)

<!--
    ### Notes
    Source analysis will be more useful than binary here; we'll want to look in the web.config for StateServer usage (https://msdn.microsoft.com/subscriptions/downloads/h6bb9cz9(v=vs.71).aspx)
-->

<!-- breaking change id: 128 -->
