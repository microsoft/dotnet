# .NET Framework 4.8 Release Notes

.NET Framework release notes describe product improvements grouped by product area. Each change includes a Microsoft-internal VSTS bug ID, the primary binary that was updated and whether the change was a bug or a feature.

## ASP.NET

* Fix handling of InputAttributes and LabelAttributes for ASP.NET CheckBox control. [643614, System.Web.dll, Bug, Build:3646]
* Fixed a perf issue in HttpApplication instances pool in HttpApplicationFactory class. [639421, system.web.dll, Bug, Build:3673]
* Fixed NullReferenceException thrown from the page/control with only parameterized constructors with default values when targeting 4.7.2 [635479, System.Web.dll, Bug, Build:3673]
* Hardened ASP.NET application services against malicious JSON attacks [684132, System.Web.Extensions.dll, System.Web.dll, Bug, Build:3673]
* Fixed an issue with ValidationContext.MemberName when using custom DataAnnotation.ValidationAttribute. [563497, System.web.dll, Bug, Build:3694]
* Fixed ArgumentOutOfRangeException in MemoryCache when using change monitors with non-existent files east of GMT. [684136, System.Web.dll, Bug, Build:3694]
* Fix handling of multi-value HTTP headers that may affect multipart data processing. [684397, System.Web.dll, Bug, Build:3694]
* Fixed handling of multi-value HTTP headers that may affect multipart data processing. [726155, System.Web.dll, Bug, Build:3734]
* For client applications (winforms, WPF, or console apps, etc) the ASP.NET Client Application Services API’s have been hardened against potentially malicious JSON payloads. [727703, System.Web.dll, Bug, Build:3734]
* Fixed an issue introduced in ASP.NET 4.7, where the unexpected removal of a particular type of cache item can result in an orphaned *.delete file that prevents web applications from running. [750653, System.Web.dll, Bug, Build:3734]
* Fixed System.Web.Caching initialization bug when using ASP.NET cache on machines without IIS. [889110, System.Web.dll, Bug, Build 3928]

## BCL

* Fixed deserialization of Collections which uses culture aware StringComparer. [566534, mscorlib.dll, Bug, Build:3621]
* Fixed System.Runtime.CompilerServices.RuntimeFeature.IsSupported to correctly account for application compatibility quirk settings for the Portable PDB feature introduced in .NET Framework 4.7.1. [571206, mscorlib.dll, Bug, Build:3621]
* Fixed the exception by parsing Japanese dates that have the year number exceeding the number of years in that date era. The behavior change will be noticed only if someone tries to parse a date containing some era and year while the year exceeds the last year in that era. [590659, mscorlib.dll, Bug, Build:3621]
* Fixed the serialization compatibility issue for CultureAwareComparer class. [621387, mscorlib.dll , Bug, Build:3632]
* Upgraded the System.IO.Compression zlib (inside clrcompression.dll) to the latest zlib version 1.2.11 [532490, clrcompression.dll, Bug, Build:3646]
* Fixed by reducing memory  allocations in hashing with the CAPI classes (SHA256CryptoServiceProvider, et al) [548940, System.Core.dll, Bug, Build:3646]
* Fixed by reducing memory allocations in hashing with the CNG classes (SHA256Cng, et al) [548941, System.Core.dll, Bug, Build:3646]
* Fixed the issue of System.DateTime returning the wrong time after Windows processes a leap second, by following changes:
DateTime and DateTimeOffset will work with the leaps seconds reported by Windows 10, Version 1809 systems. DateTime.Now and DateTime.UtcNow will always be synchronized with the system time. 
DateTime and DateTimeOffset will never report the leap second as value 60, instead, it’ll always report it as 59. 
DateTime and DateTimeOffset operations will continue to work as it used to work, i.e. internally always handle the minutes as 60 seconds which make it compatible with the down levels platforms. [641206, mscorlib.dll, clr.dll, Bug, Build:3646]
* Fixed WCF de-serialization failure issue of CultureAwareComparer object. Fixed the issue where Applications using WCF to communicate with web services or applications using data contract serialization directly, were experiencing failures to deserialize the CultureAwareComparer object. [645084, mscorlib.dll, Bug, Build:3646]
* Reduced the impact of the "FIPS mode" bit being set in the OS [653796, mscorlib.dll;System.Core.dll, Bug, Build:3646]
* Changed default content encryption algorithm of EnvelopedCms to AES. [656518, System.Security.dll, Bug, Build:3646]
* Fixed GetECDsaPublicKey to work with brainpool curves. [586452, System.Core.dll, Bug, Build:3673]
* Reduced the number of object finalizations that occur as a result of using X509Certificate2 and related types. [654137, mscorlib.dll, System.dll, System.Security.dll, Bug, Build:3673]
* Fixed formatting of Japanese date with year 1 (as first year of any era), the date will be formatted using 元 character and not year number “1”.  Example of the new formatted date behavior: 平成元年11月21日compared to old formatted date behavior 平成1年11月21日 [670097, mscorlib.dll, Bug, Build:3673]
* Fixed default settings used by RsaProtectedConfigurationProvider (use AES instead of 3DES, RSA is now using 2048bit key, OAEP is on by default), fixed encryption with OAEP so that it writes correct metadata. [549418, System.Configuration.dll, Bug, Build:3694]
* By default, elevated processes will not read HKCU for managed COM activation information. [691317, clr.dll, Bug, Build:3694]
* Add API to obtain certificate thumbprints with a caller-specified digest algorithm. [700365, mscorlib.dll, Feature, Build:3694]
* Fixed an IndexOutOfRangeException thrown when asynchronously reading a process output with less than a character's worth of bytes is read at the beginning of a line. [724219, System.dll, Bug, Build:3707]
* Mitigate compatibility breaks seen in some System.Data.SqlClient usage scenarios. [727701, System.Configuration.dll, Bug, Build:3707]
* Fixed a serialization exception that occurred when a huge amount of objects were serialized with BinaryFormatter. [761576, mscorlib.dll, Bug, Build:3734]
* Added support for formatting the Japanese first year of era using Gannen 元 when the date pattern does not have single quotes around 年 (e.g., y年). [777279, mscorlib.dll, Bug, Build:3745]
* Changed the name of "Former Yugoslav Republic of Macedonia" to "North Macedonia" [802482, mscorlib.dll, Bug, Build:3761]


## ClickOnce

* Fixed Clickonce UI dialogs on high Dpi machines with scale set to more than 100% for both new and existing applications which scale upto 300%. In the scenario where user wants to see legacy images, there is an opt out switch "Switch.System.Windows.Forms.UseLegacyImages" that can be set to "true" in dfsvc.exe.config file. [389534, Microsoft.Build.Tasks.v4.0.dll, Bug, Build:3621]
* Fixed Mage so it can properly update the identity of dependent assemblies in ClickOnce application manifests. [534286, Microsoft.Build.Tasks.v4.0.dll, Bug, Build:3621]
* Fixed ClickOnce dialogs (Splash screen, Install progress dialog, Maintenance dialog and Update dialog) have accessibility issues as mentioned in this bug. Fix is for realigning control indices and setting accessible names where it was missing. [541886, Microsoft.Build.Tasks.v4.0.dll, Bug, Build:3621]
* Fixed progress bar alignment from Right to Left in Splash Screen and Download progress dialog for ARA & HEB languages for ClickOnce UI. Fixed RTL layout in the ClickOnce dialogs. Individual controls are to be set in RTL layout as this property is not propagated. Set this property explicitly on progress bar control. [552893, Microsoft.Build.Tasks.v4.0.dll, Bug, Build:3621]


## CLR

