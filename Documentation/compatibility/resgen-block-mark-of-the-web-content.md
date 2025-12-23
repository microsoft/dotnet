## Resgen refuses to load content from the web

### Scope
Edge

### Version Introduced
4.7.2

### Source Analyzer Status
NotPlanned

### Change Description
.resx files may contain binary formatted input. If you attempt to use resgen to load a file that was downloaded from an untrusted location, it will fail to load the input by default.

- [x] Quirked
- [x] Build-time break

### Recommended Action
Resgen users who require loading binary formatted input from untrusted locations can either remove the mark of the web from the input file or apply the opt-out quirk.

Add the following registry setting to apply the machine wide opt-out quirk:
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\SDK]
"AllowProcessOfUntrustedResourceFiles"="true"

### Category
Core

<!--
    ### Original Bug
    https://devdiv.visualstudio.com/DevDiv/_workitems/edit/610047
-->


