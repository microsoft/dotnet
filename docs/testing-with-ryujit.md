.NET Framework 4.6 - Troubleshooing RyuJIT
==========================================

The [.NET Framework 4.6](http://blogs.msdn.com/b/dotnet/archive/2015/07/20/announcing-net-framework-4-6.aspx#net-framework-46) includes a new Just-In-Time (JIT) compiler for 64-bit processes, called RyuJIT. It is enabled by default. Note that the 32-bit JIT in .NET Framework 4.6 is not significantly changed from previous releases. This document does not describe troubleshooting problems with the 32-bit JIT.

This document provides instructions to disable RyuJIT or one of its optimizations. This is useful if you experience unexpected product behavior after installing .NET Framework 4.6 and want to determine if RyuJIT is the cause of that behavioral change.

If you find a problem that appears to be a bug with the .NET JIT compiler, we want to know about it! Please report the bug here: https://connect.microsoft.com/VisualStudio.

**Important** Follow the steps in this document carefully. Serious problems might
occur if you modify the registry incorrectly. Before you modify it,
[back up the registry](http://support.microsoft.com/kb/322756) for restoration
in case problems occur.

**Note** The registry methods below use either `HKEY_LOCAL_MACHINE` or `HKEY_CURRENT_USER`. Using `HKEY_LOCAL_MACHINE` makes the setting applicable to the entire machine and all users. Using `HKEY_CURRENT_USER` makes the setting applicable to just the current user. If using the registry methods, the latter is generally preferable.

Disable RyuJIT
==============

**Note** For all these methods, all dynamic compilation is performed by the older
"legacy" JIT (sometimes known as JIT64). All NGEN compilation continues to use the new JIT, and all
existing NGEN images that have been compiled by the new JIT continue to be used.

* **Method 1: per-application config file**. Add the following text to the `<app>.exe.config` file. Create
  the indicated sections if they do not already exist.

  **Note** In this file name, `<app>` represents the actual name of the
  application. So, for example, for `MyApp.exe`, you will have `MyApp.exe.config`.

        <configuration>
          <runtime>
           <useLegacyJit enabled="1">
          </runtime>
        </configuration>

  Note that Method 1 does not apply to ASP.NET websites; you cannot use this method in web.config files.
  
  This method is preferable as it is scoped to just one application.

* **Method 2: environment variable**. Set the following environment variable:

        COMPLUS_useLegacyJit=1

  This method affects any environment that inherits this environment variable. This might be just a single
  console session, or it might affect the entire machine, if you set the environment variable globally.
  
* **Method 3: registry**. Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then, add the following:

        Value name: useLegacyJit
        Type: DWORD (32-bit) Value (also called REG_WORD)
        Value: 1

Disable loading NGEN Images
===========================

If you encounter a bug when you use the new JIT, and if the bug manifests itself
in an NGEN image, use any of the following methods to force certain named
assemblies to be recompiled by the JIT and not use the existing native images. You
will generally pair one of these methods with the same numbered method above to get an NGEN image
to fall back to JIT compilation, and, in addition, do that JIT compilation with the legacy
JIT.

In the examples below, we wish to prevent using the NGEN images of three assemblies, named
`assembly_one.dll`, `assembly_two.dll`, and `assembly_three.dll`. We specify the assemblies
using simple assembly names (no public key token, no architecture, and so on). The assembly names
are specified without using the `.dll` file name extension.

* **Method 1: : per-application config file**. Add the following text to the `<app>.exe.config` file. Create
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

* **Method 2: environment variable**. Set the following environment variable:

        COMPLUS_DisableNativeImageLoadList=assembly_one;assembly_two;assembly_three

  **Note** This is a semicolon-delimited list of simple assembly names.

* **Method 3: registry**. Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then, add the following value:

        Value name: DisableNativeImageLoadList
        Type: String Value (also known as REG_SZ)
        Value: assembly_one;assembly_two;assembly_three

  **Note** This is a semicolon-delimited list of simple assembly names.
  
Disable Tail Call Optimization
==============================

You can disable tail call optimization in RyuJIT with the following instructions.

* Using Registry Editor (regedit.exe), find either of the following subkeys:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
        HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework

  Then, add the following value:

        Value name: TailCallOpt
        Type: String Value (also known as REG_SZ)
        Value: "0" (Double quotes are not required while entering the string value in Registry Editor)

Disabling optimization of a function
====================================

You can selectively disable JIT optimization of a particular function by annotating that function with `MethodImplOptions.NoOptimization`. For example, in C#:

        using System.Runtime.CompilerServices;
        ...
        [MethodImplAttribute(MethodImplOptions.NoOptimization)]
        static int add(int a, int b)
        {
            return a + b;
        }

In this case, the annotated `add` function will not be optimized. You can see more detail about `MethodImplAttribute` 
[here](https://msdn.microsoft.com/en-us/library/system.runtime.compilerservices.methodimplattribute(v=vs.110).aspx).

Note that this method applies to all .NET JIT compilers.

Additional Notes
================

If you are examining the registry, you might find the following registry value:

        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\UseRyuJIT

We urge you not to change this value. Instead, use the RyuJIT fallback mechanisms detailed above in this document.