* Fixed LoadFrom(String, Byte[], AssemblyHashAlgorithm) works with SHA2 algorithms. [229901, mscorlib.dll, Bug, Build:3621]
* Reduced AsyncLocal memory overhead on value change. [470761, mscorlib.dll, Bug, Build:3621]
* Improved spin-waits in several synchronization primitives to perform better on Intel Skylake and more recent microarchitectures. [495945, mscorlib.dll, Bug, Build:3621]
* Fixed issues where incorrect values are sent to EventListeners. This includes incorrect activity ids on start and stop events and improper EventLevel values. [581072, mscorlib.dll, Bug, Build:3621]
* Fixed a potential crash with concurrent calls to a new dynamic method. [581154, mscorlib.dll, Bug, Build:3621]
* Fixed a possible deadlock when calling Dispose() on an EventSource. [597221, System.Core.dll, Bug, Build:3621]
* The ‘shadowCopyVerifyByTimestamp’ setting is now configurable for individual appdomains, as opposed to being a process wide setting. This helps in situations where you may not be the host process, but want to configure a new appdomain that verifys timestamps when shadow copying. [565570, clr.dll, Bug, Build:3632]
* Addressed the issue where the JIT compiler optimized away a call to the CompareExchange intrinsic operation under specific conditions [638227, clrjit.dll, Bug, Build:3646]
* CLR COM no longer returns E_INVALIDARG when marshalling a byref SafeArray from an Event Handler. [239541, WindowsBase.dll, Bug, Build:3673]
* Fixed a potential hang when a blocking GC is induced in low memory situations [374828, clr.dll, Bug, Build:3673]
* If you are using Server GC on a Skylake or later machine, you might notice that clr!SVR::t_join::join is taking a lot more CPU cycles. This is because clr!SVR::t_join::join uses the PAUSE instruction which takes a lot longer on Skylake+. This fix scales down the number of times it’s called when running on Skylake+ machine. [683269, clr.dll, Bug, Build:3673]
* Fixed an issue with the GC where frequent LOH under high memory pressure may result in premature OOM errors. [657730, clr.dll, Bug, Build:3694]
* Process corrupting exceptions in exception filter (like access violation) now result in aborting the current process. [110375, clr.dll, Bug, Build:3694]
* .NET now integrates with antimalware providers to scan assemblies loaded from byte arrays. [576558, clr.dll, Feature, Build:3694]
* Fixed an issue with missing Win32 resources in ReadyToRun images. [624174, crossgen.exe, Bug, Build:3694]
* Fixed an issue with ngen createpdb where passing in a long output folder could cause a crash. [627712, ngen.exe, Bug, Build:3694]
* Fixed a crossgen failure when compiling assemblies with no Win32 resources into ReadyToRun images. [722265, coreclr.dll, Bug, Build:3694]
* Fixed ability to handle process corrupted state exceptions stemming from Marshal.PtrToStructure on x86. [381677, clr.dll, Bug, Build:3707]
* Fixed intermittent access violation errors when Server GC interacts with type-forwarded value types implemented in mscorlib or other domain-neutral assemblies during garbage collection. [425626, clr.dll, Bug, Build:3707]
* Enabled a very obscure and uncommon usage pattern where FX Closure Walks are too expensive in the default domain. Introduced DeferFxClosureWalk (opt-in) switch that when set does the following things: 1) Disable DisableFxClosureWalk switch 2) When in LoaderOptimization.MultiHost, all assemblies are assumed sharable in the default domain and the closure walk is deferred as long as possible. This solution will provide good default domain performance and correctness. [485894, clr.dll, Bug, Build:3707]
* Fixed crashes that can occur when NGen'ed facade assemblies are loaded as multidomain-sharable.  [602785, clr.dll, Bug, Build:3707]
* Improved Monitor’s lock acquisition performance and scalability under a perpetual lock convoy. [602844, clr.dll, Bug, Build:3707]
* Fixed an issue that previously caused Ngen to run out of memory every time it executed due to registry corruption. [702519, mscorsvc.dll / mscorsvw.exe, Bug, Build:3707]
* Triggering a System.Threading.ThreadAbortException when System.Diagnostics.Debugger.s_triggerThreadAbortExceptionForDebugger is set to true. [732816, mscorlib.dll, Bug, Build:3707]
* Fix a crash on COM interop and properly return the hresult for the OOM. [733492, clr.dll, Bug, Build:3707]
* Prevents applications from COM activating managed types whose GUIDs mismatch the declared CLSID in the registry" [752205, clr.dll, Bug, Build:3734]
* Fixed deadlocks that could occur when loading exception stack traces in out-of-memory conditions. [748860, diasymreader.dll, Bug, Build:3734]
* Improved scalability of System.Threading.Timer. Previously System.Threading.Timer had a single global queue that was protected by a single process-wide lock. This can become a scalability problem if Timers are used frequently on multi-CPU machine. This change splits into N per-processor Queues as well as other improvements that improve the performance in a high-scale environment. For compatibility reasons this new code is not activated by default at the present time. It needs to be activated by using .NET Config variable ScalableTimer. [735923, clr.dll, mscorlib.dll, Bug, Build:3734]
```xml
<configuration>
  ...
  <runtime>
    <AppContextSwitchOverrides value=""Switch.System.Threading.UseNetCoreTimer=true""/>
  </runtime>
</configuration>
```
* Added an opt-in config option to disable spin-waiting for a critical section when contended. The change can be opted into in an <app>.exe.config file as follows: [754173, clr.dll, Bug, Build:3734]
```xml
<configuration>
  ...
  <runtime>
   <Crst_DisableSpinWait enabled=""1""/>
  </runtime>
</configuration>
```
* Fixed the output from the "!u -gcinfo" command in the SOS Debugging Extension [740360, sos.dll, Bug, Build:3734]
* Customers who are profiling their .NET Framework application will no longer experience leaks on their ICorProfilerCallback9 COM object as ICorProfilerCallback9 COM object is never freed in the destructor of EEToProfInterfaceImpl instance. [742282, clr.dll, Bug, Build:3734]
* Updated ICorProfilerInfo4::GetILToNativeMapping2 to respect the rejitID field and return the appropriate mapping. [748879, clr.dll, Bug, Build:3734]
* Fixed storing of instances to the mark stack so that the subsequent code that follows can operate by popping the stack. [750816, clr.dll, clrgc.dll, Bug, Build:3734]
* Fixed an issue in the JIT with the compilation of methods that use explicit tailcalls. This feature is never used by C# programs but can impact some F# programs. If you are developing an F# application, you may see incorrect results or program crashes. A workaround is to disable tailcalls or use a debug build of your F# program.   [754566, clrjit.dll, Bug, Build:3734]
* Fixed an issue that prevented call stacks from being displayed in the managed debugger during debugging of certain issues. [755544, clr.dll, Bug, Build:3761]
* Fixed an issue where Appdomain Resource Monitoring would not accurately report allocated bytes if it was enabled after process startup [824471, clr.dll, Bug, Build:3761]


## Networking

* Fixed a memory leak issue in HttpWebRequest when communicating with a HTTPS server through a proxy. [484621, System.dll, Bug, Build:3621]
* Fixed HTTP Status line parsing to be more tolerant of missing status description text in HTTP responses. [534936, System.dll, Bug, Build:3621]
* Fixed a NetworkInformation.NetworkChange deadlock scenario when there is a lock around NetworkChanged listener and user’s callback. [554780, System.Net.NetworkInformation.dll, System.dll, netstandard.dll, Bug, Build:3621]
* Fixed a deadlock scenario when ServicePoint.ConnectionLimit is updated and requests are sent at the same time. [528650, System.dll, Bug, Build:3673]
* Fix a race condition that would sometimes cause all of the connections to a server to stop sending HTTP requests. [499777, System.dll, Bug, Build:3694]
* Added the ability via the config file to specify opt-in performance caching of default credentials for Windows authentication for HTTP and SMTP APIs. [514209, System.dll, Bug, Build:3694]
* Added retry timer for PAC file discovery after failure. [567511, System.dll, Bug, Build:3694]
* Fixed handling of 1xx interim responses. [711440, System.dll, Bug, Build:3734]
* Fixed domain spoofing vulnerability in .NET Framework and .NET Core which causes the meaning of a URI to change when International Domain Name encoding is applied by disallowing certain Unicode characters during the IDN encoding process - CVE-2019-0657 [694688, System.Private.Uri, Bug, Build:3745]


