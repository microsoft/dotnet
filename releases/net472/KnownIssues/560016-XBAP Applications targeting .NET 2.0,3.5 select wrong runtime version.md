# XBAP applications that target .NET Framework 3.5 select the wrong runtime (v4 CLR) instead of v2.0 CLR 

## Symptoms

When a XAML Browser Application (XBAP) that targets .NET Framework 3.5 is launched, it is loaded in CLR v4 incorrectly instead of CLR v2.0, as expected. Along with the incorrect CLR, the .NET Framework libraries are also loaded from the latest version of .NET (.NET 4.x), and not .NET 3.5. Many XBAP applications launch and work normally under CLR v4, but some fail. The failure-mode is specific to the individual application and cannot be easily generalized. 

## Resolution

A fix will be released shortly for .NET Framework 4.7.2 on Windows 10 Spring Creators Update. .NET Framework 4.7.2 on all other OS platforms already has this fix. 

The fix for this issue must be enabled by customers who have problems running XBAP applications that target .NET Framework 3.5 under CLR v4. The fix can be enabled by setting the following registry keys: 

<table>
        <tr>
            <th>Platform Architecture</th>
            <th>Registry Key</th>
            <th>Value Name</th>
            <th>Value Kind</th>
            <th>Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td rowspan="2">32-bit</td>
            <td rowspan="2"><code>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\Windows Presentation Foundation\Hosting</code></td>
            <td rowspan="2"><code>DoNotLaunchVersion3HostedApplicationInVersion4Runtime</code></td>
            <td rowspan="2"><code>REG_DWORD</code></td>
            <td><code>0</code>, or value does not exist</td>
            <td>XBAP applications that target .NET Framework 3.5 or.NET Framework 4.x will be both launched under CLR v4</td>
        </tr>
        <tr>
            <td><code>1</code>, or any non-zero value</td>
            <td>XBAP applications that target .NET Framework 3.5 will be launched under CLR v2, and XBAP applications that target .NET Framework 4.x will be launched under CLR v4</td>
        </tr>
        <tr>
            <td rowspan="2">64-bit</td>
            <td rowspan="2">
                Both of these keys should be set: <p>
                <ul>
                    <li><code>HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\Windows Presentation Foundation\Hosting</code></li>
                    <li><code>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\Windows Presentation Foundation\Hosting</code></li>
                </ul>
            </td>
            <td rowspan="2"><code>DoNotLaunchVersion3HostedApplicationInVersion4Runtime</code></td>
            <td rowspan="2"><code>REG_DWORD</code></td>
            <td><code>0</code>, or value does not exist</td>
            <td>XBAP applications that target .NET Framework 3.5 or.NET Framework 4.x will be both launched under CLR v4</td>
        </tr>
        <tr>
            <td><code>1</code>, or any non-zero value</td>
            <td>XBAP applications that target .NET Framework 3.5 will be launched under CLR v2, and XBAP applications that target .NET Framework 4.x will be launched under CLR v4</td>
        </tr>
</table>

## More information
.NET Framework 4.6.2, .NET Framework 4.7, and .NET Framework 4.7.1 are also affected by this issue. A fix for these versions of .NET Frameworks will be released shortly. 
