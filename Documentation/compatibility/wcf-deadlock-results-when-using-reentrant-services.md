## Deadlock may result when using Reentrant services

### Scope
Minor

### Version Introduced
4.6.2

### Source Analyzer Status
Investigating

### Change Description

A deadlock may result in a Reentrant service, which restricts instances of the service to one thread of execution at a time. Services prone to encounter this problem will have the following <xref:System.ServiceModel.ServiceBehaviorAttribute> in their code:

```csharp
[ServiceBehavior(ConcurrencyMode = ConcurrencyMode.Reentrant)]
```

- [X] Quirked 
- [ ] Build-time break 

### Recommended Action

To address this issue, you can do the following:

- Set the service's concurrency mode to <xref:System.ServiceModel.ConcurrencyMode.Single?displayProperty=nameWithType> or <System.ServiceModel.ConcurrencyMode.Multiple?displayProperty=nameWithType>. For example:
 
   ```csharp
   [ServiceBehavior(ConcurrencyMode = ConcurrencyMode.Single)]
   ```   
 
- Install the latest update to the .NET Framework 4.6.2, or upgrade to a later version of the .NET Framework. This disables the flow of the <xref:System.Threading.ExecutionContext> in <xref:System.ServiceModel.OperationContext.Current?displayProperty=nameWithType>. This behavior is configurable; it is equivalent to adding the following app setting to your configuration file:
 
   ```xml
   <appSettings>
      <add key="Switch.System.ServiceModel.DisableOperationContextAsyncFlow" value="true" />
   </appSettings>
   ```
   
   The value of `Switch.System.ServiceModel.DisableOperationContextAsyncFlow` should never be set to `false` for Rentrant services. 

### Affected APIs
- `T:System.ServiceModel.ServiceBehaviorAttribute`
- `F:System.ServiceModel.ConcurrencyMode.Reentrant`
- 
### Category
Windows Communication Foundation (WCF)

<!--
    ### Original Bug
    #249750, 253477, 273574
-->

<!-- breaking change id: 186 -->