## SQL

* Fixed the issue that SqlDataReader.ReadAsync() runs synchronously. Now the method runs asynchronously as expected. [594433, System.Data.dll, Bug, Build:3621]
* Fixed the issue while using SqlConnection.ConnectionString to set a null or empty connection string, an NRE exception will be thrown by the usage of the API in .Net Framework 4.7.2. [613944, System.Data.dll, Bug, Build:3621]
* Fixed the following issue relevant to SQL: while connecting to Azure SQL DB using .NET 4.7.2, using MultipleActiveResultSets=true in the connection string with System.Data.SqlClient.SqlConnection, async query operations sometimes lead to a bad TDS protocol request stream to be sent from the client, causing the Async Query APIs to fail connection string. [624283, System.Data.dll, Bug, Build:3632]
* Fixed a bug where SqlClient login may use an infinite timeout due to truncating a small millisecond timeout to zero when converting to seconds. [647908, System.Data.dll, Bug, Build:3646]
* This change provides an AppContext switch for making the default value of TransparentNetworkIPResolution false in SqlClient connection strings. [710778, System.Data.dll, Bug, Build:3694]


## WCF

* Fixed an accessibility problem in WCF Trace Viewer that caused ComboBox controls to be themed incorrectly in High Contrast themes. [424922, SvcTraceViewer.exe, Bug, Build:3621]
* Fixed the race-condition that exists in AsyncResult that closes a WaitHandle before Set() is called. When this happens, the process crashes with an ObjectDisposedException. [552736, System.ServiceModel.Internals.dll, Bug, Build:3621]
* Fixed race-condition when aborting connections which caused ObjectDisposedException to be thrown in CleanupChannelCollections. [586151, mscorlib.dll, Bug, Build:3621]
* Fixed a high lock contention issue when a large number of threads calling WCF serialization logic [570201, System.Runtime.Serialization.dll, Bug, Build:3646]
* ServiceHealthBehavior is a new service behavior (IServiceBehavior) for WCF services that exposes a “?health” endpoint.  This new behavior allows one to monitor the internal state of their WCF service and obtain specific HTTP response codes during those times that listeners become faulted, throttle capacities are reached, etc.  One can extend this behavior to further scope the health of their WCF services to match their own custom business rules and needs. [620852, System.Servicemodel.dll, Feature, Build:3694]
* Fixed a System.AccessViolationException due to accessing disposed X509Certificate2 instance in a rare race condition. The fix is to defer the service certificate cleanup to GC. The impacted scenario is WCF NetTcp bindings using reliable sessions with certificate authentication. Customer can opt-in to the fix by adding the follow AppSetting to the config file. Without this AppSetting set to true, existing services won’t be affected by this code change. :
  <appSettings>
    <add key=""wcf:deferSslStreamServerCertificateCleanup"" value=""true""/>
  </appSettings> [695709, System.Servicemodel.dll, Bug, Build:3694]
