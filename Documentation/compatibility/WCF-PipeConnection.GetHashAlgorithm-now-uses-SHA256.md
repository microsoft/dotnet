##WCF PipeConnection.GetHashAlgorithm now uses SHA256

###Scope
Minor
###Version Introduced
.NET Framework 4.7.1
###Source Analyzer Status
NotPlanned
###Change Description
In .NET Framework 4.7 and earlier versions, WCF generated random NamedPipe names by creating a SHA1 hash.  Starting with .NET 4.7.1, WCF will use a SHA256 to generate the name for the NamedPipe.
###Recommended Action:
If you run into compatibility issue with this change on .Net 4.7.1 or later version, you may opt-out the change by adding the following configuration in App config file:

    <configuration>
	    <runtime>
		    <AppContextSwitchOverrides value="Switch.System.ServiceModel.UseSha1InPipeConnectionGetHashAlgorithm=true" />
		</runtime> 
	</configuration>

  
##Affected APIs
* Not detectable via API analysis

<!--
    ### Original Bug
    [395685] (https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=395685)
    -->

