## Error codes for maxRequestLength or maxReceivedMessageSize are different

### Scope
Edge

### Version Introduced
4.5

### Source Analyzer Status
Not planned

### Change Description

Messages in WCF web services hosted in Internet Information Services (IIS) or
ASP.NET Development Server that exceed maxRequestLength (in ASP.NET) or
maxReceivedMessageSize (in WCF) have different error code

The HTTP status code has changed from 400 (Bad Request) to 413 (Request Entity
Too Large), and messages that exceed either the maxRequestLength or the
maxReceivedMessageSize setting throw a
<xref:System.ServiceModel.ProtocolException?displayProperty=name> exception.
This includes cases in which the transfer mode is Streamed.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action

This change facilitates debugging in cases where the message length exceeds the
limits allowed by ASP.NET or WCF.

You must modify any code that performs processing based on an HTTP 400 status code.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Communication Foundation (WCF)

<!-- breaking change id: 45 -->
