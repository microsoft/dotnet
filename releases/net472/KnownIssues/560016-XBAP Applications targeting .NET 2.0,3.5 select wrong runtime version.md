# [|Known Issue Title|]
XBAP Applications targeting .NET 2.0/.NET 3.5 select wrong runtime (v4.0 CLR) instead of v2.0 CLR 

## Symptoms
[|Description of the symtopms|]
When a XAML Browser Application (XBAP) targeting .NET 2.0/.NET 3.5 is launched, it is loaded in CLR v4 incorrectly instead of being launched under CLR v2 as is expected. Along with the incorrect CLR, the .NET Framework libraries are also loaded from the latest version of .NET (.NET 4.x), and not .NET 3.5. Many XBAP's launch and work normally under CLR v4, but some XBAP's would fail. The failure-mode would be specific to the individual application and cannot be easily generalized. 

## Cause
[|Description of the root cause(s)|]

## Resolution
[|Description of the resolution|]
A fix will be released shortly for .NET 4.7.2 on Windows 10 Version 1804. .NET 4.7.2 on all other OS platforms already has this fix. 

The fix for this issue must be enabled by customers who have problems running XBAP Applications targeting .NET 2.0/3.5 under CLR v4. The fix can be enabled by setting the following registry keys: 


	Keys: 
		HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\Windows Presentation Foundation\Hosting (32-bit on 64-bit OS)
		HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\Windows Presentation Foundation\Hosting
	Value Name:	DoNotLaunchVersion3HostedApplicationInVersion4Runtime
		Value Kind: REG_DWORD 
		Values: 
			0, or value is absent (Default)	:	XBAP's targeting v2.0/3.5 and v4.x .NET Framework will be launched under CLR v4	
			1 (or any non-zero value)		:	XBAP's targeting v2.0/3.5 .NET Framework will be launched under CLR v2, and XBAP's targeting .NET Framework 4.x will be launched under CLR v4 

## More information
.NET 4.6.2, .NET 4.7, .NET 4.7.1 are also affected by this issue. A fix for these versions of .NET Framework will be released shortly. 