* Fixed a race condition with IIS hosted net.tcp services when the portsharing service is restarted which resulted in the service being unavailable. [695877, System.ServiceModel.WasHosting.dll, Bug, Build:3694]
* Fixed broken WCF document links in the tracing log that were broken due to MSDN doc location change. [712450, System.ServiceModel.dll, Bug, Build:3707]
* Fixed a security vulnerability in  SvcTraceViewer.exe associated with .stvproj file. *Microsoft would like to thank 9sg Security Team for their responsible disclosure of a remote information vulnerability in the .NET Framework. [728568, System.ServiceModel.dll, Bug, Build:3707]
* Made some format changes and added lang attribute to WCF service Health page (like http://localhost:83/Service1?health) and WCF service metadata page (like http://localhost:83/Service1) to improve accessibility. [777308, System.ServiceModel.dll, Bug, Build:3745]


## Windows Forms

* Maximize/Minimize button of new child Form are not scaled well on HDPI  devices because of image property set to not to scale. On 100% dpi machines scaling it not required but on high dpi devices, when scaling set to more than 100%, the images set for Maximize/Minimize boxes need to be scaled. [515092, System.Windows.Forms.dll, Bug, Build:3621]
* Checkbox height is changed from square to rectangle when scaled. Padding and margins were scaled, thus adding to already scaled height of the checkbox as we were using item height to draw checkbox instead of checkbox height. Earlier these margins/paddings were constants and ignorable pixel sizes, and were not visible. [528418, System.Windows.Forms.dll, Bug, Build:3621]
* The new UIA behavior for CheckedListBox control has been introduced: the first checkbox item in the CheckedListBox control is now announced by Narrator when focus moves to the control without any selected item. This change is effective in applications that were recompiled to target .NET Framework 4.8. [533226, System.Windows.Forms.dll, Bug, Build:3621]
* The new behavior for disabled link labels has been introduced: link labels' enable/disable state is now provided correctly - disabled links have IsEnabled = false Accessibility Property and read by Narrator as 'Some Link, disabled'. This change is effective in applications that were recompiled to target .NET Framework 4.8. [537224, System.Windows.Forms.dll, Bug, Build:3621]
* The new behavior for link label with defined link area has been introduced: link area accessible name is now read by Narrator as full text of the parent link label. This change is effective in applications that were recompiled to target .NET Framework 4.8. [537934, System.Windows.Forms.dll, Bug, Build:3621]
* Improved accessibility for the DateTimePicker control. In order for the application to benefit from these changes, the application should be recompiled to target .NET Framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. [543580, System.Windows.Forms.dll, Bug, Build:3621]
* An associated label name is now used as an accessible name for DateTimePicker control when AccessibleName property is not set. The default DateTimePicker's AccessibleRole is ComboBox now. These changes are effective in applications that were recompiled to target .Net Framework 4.8. [544791, System.Windows.Forms.dll, Bug, Build:3621]
* Fixed issues to add support for UIA live regions to WinForms. Added support for notifications about the Text property changes to the Label class (through UIA Live Regions). [545374, System.Windows.Forms.dll, Bug, Build:3621]
* Application Files' and 'Application Directory' label text is truncated on localized OSes. Developers will not be able to see the shortcut information for this control on the UI. This fix helps to resolve that issue and always show the full text of the label . [549024, System.Windows.Forms.dll, Bug, Build:3621]
* The new UIA behavior for numeric and domain up-down controls has been introduced: numeric and domain up-down controls without labels (custom UIA name) are announced by Narrator as 'spinners'. This change is effective in applications that were recompiled to target .NET Framework 4.8. [549543, System.Windows.Forms.dll, Bug, Build:3621]
* The new UIA behavior for CheckedListBox control has been introduced: an empty CheckedListBox control now has a focus rectangle drawn for a virtual first item when the control becomes focused. This change is effective in applications that were recompiled to target .NET Framework 4.8. [549558, System.Windows.Forms.dll, Bug, Build:3621]
* Improved ListView accessibility by enabling showing grey rectangle around the selected ListView item when parent ListView is out if focus. This change is effective in applications that were recompiled to target .NET Framework 4.8. [564762, System.Windows.Forms.dll, Bug, Build:3621]
* Fixed VisualStyle property in Winforms, is checking for supported values (by Winforms) and any value that goes outside of this range, Winforms throws an exception. Winforms also checks if the VisualStyle property set is supported by Winforms when it is using this property and does no-op if it is not supported. Underlying native method we use to set visual styles does not care what the value for visualstyle is being passed to it. Making this change will align Winforms code with windows and does not throw exception but still validate supported visual styles when using this property. Removing the validation condition while setting this property. [578093, System.Windows.Forms.dll, Bug, Build:3621]
* Fixed the DataGridView's Combobox expand/collapse state accessible for the customers who use assistive technologies. In order for the application to benefit from these changes, the application should be recompiled to target .NET Framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. For example:
    ```
    <?xml version=""1.0"" encoding=""utf-8""?>
    <configuration>
    <runtime>
        <!-- AppContextSwitchOverrides values are in the form of 'key1=true|false;key2=true|false  -->
        <!-- Enabling newer accessibility features (e.g. UseLegacyAccessibilityFeatures.2=false) requires all older accessibility features to be enabled (e.g. UseLegacyAccessibilityFeatures=false) -->
        <AppContextSwitchOverrides value=""Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=false""/>
    </runtime>
    </configuration>
    ```    
  In order for an application that targets .NET Framework 4.8 to opt out from this change, use the following combination of switches:
<AppContextSwitchOverrides value=""Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=true""/>. [574309, System.Windows.Forms.dll, Bug, Build:3621]
* Fixed and improved the stability of Live Regions feature by adding LiveSetting property setter check. This feature is available starting with Windows 10, version 1709.
In order for the application to benefit from these changes, the application should be recompiled to target .NET Framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file as seen in the example for Bug 574309. [583863, System.Windows.Forms.dll, Bug, Build:3621]
* Fixed by adding support for UIA notification event to Label and GroupBox classes. This feature is available starting with Windows 10, version 1709. In order for the application to benefit from these changes, the application should be recompiled to target .NET Framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file as seen in the example for Bug 574309. [563596, Windows.UI.Xaml.Automation.Peers.dll, Windows.dll, Bug, Build:3621]
* Fixed by adding support for the live region feature to the ToolStripStatusLabel class. In order for the application to benefit from these changes, the application should be recompiled to target .NET Framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file as seen in the example for Bug 574309. [564300,Windows.UI.Xaml.Automation.Peers.dll, Windows.dll, Bug, Build:3621]
* Fixed by improving the accessibility of DataGridView and ListView to make sort direction available via UIA: added exposing sort order and sort column via ItemStatus property and column name. This change is effective in applications that were recompiled to target .NET Framework 4.8. [549288, System.Windows.Forms.dll, Bug, Build:3621]
* Fixed by making the forward and backward toolstrip navigation consistent. This feature is available starting with Windows 10, version 1709. In order for the application to benefit from these changes, the application should be recompiled to target .NET Framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file as seen in the example for Bug 574309. [544592, System.Windows.Forms.dll, Bug, Build:3621]
* Fixed the announcement of DataGridView Read-only TextBox cells by making accessible and clear: editable TextBoxes are announced as 'editable' and read-only TextBoxes are announced as 'read-only'. This change is effective in applications that were recompiled to target .NET Framework 4.8. [599936, System.Windows.Forms.dll, Bug, Build:3621]
* Added support for UIA notification event to ProgressBar class. The feature is available starting with Windows 10, version 1709. [581351, System.Windows.Forms.dll, Bug, Build:3632]
* Fixed an issue where read-only Status for DataGridView TextBox column is not announced by Narrator. This change is effective in applications that were recompiled to target .NET framework 4.8. [599936, System.Windows.Forms.dll, Bug, Build:3632]
* Fixed reliability issues in Graphics class when used in RDP sessions. [627739, System.Drawing.dll, Bug, Build:3632]
* Fixed the issue of Narrator not announcing the updated value of ComboBox in PropertyGrid. 
Added support for UIA notification event to PropertyGrid. The feature is available starting with Windows 10, version 1709. Added screen reader announcement for PropertyGrid's ComboBox value changes. Added ComboBox's text field update in response of ComboBox selection changes.
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. App.config file content is shown below (in 642548). [508369, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed improper scaling of auto-sized controls when form is moved to secondary monitor with different DPI scaling. [515971, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed improper scaling of the System-style control's font on a Font-scaled form,  when Form is moved to a secondary monitor with different DPI scaling [519500, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed Checkbox and RadioButton control truncation issues control property is set to "FlatStyle". [519530, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed the improper scaling issue of auto-sized controls when form is moved to secondary monitor with different DPI scaling. All Controls (e.g. buttons) in the FlowLayout are placed into the first column with setting the AutoScroll property as True when DPI changed [525684, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed the WinForms control tooltip's issue where it does not appear when moving keyboard focus to the control
A control's tooltip is displayed now when a user uses a keyboard to focus the control.
This change is effective in applications that have Switch.System.Windows.Forms.UseLegacyToolTipDisplay value and either Switch.UseLegacyAccessibilityFeatures.3 value is set to false or application is built to target .NET version 4.8.  App.config file content is shown below (in 642548). [548792, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed font scaling issue when DPI changes. Winforms applications and controls, when enabled for "per-Monitor" Dpi awareness, are not scaled according to the DPI of the monitor (or device). Winforms apps, by default, behave like "System" DPI aware. This was causing Winforms applications/controls to be displayed blurry as a result of windows scaling them, and in some cases controls are either not scaled or scaled out of proportion.
Made changes on control level to respond to DPI change event (assuming  windows raise this event whenever there is a DPI change) and rescale controls according to the new DPI [597091, System.Windows.Forms.dll, Bug, Build:3646]
* Added support of Accessibility Invoke pattern to DataGridView Image cell with ability to invoke cell's default action. (in case Image cell is actually an image of a button)
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. App.config file content is shown below (in 642548). [615721, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed PropertyGrid control scaling issue in Winforms, when parent window DPI changed. PropertyGrid control in the .NET 4.8 runtime will now properly scale according to current running monitor DPI setting. Developer has to opt-in to this fix by either targeting to .NET 4.8 framework or using the .NET 4.8 opt-in config switch. [616661, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed Checkbox and RadioButton controls when set to 'FlatStyle' not being scaled on high Dpi monitors. [638326, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed DataGridView ComboBox accessible hierarchy. Introduced the support of ComboBox UIA notifications. The feature is available starting with Windows 10, version 1709.
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. 
In order for an application that targets .NET Framework 4.8 to opt out from this change, use the following combination of switches: <AppContextSwitchOverrides value=""Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=true""/>. [642548, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed RadioButton/ChecKBox controls truncation issue when control property is set to 'Flat/Popup style ' [645041, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed Button control to scale according to monitor Dpi on which the control is being displayed. [656271, System.Windows.Forms.dll, Bug, Build:3646]
* Improved loading/rendering time for windows forms controls.  [662839, System.Windows.Forms.dll, Bug, Build:3646]
* Fixed accessible hierarchy of WinForms DataGridView control to represent its currently editing control (inner cell TextBox or ComboBox) as a child of corresponding editing cell. Added support of UIA notifications to DataGridView control. [442899, System.Windows.Forms.Dll, Feature, Build:3673]
* A ToolStrip item's tooltip is displayed now when a user uses a keyboard to focus the ToolStrip item.
This change is effective in applications that have Switch.System.Windows.Forms.UseLegacyToolTipDisplay value and either Switch.UseLegacyAccessibilityFeatures.3 value is set to false or application is built to target .NET version 4.8. [549360, System.Windows.Forms.dll, Bug, Build:3673]
App.config file content example:
```xml
<configuration>
  ...
  <runtime>
    <!-- AppContextSwitchOverrides values are in the form of 'key1=true|false;key2=true|false  -->
    <!-- Enabling newer accessibility features (e.g. UseLegacyAccessibilityFeatures.2=false) requires all older accessibility features to be enabled (e.g. UseLegacyAccessibilityFeatures=false) -->
    <AppContextSwitchOverrides value=""Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=false;Switch.System.Windows.Forms.UseLegacyToolTipDisplay=false""/>
  </runtime>
</configuration>
```
* Fixed vulnerability that might lead to remote code execution. [598032, Winres.exe, Bug, Build:3673]
* Fixed DataGridView ComboBox accessible hierarchy. Introduced the support of ComboBox UIA notifications [642548, System.Windows.Forms.Dll, Bug, Build:3673]
* Fixed localizable UI Automation Provider name for DataGridView EditingPanel.
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. [654115, System.Windows.Forms.Dll, Bug, Build:3673]
* Fixed DataGridView not sortable column announcement and providing item status to prevent exposing 'Not sorted' info and just be silent regarding the sorting status for such columns. 
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. 
In order for an application that targets 4.8 to opt out from this change, use the following combination of switches:
<AppContextSwitchOverrides value=""Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=true""/> [661319, System.Windows.Forms.Dll, Bug, Build:3673]
* Fixed ToolStrip and MenuStrip control accessible hierarchy of inner menu/tool items. Enabled support of UI Automation notifications for ToolStrip and MenuStrip controls. In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file as seen in the example for Bug 549360. [497307, System.Windows.Forms.dll, Bug, Build:3694]
* The keyboard tooltips feature is "opt-in" now - it is no longer switched on implicitly when app targets .NET 4.8. "Switch.UseLegacyAccessibilityFeatures.3=false", which is a default value for .NET 4.8 apps, is still required by the feature. [686499, System.Windows.Forms.dll, Bug, Build:3694]
App.config file content example with enabled keyboard tooltips for apps targeting .NET 4.7.2 or older:
  ```<?xml version=""1.0"" encoding=""utf-8""?>
  <configuration>
    ...
    <runtime>
      <!-- Enabling newer accessibility features (e.g. UseLegacyAccessibilityFeatures.2=false) requires all older accessibility features to be enabled (e.g. UseLegacyAccessibilityFeatures=false) -->
      <AppContextSwitchOverrides value=""Switch.UseLegacyAccessibilityFeatures=false;Switch.UseLegacyAccessibilityFeatures.2=false;Switch.UseLegacyAccessibilityFeatures.3=false;Switch.System.Windows.Forms.UseLegacyToolTipDisplay=false""/>
    </runtime>
  </configuration>
  App.config file content example with enabled keyboard tooltips for apps targeting .NET 4.8:
  <?xml version=""1.0"" encoding=""utf-8""?>
  <configuration>
    ...
    <runtime>
      <AppContextSwitchOverrides value=""Switch.System.Windows.Forms.UseLegacyToolTipDisplay=false""/>
    </runtime>
  </configuration>
* Added per monitor DPI awareness support to ToolStrip and ToolStrip Items. [378542, System.Windows.Forms.dll, Bug, Build:3707]
* Fixed accessibility information about ComboBox DataGridView cell, including expanded/collapsed state of this cell. [657355, System.Windows.Forms.dll, Bug, Build:3707]
* Fixed providing accessibility information about ComboBox selected item: item selection is announced and accessible info is presented even the DropDownList is not opened and user selects the items using arrow keys. In ordr=er for the application to benefit from these changes, the application should explicitly opt-in into all accessibility app context switches in the app.config file as seen in the example for Bug 549360. [703373, System.Windows.Forms.dll, Bug, Build:3707] 
* Added per monitor DPI awareness support to the PropertyGrid. [719232, System.Windows.Forms.dll, Bug, Build:3707]
* Fixed a vulnerability in System.Windows.Forms.Clipboard APIs. [655431, System.Windows.Forms.dll, Bug, Build:3707] 
* Added Scroll UIA pattern to ListBox items in order to make the control accessible. [742319, System.Windows.Forms.dll, Bug, Build:3734]
* Fixed ColorEditor, ContentAlignmentEditor, CursporEditor to respond to DPI changed messages and made changes in FontEditor to always open in the 'SystemAware' mode even when the application is in "per-monitor" mode. [746634, System.Windows.Forms.dll, System.Drawing.Design.dll, Bug, Build:3734]
* Fixed providing correct accessibility information and correct accessible hierarchy of PropertyGrid control. [526702, system.windows.forms.dll, Bug, Build:3734]
* The screen reader announcement of the WinForms' Menu and ToolStrip expandable subitems has been fixed to not read in items' and scan mode the hidden (collapsed) subitems until corresponding parent Menu item/ToolStrip DropDown item is expanded. In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. [560840, System.Windows.Forms.dll, Bug, Build:3734]
* Fixed UI Automation provided accessibility of WinForms DataGridView ComboBox to have appropriate and consistent screen reader announcement for ComboBox interactions. The feature is available starting with Windows 10, version 1709. In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. [732559, System.Windows.Forms.Dll, Bug, Build:3734]  
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file.
* With the fix applied, SmartTags will work fine in VS on secondary monitor when PMA option is turned on. [754549, System.Windows.Forms.dll, Bug, Build:3761]
* With the fix applied, Menu control in WinForms designer can be edited using Narrator navigation - user is able to add Menu Strip items, MenuItem can be added as a child via navigation and ""Type Here"" placeholder for a new item can be announced.
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file as seen in the example for Bug 549360. [792793, System.Windows.Forms.dll, Bug, Build:3761]
* With the fix applied, Chart control meets high contrast standards. In high contrast regimen user is able to access information from Chart control's labels which colors are enough contrast now.
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. [826994, System.Windows.Forms.dll, Bug, Build:3761]
* With the fix applied, Chart control shows the focus indicator and can be focused using mouse. User is able to access information from Chart control more effectively using assistive technologies.
In order for the application to benefit from these changes, the application should be recompiled to target .NET framework 4.8 or the application should explicitly opt-in into all accessibility app context switches in the app.config file. [827003, System.Windows.Forms.dll, Bug, Build:3761]
* Grid error dialog in the property browser (of VS) doesn't support PMA mode yet. Hence, Fixed it to show up as “SystemAware” only dialog when the process is in PMV2 mode. This behavior may change in the future release. [827142, System.Windows.Forms.dll, Bug, Build:3761]
* Fixed the ability to select ComboBox edit field text using mouse down + move. [853381, System.Windows.Forms.dll, Bug, Build 3928]
* Fixed the issue with interaction between a WPF user control and the hosting WinForms app when processing keyboard input. [899206, WindowsFormsIntegration.dll, Bug, Build 3928]
* Fixed the issue with Narrator/NVDA announcing of PropertyGrid’s ComboBox expanding and collapsing action. [792617, System.Windows.Forms.dll, Bug, Build 3928]
* Fixed the issue with rendering “…” button of PropertyGrid control in HC mode to draw button background and dots contrasted. [792780, System.Windows.Forms.dll, Bug, Build 3928]


## WPF

* Fixed a memory leak arising when removing data items from their parent collections, when UIAutomation is present. [172291, PresentationFramework.dll, Bug, Build:3621]
* Fixed virtualizing ItemsControl hung during scrolling when Items collection contains duplicate value-typed objects. [360053, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF application can crash with NullReferenceException when changing a property used by a DataTrigger whose host element has been removed from the visual tree. The crash only occurs if the host element is garbage-collected during a small window of time during the property-change notification. [401484, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF app that has multiple top-level windows in different threads that crashes during a theme change. [404464, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF applications running on touch or stylus-enabled machines can sometimes hang at startup or during connection of a tablet or stylus device. [474688, PresentationFramework.dll, Bug, Build:3621]
* Fixed focus issues in WPF applications running in high contrast themes, it can be difficult to distinguish when a TextBox, PasswordBox, or RichTextBox has focus. [486957, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF applications using DocumentViewer controls may see issues with the rendering of text selection graphics after a theme change. This change addresses that issue. [494408, PresentationFramework.dll, Bug, Build:3621]
* In WPF applications running on touch or stylus-enabled machines that set the AppContext switch "Switch.System.Windows.Input.Stylus.EnablePointerSupport" to true, StylusPlugins would not be properly unhooked when element properties were changed prior to the presentation source being set to null. This change fixes this issue. [500125, PresentationFramework.dll, Bug, Build:3621]
* Fixed an issue that caused XAML Browser Applications (XBAP’s) targeting .NET 3.5 to sometimes load using .NET 4.x runtime incorrectly. [560029, PresentationHost_v0400.dll, Bug, Build:3621]
* Fixed an infinite loop arising during layout of a Grid in some cases when *-columns with MinSize constraints consume all the available space. [560609, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF applications running under high contrast themes, the border color of a disabled TextBox, RichTextBox, and PasswordBox was incorrect. This change addresses that issue. [527669, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF applications using non-adorner based text selection for TextBox and PasswordBox (Switch.System.Windows.Controls.Text.UseAdornerForTextboxSelectionRendering=false), developers may now set the SelectionTextBrush property in order to alter the rendering of the selected text. By default, this color changes with SystemColors.HighlightTextBrushKey. If non-adorner based text selection is not enabled, this property does nothing. [531137, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF application running in high contrast mode has difficult to see selection visuals on DataGridCells. This change addresses that issue. [545871, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF applications running on a touch or stylus-enabled machine, users might periodically see a crash in System.Windows.Window.GetWindowMinMax. This change addresses that issue. [546769, PresentationFramework.dll, Bug, Build:3621]
* Fixed a memory leak arising when sending bitmaps to the clipboard. [589759, PresentationCore.dll, Bug, Build:3621]
* Fixed WPF application running on a stylus or touch-enabled machine may see NullReferenceExceptions or InvalidCastExceptions under certain circumstances. This change addresses this issue. [577690, PresentationCore.dll, Bug, Build:3621]
* Fixed issue when non-Adorner-based text selection is enabled in .NET Framework 4.7.2 and above, the default SelectionOpacity of FlowDocumentReader, FlowDocumentScrollViewer, and SinglePageViewer will cause the selection to obscure the underlying text. This change addresses this issue by setting the default SelectionOpacity to the correct value. [568305, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF applications using non-adorner based text selection (AppContext flag "Switch.System.Windows.Controls.Text.UseAdornerForTextboxSelectionRendering=false"), editable ComboBoxes do not appropriately follow theme colors for text selection. [572332, PresentationFramework.dll, Bug, Build:3621]
* Fixed timing issues in the finalizer thread could potentially cause exceptions during AppDomain or process shutdown in certain .NET applications. This is generally seen in applications that do not correctly shut down Dispatchers running on worker threads prior to process or AppDomain shutdown. Such applications should take care to properly manage the lifetime of Dispatchers. This change adds an AppContext switch that can help alleviate (but not eliminate) some of the issues that may arise from these application design issues. To enable this, set the AppContext flag "Switch.MS.Internal.DoNotInvokeInWeakEventTableShutdownListener=true". [606492, WindowsBase.dll, Bug, Build:3621]
* Fixed crash issues and allows the replace to proceed.When replacing multiple characters with a single character (in a different language than replaced text) using IMEPad, WPF crashes. [595046, PresentationFramework.dll, Bug, Build:3621]
* Fixed WPF application that changes TreeView.IsEnabled and (at the same time) changes the underyling collection(s) can experience a spurious ElementNotAvailableException. [573999, PresentationFramework.dll, Bug, Build:3621]
* Addressed the issue of high CPU usage or hangs. This used to happen under certain conditions, where, WPF applications using WindowChromeWorker experience high CPU usage or hangs. . [437642, PresentationFramework.dll, Bug, Build:3632]
* Fixed a bug in the 4.7 algorithm for allocating sizes to *-rows in a Grid. In some cases (e.g. Grid with Height="Auto" containing empty rows), rows were arranged at the wrong position, possibly outside the Grid altogether. [590061, PresentationFramework.dll, Bug, Build:3632]
* Fixed a potential deadlock in WPF Packaging APIs when multiple threads were both creating and closing large packages simultaneously. [609850, PresentationCore.dll, WindowsBase.dll, Bug, Build:3632]
* Fixed incorrect result of pressing an arrow key when focus is on a Hyperlink within an item that is not the SelectedItem of the parent ItemsControl. [405208, PresentationFramework.dll, Bug, Build:3646]
* Fixed issue where internal class PriorityQueue<T> can return items in the wrong order. [442569, PresentationCore.dll, Bug, Build:3646]
* Fixed usage of resources internal to theme files to avoid potential conflicts. [494194, System.Windows.Controls.Ribbon.dll, Bug, Build:3646]
* Fixed an issue where automation properties set on an editable RibbonComboBox are not properly announced by screen readers or other assistive technologies. [520147, PresentationCore.dll, Bug, Build:3646]
* GridViews with focusable Header rows will now not experience keyboard focus landing on the padding column in the header. [559546, PresentationFramework.dll, Bug, Build:3646]
* Fixed Binding's incorrect use of IList indexer when the source object declares a custom indexer with the same signature  [585942, PresentationFramework.dll, Bug, Build:3646]
* Fixed the issues of certain bounding rectangles, not being drawn corrently. When WPF is run in Per-Monitor Aware mode, certain bounding rectangles around text are drawn incorrectly by Accessibility tools like Narrator. This fix addresses the problem. To opt-into this fix, the target framework version of the Application should be set to .NET 4.8. Alternatively, an AppContext switch - "Switch.UseLegacyAccessibilityFeatures.2" - can be overridden with the value "false" to enable the fix.  [617457, PresentationFramework.dll, Bug, Build:3646]
* Fixed a hang arising during layout of a Grid when UseLayoutRounding=true, high DPI is in effect, grid *-column widths are determined from children with ColumnSpan > 1, and floating-point roundoff is unfavorable. [619978, PresentationFramework.dll, Bug, Build:3646]
* Fixed an issue where re-entrant calls during shutdown could cause various application faults in WPF applications running on a touch or stylus enabled machine. [633620, PresentationCore.dll, PresentationFramework.dll, Bug, Build:3646]
* Fixed a memory leak arising when the number of TextBoxes drops to 0. [645497, PresentationFramework.dll, Bug, Build:3646]
* Fixed the DeadLock issue faced during creation of Spellchecker while Finalizer is ending another Instance. Under certain circumstances, WPF applications using the spell-checker that use custom dictionaries could throw unexpected excpetions and crash [646599, PresentationFramework.dll, Bug, Build:3646]
* Addressed the issue where GroupItem headers containing an Expander were not announced correctly by screen readers [646633, PresentationFramework.dll, Bug, Build:3646]
* Fixed WPF issue of not creating correctly-size rendertarget for mixed-mode child windows. Under certain circumstances, per-monitor DPI aware applications that host WPF based controls or plugins were not rendering the WPF window fully [646801, wpfgfx_v0400.dll, Bug, Build:3646]
* Addressed the restore issue of Window.Left & Window.Top. When WPF applications are running in per-monitor aware mode, saving the value of Window.Left and Window.Top at application end, and restoring the values to a Window prior to creation upon the next application launch, was not restoring the application to the same screen position where it was at the time the application was closed. [646803, PresentationFramework.dll; PresentationCore.dll;WindowsBase.dll, Bug, Build:3646]
* Fixed the issue where HwndHost does not adapt child-HWND sizing correctly during DPI changes. When WPF is run in Per-Monitor Aware mode, controls hosted within HwndHost were not sized correctly after DPI changes (for e.g., when moving applications from one monitor to another). This fix ensures that controls hosted so are sized appropriately [646805, PresentationFramework.dll;PresentationCore.dll;WindowsBase.dll, Bug, Build:3646]
* Fixed the issue of WPF Windows not scaling correctly. WPF windows that are parented under native HWND’s, including Windows Forms (using ElementHost), will correctly react to DPI changes and scale themselves appropriately when the dpiAwareness element in the application manifest is updated to “PerMonitorV2” value. [478267, PresentationCore.dll,wpfgfx_v0400.dll, Feature, Build:3673]
* Fixed a race condition where an external process (e.g. anti-virus scanner or search indexer) could block access to temporary files. [519951, PresentationCore.dll, PresentationFramework.dll, System.Speech.dll, Bug, Build:3673]
* Automation properties set on TextBoxes within a DatePicker are now announced correctly by 3rd-party screen readers. [619245, PresentationCore.dll, Bug, Build:3673]
* Improved reliability of WPF under certain situations and prevents hangs.[629025, wpfgfx_v0400.dll, Bug, Build:3673]
* Fixed a regression involving bindings to properties of type DataView or RelatedView.  In some cases the value gets GC'd prematurely, causing the bindings to sliently stop working. [636340, PresentationFramework-SystemData.dll, Bug, Build:3673]
* When WPF is run in Per-Monitor Aware mode, controls hosted within HwndHost are not sized correctly after DPI changes (for e.g., when moving applications from one monitor to another). This fix ensures that controls hosted so are sized appropriately. 
On .NET Framework Versions 4.7.2 and older, applications must opt in to enable the fix by setting the AppContext switch 
""Switch.System.Windows.DoNotUsePresentationDpiCapabilityTier2OrGreater"" to ""false"". This switch can be set either in the registry or in the application - see the documentation for AppContext (https://msdn.microsoft.com/en-us/library/system.appcontext(v=vs.110).aspx). [646805,  PresentationFramework.dll;PresentationCore.dll;WindowsBase.dll, Bug, Build:3673]
* Fixed an issue arising when refreshing a grouped collection view. While the groups are being rebuilt, they pass through a transient state where the subgroups are empty but the cached value for count still reports non-empty. A re-entrant call to get an item at a given index during this time will get ArgumentOutOfRangeException, even though index < count. [656948, PresentationFramework.dll, Bug, Build:3673]
* Fixed a crash due to TaskCanceledException that can occur during shutdown of some WPF apps. Apps that continue to do work involving weak events or data binding after Application.Run() returns are known to be vulnerable to this crash. [668328,WindowsBase.dll, Bug, Build:3673]
* Added support for ControllerFor UIAutomation property [503411, PresentationCore.dll, UIAutomationTypes.dll, Feature, Build:3694]
* Fixed an issue where focus loops inside a WPF UserControl instead of breaking out of it under some hosting scenarios. [542626, PresentationCore.dll, PresentationFramework.dll, WindowFormsIntegration.dll, Bug, Build:3694]
* Fixed an issue where dragging from a WPF application and dropping into an application that fails causes a crash in WPF. [685894, PresentationFramework.dll, Bug, Build:3694]
* Fixed a crash when using "live sorting" and NewItemPlaceholderPosition.AtBeginning at the same time. [387603, PresentationFramework.dll, Bug, Build:3694]
* Added support for SizeOfSet and PositionInSet UIAutomation properties, this change also provides defaults for some controls. [488213, PresentationCore.dll, PresentationFramework.dll, System.Windows.Controls.Ribbon.dll, UIAutomationClient.dll, UIAutomationTypes.dll, Feature, Build:3694]
* Scrolling panels now honor the system setting for mouse wheel to "scroll by screen". [586801, PresentationFramework.dll, System.Windows.Controls.Ribbon.dll, Bug, Build:3694]
* Tooltips now show underneath controls when keyboard focused, Ctrl+Shift+F10 dismisses/reshows tooltips. [614397, PresentationFramework.dll, System.Windows.Controls.Ribbon.dll, Feature, Build:3694]
* Improved the performance of rebuilding the automation tree of an items control (ListBox, DataGrid, etc.) in which grouping is enabled. [104559, PresentationCore.dll, PresentationFramework.dll, Bug, Build:3707]
* Fixed the behavior of automation Grid pattern in a ListView. [401080, PresentationFramework.dll, Bug, Build:3707]
* Fixed the automation tree exposed for a plain ItemsControl (as opposed to a derived class like ListBox, DataGrid, etc.). [410007, PresentationCore.dll, PresentationFramework.dll, Bug, Build:3707]
* Fixed an infinite loop that can arise when setting the height of ListBox (or other ItemsControl) to zero. [448747, PresentationFramework.dll, Bug, Build:3707]
* Fixed a reliability problem to reduce crashes with rapid window size changes when running in Software Rendering mode. [691364, wpfgfx_v0400.dll, Bug, Build:3707]
* Fixed a crash arising when Visual Studio's diagnostic tools are enabled to debug an app that has a ResourceDictionary whose Source points to invalid XAML. [727642, PresentationFramework.dll, Bug, Build:3707]
* Fixed a security vulnerability when pasting in WPF textboxes and in WPFs Clipboard APIs [678471, PresentationCore.dll, Bug, Build: 3707]
* Fixed a security vulnerability when pasting in WPF RichTextbox and InkCanvas [678477, PresentationFramework.dll, Bug, Build: 3707]
* Improved the memory allocation and cleanup scheduling behavior of the weak-event pattern. To opt-in to these improvements, set AppContext switches to 'true': Switch.MS.Internal.EnableWeakEventMemoryImprovements and Switch.MS.Internal.EnableCleanupSchedulingImprovements. [759824, WindowsBase.dll, PresentationFramework.dll, Bug, Build:3734]
* Fixed context menus and popups that are sometimes dismissed unexpectedly when shown for the first-time on a non-primary High-DPI monitor [732853, PresentationFramework.dll, PresentationCore.dll, Bug, Build:3734]
* Fixed a crash due to ElementNotAvailableException arising when scrolling and expanding/collapsing nodes in a TreeView with VirtualizationMode=Recycling, that changes its IsEnabled property while expanding nodes. This crash only occurs when there is a "partial automation client" running (and no full automation client); The chief example is running the app over RDP to a Win10 machine. [705448, PresentationCore.dll, Bug, Build:3734]
* Fixed a crash in WPF when displaying specific Unicode characters (Unicode codepoint 0xFDFD 47 times or more in a row) [725381, PresentationCore.dll, Bug, Build:3734]
* Fixed the construction of automation for an ItemsControl to avoid calling the control's IsItemItsOwnContainerOverride method. This avoids crashes in cases where the override has bugs [755174, PresentationCore.dll, PresentationFramework.dll, Bug, Build:3734]
* Fixed an issue arising when removing an item from a grouped collection view. Any groups that become empty are themselves removed, raising CollectionChanged events before the parent groups' counts have been fully updated. An event handler that calls back into the collection view can get ArgumentOutOfRangeException. [765355, PresentationFramework.dll, Bug, Build:3734]
* In .NET 4.8 Preview, WPF programs that create many RenderTargets (e.g. RenderTargetBitmap) can leak GDI handles and memory eventually resulting in an OutOfMemoryException from System.Windows.Media.Composition.DUCE+Channel.SyncFlush(). This was due to a COM reference cycle keeping render targets alive in the WPF renderer. Fixed this issue. [756618, wpfgfx_v0400.dll, Bug, Build:3734]
* Added an AppContext switch 'Switch.System.Windows.Controls.ItemsControlDoesNotSupportAutomation' that guards the fix for the automation tree under a plain ItemsControl (previously disclosed Bug 410007).  This switch defaults to 'false' for apps that target .NET 4.8, or to 'true' for apps that target earlier versions.   [778689, PresentationCore.dll, WindowsBase.dll, Bug, Build:3745]
* Fixed an accessibility issue when replacing an item in a collection with another item that compares as equal. [774503, PresentationFramework.dll, Bug, Build:3761]
* Added an AppContext switch Switch.System.Windows.Automation.Peers.ItemAutomationPeerKeepsItsItemAlive that opts-out of part of an earlier memory leak fix (172291) by changing ItemAutomationPeer's reference to its item from weak to strong. This re-introduces some of the leaks, but can fix problems in custom automation implementations that tactically assume a strong reference. For example, a custom automation peer (for an ItemsControl) that implements its own logic for re-using its item peers is likely to have a problem when an item X in the underlying collection is replaced by a "separate-but-equal" item X' - a different object where Object.Equals(X, X') is true. [801226, PresentationFramework.dll, Bug, Build:3761] 
* Fixed an issue involving bindings with DataContext explicitly on the binding path.  When DataContext changes to {DisconnectedItem}, the binding should not pass that value to user code like converters, property-change handlers, etc. [801039, PresentationFramework.dll, Bug, Build:3761]
* Fixed a handle leak during creation of a Window in WPF applications that are manifested for Per Monitor DPI V2 Awareness.  This leak could lead to extraneous GC.Collect calls that can impact performance in Window creation scenarios. [845699, PresentationFramework.dll, Bug, Build 3928]
* Fixed a regression caused by the bug fix involving bindings with DataContext explicitly on the binding path. [850536, PresentationFramework.dll, Bug, Build 3928]
* Fixed a crash due to an ArgumentNullException when loading a DataGrid containing a ComboBox while automation is active.  This might occur, for example, when navigating Visual Studio to the Text Editor\C#\Code Style\Naming page in Tools\Options. [801039, PresentationFramework.dll, Bug, Build 3928]


## WorkFlow

* We have modified the hashing algorithm used to generate XOML file checksums when building projects with XOML files. If this causes problems, the previous hashing algorithm can be used by specifying ""true"" for the following AppContext switch: Switch.System.Workflow.ComponentModel.UseLegacyHashForXomlFileChecksum. Note that this AppContext switch applies to the MSBuild process, so must be specified in the ""config path"" of the MSBuild.Exe that is used to perform the builds. [531054, System.Workflow.Runtime.dll, Bug, Build:3621]
* We have modified the hashing algorithm used to calculate keys to internal in-memory caches. If this causes problems, the previous hashing algorithm can be used by specifying ""true"" for the following AppContext switches: Switch.System.Workflow.Runtime.UseLegacyHashForWorkflowDefinitionDispenserCacheKey Switch.System.Workflow.Runtime.UseLegacyHashForSqlTrackingCacheKey. [532505, System.Workflow.Runtime.dll, Bug, Build:3621]
* Fixed default hashing algorithm that help debugging symbols has changed. If you encounter problems with breakpoints in the workflow designer not being hit when expected, you may have a mismatch of hashing algorithms between MSBuild and the project being debugged. The following AppContext switch can be specified for MSBuild.exe and the project being debugged to help alleviate the problem. Switch.System.Activities.UseLegacyHashForDebuggerSymbols If this switch has a value of ""true"", then the default hashing algorithm for pre-4.7.2 versions of .NET are used. If the value of the switch is ""false"", the newer default hashing algorithm is used. [537692, System.Workflow.Runtime.dll, Bug, Build:3621]
* Previously, under extreme usage conditions (high volume of connections to MSDTC), it was possible for a CriticalSection to be held by a single thread indefinitely, resulting in the need to restart the process. This problem has been resolved. In addition, some object caches that would help performance in multi-threaded scenarios were not taken advantage of correctly. This has been resolved. [540812, System.Workflow.Runtime.dll, Bug, Build:3621]
* Fixed an accessibility problem to enable connector label reading on workflow designer [604810, System.Activities.Presentation.dll, Bug, Build:3646]
* Fixed an accessibility problem to have more texts clearly visible on workflow designer. [613975, System.Activities.Presentation.dll, Bug, Build:3646]
* Fixed the StackOverflowException issue for larger nesting depth of XOML. Previosuly, if the object nesting depth in the XOML was large, there were possibilities to cause the process to encounter a StackOverflowException. These problems have been resolved. 
The maximum object nesting depth can be adjusted (default being 300) with the following AppSetting specification in the process that creates and invokes the WorkflowCompiler class:
<add key=""""microsoft:WorkflowComponentModel:XOMLMaximumNestedObjectDepth"""" value=""""n""""/>
Where n is the new maximum object nesting depth.
The possible issues like, random code execution during XOML deserialization (even when CheckTypes parameter is specified to the WorkflowCompiler), have been resolved [631082, System.Workflow.ComponentModel.dll, Bug, Build:3646]
* Fixed an accessibility problem that the warning icons on workflow activity designer is not accessible [407415, System.Activities.Presentation.dll, Bug, Build:3673]
* Fixed an accessibility problem to enable connector label reading on workflow designer [604810, System.Activities.Presentation.dll, Bug, Build:3673]
* Fixed a problem with Transaction.Current and remoting operations.
  In some .NET Remoting scenarios, when using TransactionScopeAsyncFlowOption.Enabled, it was possible to have Transaction.Current reset to null after a remoting call. Sometimes this was due to the remoting lease lifetime expiring while the remoting call was outstanding (pre 4.7.2). And sometimes this occurred when the remoting call did not leave the caller's AppDomain (with 4.7.2).
``This is now fixed for the latter case (remoting in the same AppDomain).
For the former case (lease lifetime expires), a new AppSetting for the configuration file has been introduced to allow the user to specify the lease lifetime of the object used for keeping track of Transaction.Current in the call context. The user should set this to the number of minutes of the longest expected remoting call.
The AppSetting looks like this:
<add key=""Transactions:ContextKeyRemotingLeaseLifetimeInMinutes"" value=""5""/>The value specifies the lease lifetime for the object, in minutes.`` [672774, System.Transactions.dll, Bug, Build:3673]
* Fixed an accessibility problem to have navigation information for ExpandAll/CollapseAll ToggleButtons on workflow designer. [682170, System.Activities.Presentation.dll, Bug, Build:3673]
* Previously Visual Studio builds of C# projects would create 3 temporary files and not clean them. With this change, the files are only created for C# projects that contain XAML files and utilize the XamlAppDef build action and those files are deleted with the Clean task. [392996, System.Workflow.Runtime.dll, Bug, Build:3694]
* Prevented vulnerabilities based on misuse of serialized ActivitySurrogateSelector.ObjectSurrogates. [726199, System.Workflow.ComponentModel.dll, Bug, Build:3707]
* Fixed a vulnerability in the WorkflowMarkupSerializer that allowed "random" code to be executed with certain XOML constructs.
If users experience application compatibility problems, there are couple of "opt-out" < appSettings> values that allow users to modify the behavior introduced by this change:
```xml
<add key="microsoft:WorkflowComponentModel:DisableXOMLSerializerTypeChecking" value="true"/>
```
Setting this value to "true" completely disables the type checking that is done during deserialization. It takes precedence over the value below.
```xml
<add key="microsoft:WorkflowComponentModel:DisableXOMLSerializerDefaultUnauthorizedTypes" value="true"/>
```
The type checker has a list of hard-coded types that are disallowed by default. Setting this value to "true" allows those hard-coded types. The user can specify a list of unauthorized types on their own by adding the following to the app.config file:
```xml
<configuration>
  <configSections>​
    <sectionGroup name="System.Workflow.ComponentModel.WorkflowCompiler" type="System.Workflow.ComponentModel.Compiler.WorkflowCompilerConfigurationSectionGroup, System.Workflow.ComponentModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35">​
      <section name="authorizedTypes" type="System.Workflow.ComponentModel.Compiler.AuthorizedTypesSectionHandler, System.Workflow.ComponentModel, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>​
    </sectionGroup>​
  </configSections>​

<System.Workflow.ComponentModel.WorkflowCompiler>
    <authorizedTypes>​
      <myAuthorizedTypes version="v4.0">​
        <authorizedType Assembly="System.Activities.Presentation, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Activities.Presentation" TypeName="WorkflowDesigner" Authorized="false"/>
      </myAuthorizedTypes>
    </authorizedTypes>​
  </System.Workflow.ComponentModel.WorkflowCompiler>​
</configuration>
```
In the above example, the type System.ActivitiesPresentation.WorkflowDesigner in the System.Activities.Presentation assembly is unauthorized because its "Authorized" value is "false". [735532, System.Workflow.ComponentModel.dll, Bug, Build:3745]
