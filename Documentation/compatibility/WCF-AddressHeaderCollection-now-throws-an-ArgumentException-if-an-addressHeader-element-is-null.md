##WCF AddressHeaderCollection now throws an ArgumentException if an addressHeader element is null

###Scope
Minor
###Version Introduced
.NET Framework 4.7.1
###Source Analyzer Status
NotPlanned
###Change Description
In .NET Framework 4.7 and earlier versions, there is a bug in one of the public constructors of AddressHeaderCollection where elements of the IEnumerable argument aren’t checked for null. Starting with .NET 4.7.1 the public constructor of AddressHeaderCollection(IEnumerable<AddressHeader> addressHeaders) now throws an ArgumentException if one of the elements is null.
###Recommended Action:
If you run into compatibility issue with this change on .Net 4.7.1 or later version, you may opt-out the change by adding the following configuration in App config file:

    <configuration>
	    <runtime>
		    <AppContextSwitchOverrides value="Switch.System.ServiceModel.DisableAddressHeaderCollectionValidation=true" />
		</runtime> 
	</configuration>

  
##Affected APIs
* Not detectable via API analysis

<!--
    ### Original Bug
    [275879] (https://devdiv.visualstudio.com/web/wi.aspx?pcguid=011b8bdf-6d56-4f87-be0d-0092136884d9&id=275879)
    -->