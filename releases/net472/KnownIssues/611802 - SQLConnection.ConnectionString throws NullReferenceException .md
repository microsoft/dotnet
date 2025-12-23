# NullReferenceException while setting `SqlConnection.ConnectionString` to an empty string or null.
## Symptoms

When an application tries to set the `ConnectionString` property of the `SqlConnection` object to an empty string or null value, a `NullReferenceException` is thrown. This exception occurs when .NET Framework 4.7.2 is installed on the OS hosting the application.


## Cause

.NET Framework 4.7.2 includes a change that increases the default connection retry count for connections to Azure SQL Database to two. 
This change sets the internal value of the retry count without validating if the `ConnectionString` is a non-null or non-empty value, 
which results in the `NullReferenceException`.

## Impact

The impact is limited to applications using the `SqlConnection.ConnectionString` API to set an empty connection string, which now throws an  exception.

## Workarounds

No known workarounds with .NET Framework 4.7.2.

## Resolution

This issue has been fixed in the [latest update to .NET Framework 4.7.2](https://go.microsoft.com/fwlink/?LinkId=2005309) for all platforms except Windows 10 April 2018 Update. 

For Windows 10 April 2018 Update, the fix will be available in the upcoming Cumulative Update.
