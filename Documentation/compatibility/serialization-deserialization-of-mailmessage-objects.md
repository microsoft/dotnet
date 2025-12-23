## Deserialization of MailMessage objects serialized under the .NET Framework 4.5 may fail

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Investigating

### Change Description
Starting with the .NET Framework 4.5, <xref:System.Web.Mail.MailMessage> objects can include non-ASCII characters. In the .NET Framework 4, only ASCII characters are supported. <xref:System.Web.Mail.MailMessage> objects that contain non-ASCII characters and that are serialized under the .NET Framework 4.5 or later cannot be deserialized under the .NET Framework 4. 

- [ ] Quirked 
- [ ] Build-time break 

### Recommended Action

Ensure that your code provides exception handling when deserializing a <xref:System.Web.Mail.MailMessage> object.

### Affected APIs
<xref:System.Web.Mail.MailMessage>

### Category
Networking

<!--
    ### Original Bug
    Bug link goes here
-->


