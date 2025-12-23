# SGEN crashes trying to load the System.IO.Compression.FileSystem reference assembly

## Symptoms

When building an application that uses the [XML Serializer Generator Tool (SGen.exe)](https://docs.microsoft.com/en-us/dotnet/standard/serialization/xml-serializer-generator-tool-sgen-exe), you get an error similar to this one:

```
An attempt was made to load an assembly with an incorrect format: C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.7.1\Facades\System.IO.Compression.ZipFile.dll. 
```

## Cause

.NET Framework 4.7.1 includes a few new assemblies in order to support .NET Standard 2.0. 
For those assemblies, we added entries in a .NET Framework unification table to ensure that assemblies with different versions will correctly unify to a single one. 
For the `System.IO.Compression.FileSystem` the information captured in the unification table is incorrect. 

This causes the assembly to not be correctly unified by the .NET Framework and in turn causes SGEN to give out that error.

## Impact

This problem occurs when building the applications that use the SGEN tool.

## Workaround

Add the following targets to the project that is experiencing this issue. 
The targets remove the reference assemblies from the ReferencePath set that SGEN uses before the serialization assemblies are produced and adds them back after they are produced.

```xml
<Target Name="RemoveDesignTimeFacadesBeforeSGen" BeforeTargets="GenerateSerializationAssemblies">
  <ItemGroup>
    <DesignFacadesToFilter Include="System.IO.Compression.ZipFile" />
    <_FilterOutFromReferencePath Include="@(_DesignTimeFacadeAssemblies_Names->'%(OriginalIdentity)')" 
        Condition="'@(DesignFacadesToFilter)' == '@(_DesignTimeFacadeAssemblies_Names)' and '%(Identity)' != ''" /> 
    <ReferencePath Remove="@(_FilterOutFromReferencePath)" />
  </ItemGroup>
  <Message Importance="normal" Text="Removing DesignTimeFacades from ReferencePath before running SGen." /> </Target>
 
<Target Name="ReAddDesignTimeFacadesBeforeSGen" AfterTargets="GenerateSerializationAssemblies">
  <ItemGroup>
    <ReferencePath Include="@(_FilterOutFromReferencePath)" />
  </ItemGroup>
  <Message Importance="normal" Text="Adding back DesignTimeFacades from ReferencePath now that SGen has ran." />
</Target>
```

## Resolution

This problem is fixed in [.NET Framework 4.7.2](http://go.microsoft.com/fwlink/?LinkId=863281).
