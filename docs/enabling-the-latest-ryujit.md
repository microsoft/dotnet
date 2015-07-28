# How to enable a RyuJIT CTP

**Updated (July 2015)**: [RyuJIT](http://blogs.msdn.com/b/dotnet/archive/2015/07/20/announcing-net-framework-4-6.aspx#ryujit) has shipped! You can download it with the [.NET Framework 4.6](http://blogs.msdn.com/b/dotnet/archive/2015/07/20/announcing-net-framework-4-6.aspx#net-framework-46). There is no longer any need to install the RyuJIT CTP.

Download and install the latest [RyuJIT](http://aka.ms/RyuJIT) now.

RyuJIT only works on 64-bit editions of Windows Vista and Windows Server 2008 and later.

After installation, there are two ways to turn on RyuJIT. If you just want to enable RyuJIT for one application, set an environment variable: 

	set COMPLUS_AltJit=*

If you want to enable RyuJIT for your entire machine, set the registry key:

	HKLM\SOFTWARE\Microsoft\.NETFramework\AltJit
	Default (string) = "*"

Both registration methods cause the 64-bit CLR to use the latest RyuJIT instead of the built-in JIT, either JIT64 in the case of .NET Framework 4.5.1 and 4.5.2 or an earlier version of RyuJIT in the case of the .NET Framework 4.6. You can remove these settings at any time and you'll return to using the built-in JIT.
 
## Known Gotchas

1. **No NGen Support**. RyuJIT doesn't change NGen on your system. we wanted to keep the CTP install clean
2. **No Edit & Continue**. If you enable RyuJIT while writing code, you'll find that Edit & Continue doesn't work on 64-bit. One work around is disable RyuJIT while debugging.

## Contact a Human

If you have questions or problems contact us at <ryujit@microsoft.com>.