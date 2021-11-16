# InvalidOperationException in ASP.Net-RecycleLimitMonitor-AlertProxyMonitors

## Symptoms
ASP.Net applications may crash intermittently due to an `InvalidOperationException` in
`System_Web_ni!System.Web.Hosting.RecycleLimitMonitor+RecycleLimitMonitorSingleton.AlertProxyMonitors`.

## Cause
This issue was introduced when ASP.Net 4.7 separated cache management and memory monitoring. This new `RecycleLimitMonitorSingleton` monitors worker process private bytes usage against the recycling limit for the process, and when
the limit is near, it alerts a set of "proxy monitors" in each registered AppDomain so they can take action to avoid a process
recycle. The collection of "proxy monitors" being enumerated was not thread-safe, though, so new AppDomains spinning up or old
AppDomains shutting down while this monitor enumerated the collection could result in this unhandled `InvalidOperationException`
in the default AppDomain, causing a crash.

## Workaround 
There is no reliable workaround. If the environment does not tend to consume private bytes near the recycling limit, or if
web app domain lifetimes tend to last the entire length of the process lifetime, then chances of hitting this issue are
extremely minimal. More private bytes consumption and/or more AppDomain recycling increases the odds of hitting this exception condition.

## Resolution
A hotfix for this issue is available for .Net 4.8. https://support.microsoft.com/en-us/help/4502560/cumulative-update-for-net-framework-june-18-2019
