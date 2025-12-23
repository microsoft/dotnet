## New 64-bit JIT compiler in the .NET Framework 4.6

### Scope
Edge

### Version Introduced
4.6

### Source Analyzer Status
NotPlanned

### Change Description
Starting with the .NET Framework 4.6, a new 64-bit JIT compiler is used for just-in-time compilation. In some cases, an unexpected exception is thrown or a different behavior is observed than if an app is run using the 32-bit compiler or the older 64-bit JIT compiler. This change does not affect the 32-bit JIT compiler.

The known differences include the following:

- Under certain conditions, an unboxing operation may throw a <xref:System.NullReferenceException> in Release builds with optimization turned on.
- In some cases, execution of production code in a large method body may throw a <xref:System.StackOverflowException>.
- Under certain conditions, structures passed to a method are treated as reference types rather than as value types in Release builds. One of the manifestations of this issue is that the individual items in a collection appear in an unexpected order.
- Under certain conditions, the comparison of <xref:System.UInt16> values with their high bit set is incorrect if optimization is enabled.
- Under certain conditions, particularly when initializing array values, memory initialization by the <xref:System.Reflection.Emit.OpCodes.Initblk?displayProperty=nameWithType> IL instruction may initialize memory with an incorrect value. This can result either in an unhandled exception or incorrect output.  
- Under certain rare conditions, a conditional bit test can return the incorrect <xref:System.Boolean> value or throw an exception if compiler optimizations are enabled.  
- Under certain conditions, if an `if` statement is used to test for a condition before entering  a `try` block and in the exit from the `try` block, and the same condition is evaluated in the `catch` or `finally` block, the new 64-bit JIT compiler removes the `if` condition from the `catch` or `finally` block when it optimizes code. As a result, code inside the `if` statement in the `catch` or `finally` block is executed unconditionally.  
  

- [X] Quirked
- [ ] Build-time break

### Recommended Action
**Mitigation of known issues** <br/>   
If you encounter the issues listed above, you can address them by doing any of the following:  
  
- Upgrade to the .NET Framework 4.6.2. The new 64-bit compiler included with the .NET Framework 4.6.2 addresses each of these known issues.  
- Ensure that your version of Windows is up to date by running Windows Update. Service updates to the .NET Framework 4.6 and 4.6.1 address each of these issues except the <xref:System.NullReferenceException> in an unboxing operation.  
- Compile with the older 64-bit JIT compiler. See the **Mitigation of other issues** section for more information on how to do this.  
  
**Mitigation of other issues** <br/> 
If you encounter any other difference in behavior between code compiled with the older 64-bit compiler and the new 64-bit JIT compiler, or between the debug and release versions of your app that are both compiled with the new 64-bit JIT compiler, you can do the following to compile your app with the older 64-bit JIT compiler:  
  
- On a per-application basis, you can add the [\<useLegacyJit>](~/docs/framework/configure-apps/file-schema/runtime/uselegacyjit-element.md) element to your application's configuration file. The following disables compilation with the new 64-bit JIT compiler and instead uses the legacy 64-bit JIT compiler.  
  
   ```xml  
   <?xml version ="1.0"?>  
   <configuration>  
      <runtime>  
         <useLegacyJit enabled="1" />  
      </runtime>  
   </configuration>  
   ```  
  
- On a per-user basis, you can add a `REG_DWORD` value named `useLegacyJit` to the `HKEY_CURRENT_USER\SOFTWARE\Microsoft\.NETFramework` key of the registry. A value of 1 enables the legacy 64-bit JIT compiler; a value of 0 disables it and enables the new 64-bit JIT compiler.  
- On a per-machine basis, you can add a `REG_DWORD` value named `useLegacyJit` to the `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework` key of the registry. A value of `1` enables the legacy 64-bit JIT compiler; a value of `0` disables it and enables the new 64-bit JIT compiler.  
  
You can also let us know about the problem by reporting a bug on [Microsoft Connect](https://connect.microsoft.com/VisualStudio).  

### Affected APIs
* Not detectable via API analysis

### Category
JIT

<!-- breaking change id: 187 -->

