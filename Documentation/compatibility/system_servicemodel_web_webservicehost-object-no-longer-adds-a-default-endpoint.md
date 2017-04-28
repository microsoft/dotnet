## System.ServiceModel.Web.WebServiceHost object no longer adds a default endpoint

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Planned

### Change Description

The <xref:System.ServiceModel.Web.WebServiceHost>
object no longer adds a default endpoint if an explicit endpoint has been added
by application code.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

If users will expect to be able to connect to a default endpoint and other
explicit endpoints have been added to the
<xref:System.ServiceModel.Web.WebServiceHost?displayProperty=name>, default
endpoints should also be added explicitly (using <xref:System.ServiceModel.ServiceHostBase.AddDefaultEndpoints?displayProperty=name>).

### Affected APIs
* `M:System.ServiceModel.ServiceHost.AddServiceEndpoint(System.Type,System.ServiceModel.Channels.Binding,System.String)`
* `M:System.ServiceModel.ServiceHost.AddServiceEndpoint(System.Type,System.ServiceModel.Channels.Binding,System.Uri)`
* `M:System.ServiceModel.ServiceHost.AddServiceEndpoint(System.Type,System.ServiceModel.Channels.Binding,System.String,System.Uri)`
* `M:System.ServiceModel.ServiceHost.AddServiceEndpoint(System.Type,System.ServiceModel.Channels.Binding,System.Uri,System.Uri)`
* `M:System.ServiceModel.ServiceHost.AddServiceEndpoint(System.Type,System.ServiceModel.Channels.Binding,System.Uri,System.Uri)`
* `M:System.ServiceModel.ServiceHostBase.AddServiceEndpoint(System.ServiceModel.Description.ServiceEndpoint)`
* `M:System.ServiceModel.ServiceHostBase.AddServiceEndpoint(System.String,System.ServiceModel.Channels.Binding,System.String)`
* `M:System.ServiceModel.ServiceHostBase.AddServiceEndpoint(System.String,System.ServiceModel.Channels.Binding,System.Uri)`
* `M:System.ServiceModel.ServiceHostBase.AddServiceEndpoint(System.String,System.ServiceModel.Channels.Binding,System.String,System.Uri)`
* `M:System.ServiceModel.ServiceHostBase.AddServiceEndpoint(System.String,System.ServiceModel.Channels.Binding,System.Uri,System.Uri)`

### Category
Windows Communication Foundation (WCF)

<!--
    ### Notes
    If an explicit endpoint is added, then the expected default endpoint will not exist. An analyzer can look for explicit endpoints being added without a corresponding call to add default endpoints. A code fix is possible here, too, by just calling <xref:System.ServiceModel.ServiceHostBase.AddDefaultEndpoints?displayProperty=name>. Note, though, that this is probably just informational since it's often not something that needs fixed.

    Source analyzer status: Pri 2, Planned
-->

<!-- breaking change id: 30 -->
