## Avoiding endless recursion for IWorkflowInstanceManagement.TransactedCancel and IWorkflowInstanceManagement.TransactedTerminate

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
Under some circumstances when using <xref:System.ServiceModel.Activities.IWorkflowInstanceManagement.TransactedCancel%2A?displayProperty=nameWithType> or <xref:System.ServiceModel.Activities.IWorkflowInstanceManagement.TransactedTerminate%2A?displayProperty=nameWithType> APIs to cancel or terminate a worklow service instance, the workflow instance may encounter a stack overflow due to endless recursion when the `Workflow` runtime attempts to persist the service instance as part of processing the request. The problem occurs if the workflow instance is in a state where it is waiting for some other outstanding WCF request to another service to complete.

The `TransactedCancel` and `TransactedTerminate` operations create work items that are queued for the workflow service instance. These work items are not executed as part of the processing of the `TransactedCancel/TransactedTerminate` request. Because the workflow service instance is busy waiting for the other outstanding WCF request to complete, the work item created remains queued. The `TransactedCancel/TransactedTerminate` operation completes and control is returned back to the client. When the transaction associated with the `TransactedCancel/TransactedTerminate` operation attempts to commit, it needs to persist the workflow serivce instance state. But because there is an outstanding `WCF` request for the instance, the Workflow runtime cannot persist the workflow service instance, and an endless recursion loop leads to the stack overflow.

Because `TransactedCancel` and `TransactedTerminate` only create a work item in memory, the fact that a transaction exists doesn't have any effect. A rollback of the transaction does not discard the work item.

To address this issue, starting in .NET Framework 4.7.2, we have introduced an `AppSetting` that can be added to the `web.config/app.config` of the workflow service that tells it to ignore transactions for `TransactedCancel` and `TransactedTerminate`. This allows the transaction to commit without waiting for the workflow instance to persist.

The AppSetting for this feature is named `microsoft:WorkflowServices:IgnoreTransactionsForTransactedCancelAndTransactedTerminate`. A value of `true` indicates that the transaction should be ignored, thus avoiding the stack overflow. The default value of this AppSetting is `false`, so existing workflow service instances are not affected.


- [x] Quirked 
- [ ] Build-time break

### Recommended Action
If you are using AppFabric or another <xref:System.ServiceModel.Activities.IWorkflowInstanceManagement> client and are encountering a stack overflow in the workflow serivce instance when trying to cancel or terminate a workflow instance, you can add the following to the `<appSettings>` section of the web.config/app.config file for the workflow service:
  
```xml
  <add key="microsoft:WorkflowServices:IgnoreTransactionsForTransactedCancelAndTransactedTerminate" value="true"/>
```
  
If you are not encountering the problem, you do not need to do this.


### Affected APIs
  * Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)


<!--
    https://devdiv.visualstudio.com/DevDiv/_workitems/edit/258978
-->
