# Errors occur in applications that combine transaction flow and remote calls.

## Symptoms
In .NET 4.7.2, you notice errors in .NET Framework applications that meet the following criteria:
- The application uses instances of the [System.Transaction.TransactionScope](https://docs.microsoft.com/dotnet/api/system.transactions.transactionscope) class where transaction flow is enabled by passing [TransactionScopeAsyncFlowOption.Enabled](https://docs.microsoft.com/dotnet/api/system.transactions.transactionscopeasyncflowoption) to the constructor. 

- The application makes one or more remote calls while one of these transaction scopes is active, where a remote call is any call that travels through a transparent proxy before reaching the server object. Examples of remote calls include calls to other application domains and calls made through remoting channels such as the client channels defined in the **System.Runtime.Remoting.Channels** namespaces.

- After the remote call, [System.Transactions.Transaction.Current](https://docs.microsoft.com/dotnet/api/system.transactions.transaction.current) returns `null`, rather than the value that was returned before the remote call.

## Workaround
To work around this issue, try any of the following methods:
- For each transaction scope that enables transaction flow, change the application to make sure that no remote calls occur anywhere in the code that runs while the transaction scope is active. When you consider whether a transaction scope contains any remote calls, note the following: 
  - A call to a static method is never a remote call.
  - For a call to an instance method on a target object, the call is remote only if the target object is a transparent proxy.
  - For a call to a constructor, the call is remote only if the constructed object is a transparent proxy.
  
  **Note** The [System.Runtime.Remoting.RemotingServices.IsTransparentProxy](https://docs.microsoft.com/dotnet/api/system.runtime.remoting.remotingservices.istransparentproxy) method can always be used to check whether an object is a transparent proxy.

- Disable transaction flow by removing the [TransactionScopeAsyncFlowOption.Enabled](https://docs.microsoft.com/dotnet/api/system.transactions.transactionscopeasyncflowoption) constructor argument.

  **Warning** This workaround is likely to cause other errors if any "await" operations execute while the transaction scope is active.

- The [System.Transactions.Transaction.Current](https://docs.microsoft.com/dotnet/api/system.transactions.transaction.current) property is not automatically serialized to the remote call. It must be passed as a parameter. If the remote call does not pass the transaction as a parameter and does not make a callback to the client during the remote call, then you can create the remote call inside a new [System.Transaction.TransactionScope](https://docs.microsoft.com/dotnet/api/system.transactions.transactionscope) object that uses the [TransactionScopeOption.Suppress](https://docs.microsoft.com/dotnet/api/system.transactions.transactionscopeoption) option. Inside this suppress transaction scope, the [System.Transactions.Transaction.Current](https://docs.microsoft.com/dotnet/api/system.transactions.transaction.current) property will have a `null` value.


## Status
We are aware of this issue and are currently working on a resolution.
