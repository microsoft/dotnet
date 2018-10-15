.NET Framework - Troubleshooting RyuJIT
==========================================

This document provides instructions to disable RyuJIT or one of its optimizations. This is useful if you experience unexpected product behavior after installing .NET Framework 4.6 or later and want to determine if RyuJIT is the cause of that behavioral change. RyuJIT is only used for 64-bit processes. This document does not describe troubleshooting problems with the 32-bit JIT or 32-bit applications.

If you find a problem that appears to be a bug with the .NET JIT compiler, we want to know about it! Please report the bug at [Visual Studio Connect](https://connect.microsoft.com/VisualStudio) or as a [microsoft/dotnet issue](https://github.com/microsoft/dotnet/issues).

**Important** Follow these steps in this document carefully. Serious problems might be
occur if you modify the registry incorrectly. Before you modify it,
[back up the registry](http://support.microsoft.com/kb/322756) so that it can be  restored in case problems occur.

**Note** The registry methods below use either `HKEY_LOCAL_MACHINE` or `HKEY_CURRENT_USER`. Using `HKEY_LOCAL_MACHINE` makes the setting applicable to the entire machine and all users. Using `HKEY_CURRENT_USER` makes the setting applicable to just the current user.

In general, you should choose the least impactful option. Choose a per-application setting if possible, and only move to a per-user or per-machine setting if necessary. Note that per-application settings are not available for ASP.NET applications.

Disable RyuJIT
==============

**Note** For all these methods, all dynamic compilation is performed by the older
"legacy" JIT (sometimes known as JIT64). All NGEN compilation continues to use the new JIT, and all
existing NGEN images that have been compiled by the new JIT continue to be used.

### Method 1: per-application config file

Add the following text to the `<app>.exe.config` file. Create
  the indicated sections if they do not already exist.

  **Note** In this file name, `<app>` represents the actual name of the
  application. So, for example, for `MyApp.exe`, you will have `MyApp.exe.config`.

        <configuration>
          <runtime>
            <useLegacyJit enabled="1" />
          </runtime>
        </configuration>

  Note that Method 1 does not apply to ASP.NET websites; you cannot use this method in web.config files.
  
  This method is preferable as it is scoped to just one application.

  The string "useLegacyJit" is case-sensitive.

### Method 2: environment variable

Set the following environment variable:

        COMPLUS_useLegacyJit=1

  This method affects any environment that inherits this environment variable. This might be just a single
  console session, or it might affect the entire machine, if you set the environment variable globally.
  
  The environment variable name is not case-sensitive.

### Method 3: registry

Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then, add the following:

        Value name: useLegacyJit
        Type: DWORD (32-bit) Value (also called REG_WORD)
        Value: 1

  You can use the Windows REG.EXE tool to add this value from a command-line or scripting environment. For example:
  
        reg add HKLM\SOFTWARE\Microsoft\.NETFramework /v useLegacyJit /t REG_DWORD /d 1
  
  In this case, `HKLM` is used instead of `HKEY_LOCAL_MACHINE`. Use `reg add /?` to see help on this syntax.

  The registry value name is not case-sensitive.

Disable loading NGEN Images
===========================

If you encounter a bug when you use the new JIT, and if the bug manifests itself in a function in an NGEN native image (see [here](https://msdn.microsoft.com/en-us/library/6t9t5wcf(v=vs.110).aspx) for details), use any of the following methods to force certain named assemblies to be recompiled by the JIT and not use the existing native images. You will generally pair one of these methods with the same numbered method above to get an NGEN image to fall back to JIT compilation, and, in addition, do that JIT compilation with the legacy JIT.

In the examples below, we wish to prevent using the NGEN images of three assemblies, named `assembly_one.dll`, `assembly_two.dll`, and `assembly_three.dll`. We specify these assemblies using simple assembly names (no public key token, no architecture, and so on). The assembly names are specified without using the `.dll` file name extension.

### Method 1: : per-application config file

Add the following text to the `<app>.exe.config` file. Create
  the indicated sections if they do not already exist.

  **Note** In this file name, `<app>` represents the actual name of the application.

      <configuration>
        <runtime>
          <disableNativeImageLoad>
            <assemblyIdentity name="assembly_one" />
            <assemblyIdentity name="assembly_two" />
            <assemblyIdentity name="assembly_three" />
          </disableNativeImageLoad>
        </runtime>
      </configuration>

### Method 2: environment variable

Set the following environment variable:

        COMPLUS_DisableNativeImageLoadList=assembly_one;assembly_two;assembly_three

  **Note** This is a semicolon-delimited list of simple assembly names.

### Method 3: registry

Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then, add the following value:

        Value name: DisableNativeImageLoadList
        Type: String Value (also known as REG_SZ)
        Value: assembly_one;assembly_two;assembly_three

  **Note** This is a semicolon-delimited list of simple assembly names.

Disabling the use of all NGEN images
====================================

To prevent any NGEN native image from being used, and force all code to be compiled with the JIT compiler, you can use the ZapDisable configuration variable, as follows. You might choose to do this as an experiment, to see if any NGEN native image contains generated code that is inducing a bug in your application. Generally, if an NGEN native image does have a problem, and the identity of that native image can be determined, using one of the `DisableNativeImageLoadList` mechanisms described above is preferable.

**Note** This setting applies to both the 32-bit and 64-bit JIT. Thus, setting this globally will affect all 32-bit .NET applications as well. This is particularly true for **Method 2: environment variable**.

**Note 2** NGEN provides significant performance improvements to .NET applications. Disabling the use of NGEN may result in significantly slower application startup times.

### Method 1: per-application config file

Add the following text to the `<app>.exe.config` file. Create
  the indicated sections if they do not already exist.

  **Note** In this file name, `<app>` represents the actual name of the
  application. So, for example, for `MyApp.exe`, you will have `MyApp.exe.config`.

        <configuration>
          <runtime>
            <ZapDisable enabled="1" />
          </runtime>
        </configuration>

  Note that Method 1 does not apply to ASP.NET websites; you cannot use this method in web.config files.
  
  This method is preferable as it is scoped to just one application.

### Method 2: environment variable

Set the following environment variable:

        COMPLUS_ZapDisable=1

  This method affects any environment that inherits this environment variable. This might be just a single
  console session, or it might affect the entire machine, if you set the environment variable globally.
  
### Method 3: registry

Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then, add the following:

        Value name: ZapDisable
        Type: DWORD (32-bit) Value (also called REG_WORD)
        Value: 1

  **Note** Windows has both 32-bit and 64-bit registry sections. The addresses shown above use the 64-bit registry path, so they are appropriate for troubleshooting RyuJIT and not affecting 32-bit .NET applications. On a 64-bit machine, the 32-bit registry path for the `HKEY_LOCAL_MACHINE` case is `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\.NETFramework`.

Disable Tail Call Optimization
==============================

"Tail call" is a code pattern that the JIT compiler can sometimes optimize to improve code performance. You can see some discussion about JIT and tail call [here](http://blogs.msdn.com/b/clrcodegeneration/archive/2010/05/07/jit-etw-tail-call-event-fail-reasons.aspx). You can disable tail call optimization in RyuJIT with the following instructions.

* Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then, add the following value:

        Value name: TailCallOpt
        Type: String Value (also known as REG_SZ)
        Value: "0" (Double quotes are not required while entering the string value in Registry Editor)

**Note** This will disable tail call optimization of a function when the JIT is invoked to compile it. Note that if your application is NGEN compiled, the JIT is not invoked after the NGEN compilation has completed. To affect the code compiled for NGEN, you must first remove your application from the NGEN native image cache using `ngen uninstall MyApp`. Then, set the registry key shown here. Finally, optionally, you can re-NGEN your app using `ngen install MyApp.exe`.

Disabling all optimization of a function
========================================

If you determine that the JIT is incorrectly optimizing a particular function, you can selectively disable JIT optimization for that function by annotating that function with `MethodImplOptions.NoOptimization`. For example, in C#:

        using System.Runtime.CompilerServices;
        ...
        [MethodImplAttribute(MethodImplOptions.NoOptimization)]
        static int add(int a, int b)
        {
            return a + b;
        }

In this case, the annotated `add` function will not be optimized. You can see more detail about `MethodImplAttribute` 
[here](https://msdn.microsoft.com/library/system.runtime.compilerservices.methodimplattribute.aspx).

This is only effective in solving a code generation problem if the incorrect code being generated by the JIT is due to optimization, as opposed to being due to unoptimized code generation.

**Note** This method applies to all .NET JIT compilers.

Disabling optimization of all functions
=======================================

While troubleshooting, it might be useful to determine if *any* JIT optimization is causing problems. Instead of using the above `MethodImplAttribute` method above, you can set a single environment variable to disable all JIT optimization. Set this variable:

        COMPLUS_JitMinOpts=1

and run your application.

Note that when you run your application under the Visual Studio debugger, it might disable JIT optimization to improve the debugging experience. In Visual Studio 2013 and before, JIT optimization is disabled by default. In Visual Studio 2015, it is not disabled by default. The option in Visual Studio is called "Suppress JIT optimization on module load". You can read about that [here](https://msdn.microsoft.com/library/ms241594.aspx). Note that the MSDN documentation is incorrect about the Visual Studio 2015 default.

**Note** This method applies to all .NET JIT compilers.

Additional Notes
================

If you are examining the registry, you might find the following registry value:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\UseRyuJIT

We urge you not to change this value. Instead, use the RyuJIT fallback mechanisms detailed above in this document.
