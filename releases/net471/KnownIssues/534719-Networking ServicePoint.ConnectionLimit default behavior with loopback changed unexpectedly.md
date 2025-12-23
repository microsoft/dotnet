# ServicePoint.ConnectionLimit default behavior with loopback changed unexpectedly

## Symptoms
The limit for HTTP connections per endpoint is controlled by the `ServicePointManager.DefaultConnectionLimit` property.
This value defaults to 2. In the .NET Framework 4.7 and earlier versions, the limit applied only to non-loopback 
addresses such as http://www.microsoft.com.  For loopback addresses such as http://localhost, the limit for connections
was always int.MaxValue (2,147,483,647) unless changed by calling the `ServicePoint.ConnectionLimit` API.

In the .NET Framework 4.7.1 when using HttpClient APIs, the connection limit for loopback addresses now matches the limit
for non-loopback addresses. Thus, the default limit is 2. This can cause applications to run slower or hang when
doing multiple, parallel, requests to the http://localhost addresses.

Here is code that shows the problem:

```c#
using System;
using System.Net;
using System.Net.Http;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine($"ServicePointManager.DefaultConnectionLimit: {ServicePointManager.DefaultConnectionLimit}");

            var uriLoopback = new Uri("http://localhost");
            var uriExternal = new Uri("http://www.microsoft.com");

            Console.WriteLine("Before using HttpClient APIs");
            ServicePoint spLoopback = ServicePointManager.FindServicePoint(uriLoopback);
            Console.WriteLine($"{uriLoopback.AbsoluteUri}, ConnectionLimit (should be {int.MaxValue}): {spLoopback.ConnectionLimit}");

            ServicePoint spExternal = ServicePointManager.FindServicePoint(uriExternal);
            Console.WriteLine($"{uriExternal.AbsoluteUri}, ConnectionLimit (should be {ServicePointManager.DefaultConnectionLimit}): {spExternal.ConnectionLimit}");

            Console.WriteLine("Use HttpClient APIs");
            var client = new HttpClient();
            try
            {
                HttpResponseMessage response = client.GetAsync(uriLoopback).Result;
            }
            catch (Exception)
            {
                // Ignore any network error since there is probably not a loopback server present.
            }

            Console.WriteLine("After using HttpClient APIs");

            // BUG - due to the bug in .NET Framework 4.7.1, the ConnectionLimit for this loopback ServicePoint is changed
            // unexpectedly.
            Console.WriteLine($"{uriLoopback.AbsoluteUri}, ConnectionLimit (should be {int.MaxValue}): {spLoopback.ConnectionLimit}");
        }
    }
}
```

## Cause
Changes in .NET Framework 4.7.1 to the `System.Net.Http.HttpClientHandler` class caused this problem.

## Resolution
To work around the problem using HttpClient APIs, you can use the following code to increase the connection limit.
This code should be added before calling any HttpClient APIs.

```c#
ServicePointManager.DefaultConnectionLimit = 20; // Actual value should be based on your requirements.
```

Note: This will also change the limits for non-loopback addresses.

## More information
This issue was fixed in the [August 2018 Security and Quality Rollup](https://blogs.msdn.microsoft.com/dotnet/2018/08/14/august-2018-security-and-quality-rollup/).
Installing this or later updates will correct the problem.
