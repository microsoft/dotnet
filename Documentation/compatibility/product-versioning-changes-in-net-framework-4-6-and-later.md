## Product versioning changes in the .NET Framework 4.6 and later versions

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
NotPlanned

### Change Description

Product versioning has changed from the previous releases of the .NET Framework, and particularly from the .NET Framework 4, 4.5, 4.5.1, and 4.5.2. 

The following are the detailed changes:

- The value of the `Version` entry in the `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full` key has changed to `4.6.xxxxx` for the .NET Framework 4.6 and its point releases, to `4.7.xxxxx` for the .NET Framework 4.7 and its point releases, and to `4.8.xxxxx` for .NET Framework 4.8. In the .NET Framework 4.5, 4.5.1, and 4.5.2, it had the format `4.5.xxxxx`.

- The file and product versioning for .NET Framework files has changed from the earlier versioning scheme of 4.0.30319.x to 4.6.X.0 for the .NET Framework 4.6 and its point releases, and to 4.7.X.0 for the .NET Framework 4.7 and its point releases, and to 4.8.X.0 for .NET Framework 4.8. You can see these new values when you view the file's Properties after right-clicking on a file.

- The <xref:System.Reflection.AssemblyFileVersionAttribute> and <xref:System.Reflection.AssemblyInformationalVersionAttribute> attributes for managed assemblies have Version values in the form 4.6.X.0 for the .NET Framework 4.6 and its point releases, 4.7.X.0 for the .NET Framework 4.7 and its point releases, and 4.8.X.0 for .NET Framework 4.8.


- In the .NET Framework 4.6 and later versions, the <xref:System.Environment.Version?displayProperty=nameWithType> property returns the fixed version string `4.0.30319.42000`. In the .NET Framework 4, 4.5, 4.5.1, and 4.5.2, it returns version strings in the format `4.0.30319.xxxxx`, where `xxxxx` is less than 42000 (for example, "4.0.30319.18010"). Note that we do not recommend application code taking any new dependency on the Environment.Version property.

For more information, see [How to: Determine which .NET Framework Versions Are Installed](~/docs/framework/migration-guide/how-to-determine-which-versions-are-installed.md).

- [ ] Quirked 
- [ ] Build-time break 

### Recommended Action
In general, applications should depend on the recommended techniques for detecting such things as the runtime version of the .NET Framework and the installation directory:

- To detect the runtime version of the .NET Framework, see [How to: Determine Which .NET Framework Versions Are Installed](~/docs/framework/migration-guide/how-to-determine-which-versions-are-installed.md).

- To determine the installation path for the .NET Framework, use the value of the `InstallPath` entry in the `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full` key.

> [!IMPORTANT]
> The subkey name is `NET Framework Setup`, not `.NET Framework Setup`.

- To determine the directory path to the .NET Framework common language runtime, call the <xref:System.Runtime.InteropServices.RuntimeEnvironment.GetRuntimeDirectory?displayProperty=nameWithType> method.

- To get the CLR version, call the <xref:System.Runtime.InteropServices.RuntimeEnvironment.GetSystemVersion?displayProperty=nameWithType> method. For the .NET Framework 4 and its point releases (the .NET Framework 4.5, 4.5.1, 4.5.2, and .NET Framework 4.6, 4.6.1, 4.6.2, 4.7, and 4.7.1), it returns the string v4.0.30319.

### Affected APIs
* Not detectable via API analysis

### Category
Setup and Deployment

<!-- breaking change id: 193 -->


