# Changes to ServicePoint.ConnectionLimit are overriden by usage of HttpClient

## Symptoms
The limit for HTTP connections per endpoint is controlled by the `ServicePointManager.DefaultConnectionLimit` property.
This value defaults to 2. This can be overriden programatically or in configuration for either specific hosts or for all hosts. In the .NET Framework 4.7.1, any usage of HttpClient APIs reverts any host-specific overrides to the default value of 2. This can cause applications to run slower or hang when doing multiple parallel requests.

Note: This bug also changes the http://localhost host default from Int32.MaxValue to 2.

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

            var uri = new Uri("http://www.microsoft.com"); ;

            Console.WriteLine("Before using HttpClient APIs, before changing ConnectionLimit");
            ServicePoint sp = ServicePointManager.FindServicePoint(uri);
            Console.WriteLine($"{uri.AbsoluteUri}, ConnectionLimit (should be {ServicePointManager.DefaultConnectionLimit}): {sp.ConnectionLimit}");
            sp.ConnectionLimit = 10;
            Console.WriteLine("Before using HttpClient APIs, after changing ConnectionLimit");
            Console.WriteLine($"{uri.AbsoluteUri}, ConnectionLimit (should be 10): {sp.ConnectionLimit}");

            Console.WriteLine("Use HttpClient APIs");
            var client = new HttpClient();
            try
            {
                HttpResponseMessage response = client.GetAsync(uri).Result;
            }
            catch (Exception)
            {
                // Ignore any network error
            }

            Console.WriteLine("After using HttpClient APIs");

            // BUG - due to the bug in .NET Framework 4.7.1, the ConnectionLimit for this ServicePoint is changed
            Console.WriteLine($"{uri.AbsoluteUri}, ConnectionLimit (should be 10): {sp.ConnectionLimit}");
    }
}
```

## Cause
Changes in .NET Framework 4.7.1 to the `System.Net.Http.HttpClientHandler` class caused this problem.

## Resolution
To work around the problem using HttpClient APIs, you can use the following code to increase the default connection limit for all endpoints.  This will affect all connections in the process.
This code should be added before calling any HttpClient APIs.

```c#
ServicePointManager.DefaultConnectionLimit = 20; // Actual value should be based on your requirements.
```

## More information
This issue was fixed in the [August 2018 Security and Quality Rollup](https://blogs.msdn.microsoft.com/dotnet/2018/08/14/august-2018-security-and-quality-rollup/).
Installing this or later updates will correct the problem.
