## OperationContext.Current may return null when called in a using clause

### Scope
Edge

### Version Introduced
4.6.2

### Version Reverted

### Source Analyzer Status
Investigating

### Change Description

<xref:System.ServiceModel.OperationContext.Current?displayProperty=nameWithType> may return `null` and a <xref:System.NullReferenceException> may result if all of the following conditions are true:

- You retrieve the value of the <xref:System.ServiceModel.OperationContext.Current?displayProperty=nameWithType> property in a method that returns a <xref:System.Threading.Tasks.Task> or <xref:System.Threading.Tasks.Task%601>.

- You instantiate the <xref:System.ServiceModel.OperationContextScope> object in a `using` clause.

- You retrieve the value of the <xref:System.ServiceModel.OperationContext.Current?displayProperty=nameWithType> property within the `using statement`. For example:

    ```csharp
    using (new OperationContextScope(OperationContext.Current))
    {
        OperationContext context = OperationContext.Current;      // OperationContext.Current is null.
        // ...
    }
    ```

- [X] Quirked
- [ ] Build-time break

### Recommended Action

To address this issue, you can do the following:

- Modify your code as follows to instantiate a new non-`null` <xref:System.ServiceModel.OperationContext.Current%2A> object:

    ```csharp
    OperationContext ocx = OperationContext.Current;
    using (new OperationContextScope(OperationContext.Current))
    {
        OperationContext.Current = new OperationContext(ocx.Channel);
        // ...
    }
    ```

- Install the latest update to the .NET Framework 4.6.2, or upgrade to a later version of the .NET Framework. This disables the flow of the <xref:System.Threading.ExecutionContext> in <xref:System.ServiceModel.OperationContext.Current?displayProperty=nameWithType> and restores the behavior of WCF applications in the .NET Framework 4.6.1 and earlier versions. This behavior is configurable; it is equivalent to adding the following app setting to your configuration file:

    ```xml
    <appSettings>
        <add key="Switch.System.ServiceModel.DisableOperationContextAsyncFlow" value="true" />
    </appSettings>
    ```

    If this change is undesirable and your application depends on execution context flowing between operation contexts, you can enable its flow as follows:

    ```xml
    <appSettings>
        <add key="Switch.System.ServiceModel.DisableOperationContextAsyncFlow" value="false" />
    </appSettings>
    ```

### Affected APIs
- `P:System.ServiceModel.OperationContext.Current`

### Category
Windows Communication Foundation (WCF)

<!--
    ### Original Bug
    #273574
-->

<!-- breaking change id: 185 -->
