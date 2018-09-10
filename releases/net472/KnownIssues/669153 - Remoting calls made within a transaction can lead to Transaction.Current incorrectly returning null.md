# Errors occur in applications that combine transaction flow and remote calls after the July 2018 .NET Framework Security and Quality Rollups are installed.

## Symptoms
After you install the July 2018 .NET Framework Security and Quality Rollups that apply to .NET Framework 4.6, 4.6.1, 4.6.2, 4.7, 4.7.1, and 4.7.2 on Windows 7 Service Pack 1 (SP1), Windows Server 2008 R2 SP1 or Windows Server 2008 SP2, you notice errors in .NET Framework applications that meet the following criteria:
- The application uses instances of the **System.Transaction.TransactionScope** class where transaction flow is enabled by passing **TransactionScopeAsyncFlowOption.Enabled** to the constructor. 

- The application makes one or more remote calls while one of these transaction scopes is active, where a remote call is any call that travels through a transparent proxy before reaching the server object. Examples of remote calls include calls to other application domains and calls made through remoting channels such as the client channels defined in the **System.Runtime.Remoting.Channels** namespaces.

- After the remote call, **System.Transactions.Transaction.Current** returns null, rather than the value that was returned before the remote call.

## Workaround
To work around this issue, try any of the following methods:
- For each transaction scope that enables transaction flow, change the application to make sure that no remote calls occur anywhere in the code that runs while the transaction scope is active. When you consider whether a transaction scope contains any remote calls, note the following: 
  - A call to a static method is never a remote call.
  - For a call to an instance method on a target object, the call is remote only if the target object is a transparent proxy.
  - For a call to a constructor, the call is remote only if the constructed object is a transparent proxy.
  
  **Note** The **System.Runtime.Remoting.RemotingServices.IsTransparentProxy** method can always be used to check whether an object is a transparent proxy.

- Disable transaction flow by removing the **TransactionScopeAsyncFlowOption.Enabled** constructor argument.
  **Warning** This workaround is likely to cause other errors if any "await" operations execute while the transaction scope is active.

- The **Transaction.Current** property is not automatically serialized to the remote call. It must be passed as a parameter. If the remote call does not pass the transaction as a parameter and does not make a callback to the client during the remote call, then you can create the remote call inside a new **TransactionScope** object that uses the **TransactionScopeOptions.Suppress** option. Inside this suppress transaction scope, the **Transaction.Current** property will have a null value.


## Status
We are aware of this issue and are currently working on a resolution.
