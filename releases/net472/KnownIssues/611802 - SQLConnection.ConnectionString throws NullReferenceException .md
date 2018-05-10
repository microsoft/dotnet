# NullReferenceException while setting `SqlConnection.ConnectionString` to an empty string or null.
## Symptoms

When an application tries to set the `ConnectionString` property of the `SqlConnection` object to an empty string or null value, a `NullReferenceException` is thrown. This exception occurs when .NET Framework 4.7.2 is installed on the OS hosting the application.


## Cause

.NET Framework 4.7.2 includes change which increases the default connection retry count for connections to Azure SQL Database to two. 
This change sets the internal value of the retry count without validating if the `ConnectionString` is a non-null or non-empty value, 
which results in the `NullReferenceException`.

## Impact

The impact is limited to applications using `SqlConnection.ConnectionString` API to set an empty connection string, which now throws an  exception.

## Workarounds

No known workarounds with .NET Framework 4.7.2.

## Resolution

The .NET team is working on a fix that will be available in a future update.
