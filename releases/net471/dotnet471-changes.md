# .NET Framework 4.7.1 Release Notes

.NET Framework release notes describe product improvements grouped by product area. Each change includes a Microsoft-internal VSTS bug ID, the primary binary that was updated and whether the change was a bug or a feature.

## ASP.NET

* Fixed the scenario where ASP.NET's custom errors feature does not work if the URL being requested contains a filesystem reserved keyword. [217022, System.Web.dll, Bug]
* Fixed the scenario where the content-type header is not set in the response if HttpResponse.Redirect is called before executing handler. [360276, system.web.dll, bug]
* Fixed leaking cache items in System.Runtime.MemoryCache when multiple threads race to add an item with the same ID. [388335, System.Runtime.Caching.dll, Bug]
* Fixed an accessibility problem to have consistent identification for table items. [449101, System.Web.Extensions.Design.dll, Bug]
* Fixed spurious xhtml5 warnings in Visual Studio for web forms application development. [450875, System.Web.Extensions.dll, Bug]
* Fixed bug with absolute expiration time when using System.Web.Caching.Cache.Insert(). [453771, System.Web.dll, Bug]
* Fixed accessibility problem where a visually impared user can have less difficulty in identifying property grid entries in high contrast mode for property headers. [459055, System.Web.Extensions.Design.dll, Bug]
* ASP.NET developers now can use this public API to parse a string from SetCookie header to a HttpCookie object:
   ```csharp
   static bool HttpCookie.TryParse(string s, out HttpCookie result) [402902, System.Web.dll, Feature]
   ```
* Added support for SHA-2 hash algorithms for ASP.NET Forms Authentication password format. [405231, System.Web.dll, Feature]
* HttpApplication.OnExecuteStep provides extensibility to ASP.NET pipeline to make it easy for developers to implement features in ambient context pattern and build libraries that cares about ASP.NET execution flow. [406437, System.Web.dll, Feature]

## BCL

* Fixed a race condition in resource manager which leads to multiple CultureInfo getting created and presented to the client code. This is also fixed in .NET Core -  [dotnet/coreclr #8656](https://github.com/dotnet/coreclr/pull/8656)  [99146, mscorlib.dll, Bug]
* Improved reliability of Parallel.For on x86 systems. [99779, mscorlib.dll, Bug]
* Fixed an issue where two threads attempting to load the same assembly may crash the process. [211676, mscorlib.dll, Bug]
* Fixed an issue in ReaderWriterLockSlim where an attempt to enter a write lock that times out does not release waiting attempts to acquire read or upgradeable read locks [216022, System.Core.dll, Bug]
* Improved performance of AesCng and TripleDESCng with in-memory keys. [271987, System.Core.dll, Bug]
* Improved performance in NamedPipeClientStream Connect area.  [288338, System.Core.dll, Bug]
* Removed an unnecessary line break in the exception text in Russian locale. [299044, mscorlib.dll, Bug]
* Fixed a performance issue with Task.WhenAny. When a task was repeatedly used in Task.WhenAny, the performance of WhenAny may have degraded over time. [372594, mscorlib.dll, Bug]
* Fixed Access Violation problem in ComCallUnmarshal::UnmarshalInterface. [380021, mscorlib.dll, Bug]
* Updated SignedXML and SignedCMS to use SHA256 as a default over SHA1. SHA1 may still be used by selected as a default by enabling a context switch. [397307, System.Security.dll, Bug]
* Updated SignedXML and SignedCMS to use SHA256 as a default over SHA1. SHA1 may still be used by selected as a default by enabling a context switch. [397641, System.Security.dll, Bug]
* Fixed a bug introduced in .NET 4.6.2 that caused RSACng and DSACng to not be usable in Partial Trust scenarios [400499, System.Core.dll, Bug]
* Fixed a bug in ETW rundown that hung the process. [409381, mscorlib.dll, Bug]
* Added a switch to SignedXML to use the certificates PublicKey.Key property instead of GetAnyPublicKey. [432261, System.Security.dll, Bug]
* When tasks are awaited on background threads that have a DispatcherQueue associated with them, the continuations for the tasks will now be posted on the same thread via the DispatcherQueue. [437118, mscorlib.dll, Bug]
* Enable support for .NET Standard 2.0 in .NET 4.7.1. [404774, mscorlib.dll, Feature]
* Added IsReadOnlyAttribute to System.Runtime.CompilerServices [407211, mscorlib.dll, Feature]
* Added helper method to describe features supported by the runtime. [407212, mscorlib.dll, Feature]
* Added an attribute System.Runtime.CompilerServices.IsRefLikeAttribute [429642, mscorlib.dll, Feature]
* Enabled interop between StorageFile / StorageFolder and .NET types for filesystem access [433898, mscorlib.dll, Feature]
* System.Runtime.CompilerServices.RuntimeFeature.IsSupported allows to check whether the runtime supports displaying source line information for stack frames in assemblies built with portable symbols (PDBs). This is common for libraries that are built targeting .Net standard. [436315, mscorlib.dll, Feature]
* During the .NET Standard 2.0 work a type was missed because of a mismatch between the contracts we have in the full .NET Framework and the ones we shipped as part of .NET Standard 1.*. [468256, System.Net.NetworkInformation.dll, Bug]

## CLR

* Managed threads that exit don't get finalized until a GC of an appropriate generation is triggered. Applications that are mostly idle but occasionally create threads or have timers with long periods may accumulate a large number of handles as shown by Task Manager. This issue is fixed by triggering a GC of an appropriate generation based on the number of threads. [134926, clr.dll, Bug]
* Fixed reliability problem for using string hashing before initializing the appdomain which used to crash the apps. This is also fixed in .NET Core - [dotnet/coreclr #10843](https://github.com/dotnet/coreclr/issues/10843) [213531, clr.dll, Bug]
* Exceptions from services that fail to start will now be propagated from ServiceBase.Run. [226883, System.ServiceProcess.dll, Bug]
* Fixed a silent bad code generation issue in RyuJit. The conditions for the silent bad code generation are as follows: [282492, clrjit.dll, Bug]
  * The method has a tail call that the JIT decides to dispatch as a fast tail call (without calling a helper).
  * Both the caller and the callee have arguments passed on the stack. 
  * One of the arguments passed on the stack to the caller is a 1, 2, 4, or 8-byte struct. 
  * Some or all of the fields of that struct are used to compute a callee argument passed in a register.
  * If the abovementioned conditions are met, the JIT may generate bad code for the callee register argument. The callee will see an incorrect value.
* Improved resiliency to shutdown finalization for portable PDB.  [360526, System.dll, Bug]
* Fixed a rare issue that can cause hangs in programs that use background GC and exhibit specific patterns of GC handle usage. [369415, clr.dll, Bug]
* Fixed a deadlock in TraceSource initialization. [387336, System.dll, Bug]
* After many instances of ReaderWriterLock are created, an instance may hang while upgrading to a write lock. A new configuration variable is exposed, and may be specified as an environment variable (COMPlus\_ReaderWriterLock\_UseFixedIdGeneration=1) to fix this problem. [395943, clr.dll, Bug]
* Fixed intermittent deadlock during GC with complex generic types. [399387, clr.dll, Bug]
* Fixed a problem where rare crashes or deadlocks happens if a GC occurs while another thread is running NGen'ed code which is making the initial call into a static method within the same module where one or more parameter types involve type-forwarded valuetypes. [404234, clr.dll, Bug]
* Managed threads that exit don't get finalized until a GC of an appropriate generation is triggered. Applications that are mostly idle but occasionally create threads or have timers with long periods may accumulate a large number of handles as shown by Task Manager. This problem is now fixed by triggering a GC of an appropriate generation based on the number of threads that have exited but are not finalized. [407602, clr.dll, Bug]
* Exception.StackTrace now supports displaying source line information for stack frames in assemblies that use pdbs in the new portable pdb format. This is common for libraries that are built targeting .Net standard. [410959, clr.dll, mscorlib.dll, System.Core.dll, Bug]
* Fixed intermittent crash during GC with ETW memory tracing turned on. [425084, clr.dll, Bug]
* SerialPort streams no longer terminate the process when exceptions occur on the background thread. This can happen when removing a USB serial port while in use. This new behavior is controlled by the `Switch.System.IO.Ports.DoNotCatchSerialStreamThreadExceptions` AppContext switch. This switch is set to `truetf get` by default when targeting .NET 4.7 or below. [428461, System.dll, Bug]
* Updated headers to use HTTPS instead of HTTP in URLs. [447119, mscoree.h, cor.h, Bug]
* Fixed infinite loop in the jit which happens in certain cases where cgt.un is used to implement a null check.  [453201, clrjit.dll, Bug]
* Fixed a silent bad codegen problem in JIT that results in incorrect results from XslCompiledTransform. [461649, clrjit.dll, Bug]
* Fixed potential crash during CLR shutdown [437163, clr.dll, Bug]
* Fixed a codegen bug in the code that deals with intrinsics implemented by user calls. [499714, clrjit.dll, Bug]

## Compiler and Managed Languages

* Removed unnecessary ITuple constraint from TRest on ValueTuple 8.  [363866, mscorlib.dll, Bug]
* Support for dynamic pattern matching types. [295579, mscorlib.dll, Feature]
* Added serializable attribute on each ValueTuple type. [378419, mscorlib.dll, Feature]

## Configuration

* Introduced Configuration Builders that allow developers a way to build configuration for applications at runtime from dynamic or centralized sources. [405224, System.Configuration.dll, Feature]

## Networking

* Fixed security vulnerability tracked by Microsoft Common Vulnerabilities and Exposures [CVE-2017-0248](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2017-0248) [364538, System.dll, Bug]
* Fixed a problem with HTTP POST requests that require authentication and resubmit. [369338, System.dll, Bug]
* Add 8 new properties to System.Net.Http.HttpClientHandler to align with NETStandard2.0.  [386926, System.Net.Http.dll, Bug]

## SQL

* Fixed a bug in System.Data.SqlClient where exceptions can be thrown while trying to establish a connection to SQL Server due to receiving TDS packets that are smaller than expected. [396402, System.Data.dll, Bug]
* Enabled sqlclient to connect to the correct instance instead of only default instance when SQL Server 2016 or higher versions is installed in cluster and if it is not the default server. Initially for these scenarios sqlclient was able to connect to only default instance.  [400928, System.Data.dll, Bug]

## WCF

* When serializing an object with TimeSpan property, it will write an empty element for TimeSpan property. The fix is to reliably support TimeSpan property in XmlSerializer.  [252528, System.Xml.dll, Bug]
* Task methods now honor the Description attribute in help pages. [274351, System.ServiceModel.Web.dll, Bug]
* Fixed an incorrect null check issue in AddressHeaderCollection. Afer the fix the actual header (addressHeader) is checked for null and not addressHeaders. [275879, System.ServiceModel.dll, Bug]
* Fixed reliability problem in Addressing.ReadHeader operator comparison [276385, System.ServiceModel.dll, Bug]
* Fixed NullReferenceException in waiters null scenario.  [284926, System.ServiceModel.dll, Bug]
* Fixed Narrator accessibility problem -  Narrator now announces ‘Configuration’ and ‘Services’ in SvcConfigEditor. [393966, SvcConfigEditor.exe, Bug]
* Fixed accessibility problem - now hyperlinks can be opened via keyboard in 'Tasks' panel in SvcConfigEditor. [393974, SvcConfigEditor.exe, Bug]
* Fixed tab order issues in 'Client' panel for SvcConfigEditor. [393991, SvcConfigEditor.exe, Bug]
* Fixed reliability issues in determination of whether ETW should trace exceptions. [394519, System.ServiceModel.dll, Bug]
* Changed the hashing algorithm of HttpChannelFactory from SHA1 to SHA256. [395428, System.ServiceModel.dll, Bug]
* Changed the hashing algorithm of WindowsUserNameCachingSecurityTokenAuthenticator to not use SHA1.  [395433, System.ServiceModel.dll, Bug]
* Changed the hashing algorithm of BuildSharedMemoryName to use SHA256. [395685, System.ServiceModel.dll, Bug]
* Changed the hashing algorithm of MsmqSecureHashAlgorithm from SHA1 to SHA256. [395687, System.ServiceModel.dll, Bug]
* Fixed accessibility problem - now Focus area is correct when pressing arrow key to move focus on a new EndPoint node inSvcConfigEditor. [396819, SvcConfigEditor.exe, Bug]
* Fixed accessibility problem - now focuses are correct when pressing Tab key to move focus on Task area in SvcConfigEditor. [396843, SvcConfigEditor.exe, Bug]
* Fixed accessibility problem - now Narrator reads the full infomation about the link in runtime window in SvcConfigEditor. [396880, SvcConfigEditor.exe, Bug]
* Support for the OS default TLS protocol. [405970, System.ServiceModel.dll, Bug]
* Updated WCF Trace Viewer's controls so all controls now expose the correct properties to screen readers. [424483, SvcTraceViewer.exe , Bug]
* Some text in the WCF Trace Viewer did not contrast enough to be visible for all users. Updated font colors so it should always be visible. [424484, 424485, 424488, SvcTraceViewer.exe, Bug]
* Some text in the WCF Trace Viewer did follow high contrast standards when using high contrast themes. Adjusted text to use the correct colors in these themes. [424924, SvcTraceViewer.exe, Bug]
* Some controls in the WCF Trace Viewer were not accessible using the keyboard because they were not marked as tab stops. Added these to the tab order and these are now accessible using the keyboard. [424942, 424944, SvcTraceViewer.exe, Bug]
* Fixed NullReferenceException when accessing AllowedSecurityIdentifiers if allowedUsers is null. [447641, System.ServiceModel.dll, Bug]

## Windows Forms

* MenuStrip.MdiWindowListItem drop down menu now displays accurate list of available child windows. [241047, System.Windows.Forms.dll, Bug]
* Recent changes in the Mage signing tool had enabled only Current User HSM keys, we have now enabled support for LM keys. [266936, Mage.exe, Bug]
* HDPI improvements in ThreadExceptionDialog [372899, System.Windows.Forms.dll, Bug]
* Fixed an incorrectly translated Print dialog issue for Chinese Simplified or Traditional.  [398471, System.Windows.Forms.dll, Bug]
* Fixed the problem where a static constructor for ConfigurationOptions class throws an exception when TargetFrameworkName in appdomain is null.  [401520, System.Windows.Forms.dll, System.Design.dll, Bug]
* MonthCalendar control is now accessible via narrator and other UI automation tools. [409745, System.Windows.Forms.dll, Bug]
* Fixed multi-mon DPI awareness problem in control anchoring distance scaling  [454161, System.Windows.Forms.dll, Bug]
* WinForms is improving how it works with accessibility aids to better support WinForms customers. Specifically, there are changes to improve display during HighContrast mode, to improve the property browser experience and to implement missing accessibility patterns in controls. Property Browser improvements will include better keyboard navigation though the various drop down selection windows, reduced unnecessary tab stops, better reporting of control types, and improved Narrator behavior. [364507, 366444, 382153, 382195, 382373, 384922, 386113, 386118, 386123, 386173, 386221, 386386, 386420, 387172, 392706, 394788, 395785, 396128, 396905, 399055, 399067, 399988, 404882, 404885, 407249, 407451, 409745, 411616, 411645, 426764, 427010, 428277, 430685, 434763, 436154, 436313, 437010, 437011, 437700, 437912, 449452, 457326, 461557, System.Windows.Forms.dll, Bug]

## Workflow

* Fixed rendering error in Workflow designer in Sharepoint.  [361982, System.Activities.Presentation.dll, Bug]
* Improved accessibility in Workflow designer. Specifically there are fixes in high contrast mode, focus  of different controls and dialogs and name properties  [407062, 407067, 407068, 407069, 407070, 407072, 407075, 407076, 407080, 407085, 407086, 407097, 407407, 407408, 407411, 407414, 407415, 407428, 407436, 407442, 407444, 407450, 407462, 407463, 407467, 408030, 408035, 408043, 408073, 408077, 408158, 408282, 408315, 408329, 409027, 409645, 409719, 409723, 409731, 434137, 445109, 447654, System.Activities.Presentation.dll, Bug]
* New enumerator values are added for System.Messaging.HashAlgorithm to allow developers to choose SHA256, SHA384, and SHA512. Also, the default hashing algorithm if one is not specified is SHA512. For backward compatibility where customers must continue to use MD5, the following must be added to the app.config file for the application: [394583, System.Messaging.dll, Feature]
    ```xml
    <runtime>
    <AppContextSwitchOverrides value=""Switch.System.Messaging.UseMD5ForDefaultHashAlgorithm=true;Switch.System.Messaging.UseRC2ForDefaultEncryptionAlgorithm=true"" />
    </runtime>
    ```
* Fixed an issue where screen readers would consider the arrows in the workflow designer navigation breadcrumbs as part of the list.  [408282, System.Activities.Presentation.dll, Bug]
* Fixed an issue where screen readers would read non-descriptive names of edit boxes in the workflow designer properties window. [459631, System.Activities.Presentation.dll, Bug]

## WPF

* Nested popups with StaysOpen="False" now work as expected. [94132, PresentationFramework.dll, Bug]
* Fixed a bug in which DataGrid displays the wrong value after committing edits to a normalizing property. [158520, PresentationFramework.dll, Bug]
* On Windows 10, WPF applications running in a locked or disconnected user session sometimes consume CPU cycles unexpectedly. This could also manifest as application crash that is observed as soon as the user logs back onto their session. This fix addresses this problem and improves the overall performance and reliablity of WPF applications running on Windows 10. [165554, WindowsBase.dll, PresentationCore .dll, wpfgfx\_v0400.dll, Bug]
* Fixed crashes and incorrect focus when pressing arrow keys in a TreeView or Ribbon that contains Hyperlinks. [170274, PresentationFramework.dll, Bug]
* In WPF applications running on Windows 10 Anniversary Update or greater, WPF will automatically invoke the touch keyboard in applicable scenarios.  In .NET 4.7.1, WPF applications may opt out of this behavior by adding the following to their application configuration file, merging this switch with the AppContextSwitchOverrides list. [362756, PresentationCore.dll, Bug]
    ```xml
    <configuration>
        <runtime>
            <AppContextSwitchOverrides value="Switch.System.Windows.Input.Stylus.DisableImplicitTouchKeyboardInvocation=false"/>
        </runtime>
    </configuration>
    ```
* Support for font changes from Windows 10 Creators Update that involves updates to WPF font fallbacks. [368999, PresentationCore.dll, Bug]
* Added LiveSetting/LiveRegion support to WPF’s Automation provider APIs. Developers can now set the LiveSetting dependency property and raise the LiveRegionChanged event via RaiseAutomationEvent.  [386494, UIAutomationClient.dll, Bug]
* Fixed crash when an async binding refers to a dynamic object. [388736, PresentationFramework.dll, Bug]
* A WPF application running on touch or stylus enabled machines may crash under certain circumstances when a Dispatcher thread is being shutdown or when a tablet or stylus is removed.  This fix alleviates that issue by ensuring that objects associated with tablets and styluses are only released when the device is no longer in use. [402947, PenIMC.dll , Bug]
* Fixed a NullReferenceException thrown during SpellCheck operations after SpellCheck.CustomDictionaries.Clear() is called programmatically. [407524, PresentationFramework.dll, Bug]
* Fixed a crash occurring when removing the SelectedItem from a collection with a custom implementation of INotifyCollectionChanged that does not report the position of the removed item. [424259, PresentationFramework.dll, Bug]
* Fixed a crash in PenIMC.  [424827, PenIMC.dll , Bug]
* Applications written in WPF and running on touch/stylus enabled devices leak a handle on shutdown of a Dispatcher thread. This change appropriately cleans up the handle and fixes the leak. [434938, PenIMC.dll , Bug]
* PackageDigitalSignatureManager.DefaultHashAlgorithm is now SHA256 for applications running on .NET 4.7.1 and targeting .NET 4.6.2 and above. This impacts the default message digest algorithm and signature method for XPS document signing (XpsDocument.SignDigitally) and Package signing (PackageDigitalSignatureManager.Sign). Developers running on .NET 4.7.1 targeting .NET 4.6.2 and above who require SHA1 defaults may enable a compatibility AppContext flag by adding: `Switch.MS.Internal.UseSha1AsDefaultHashAlgorithmForDigitalSignatures=true` to their AppConfig's AppContextSwitchOverrides.  This also allows developers running on .NET 4.7.1 and targeting .NET 4.6.1 and below to enable the new default setting by setting this to false. [436861, WindowsBase.dll, Bug]
* Fixed an infinite loop that can occur while resizing a Grid when (a) two row definitions declare a \*-height, a MinHeight, and a MaxHeight, (b) neither row's content exceeds the MaxHeight, and (c) the first MinHeight, plus any other fixed or Auto rows, exceeds the Grid's available height (even without considering the second MinHeight). There's a similar fix for columns and width. [442027, PresentationFramework.dll, Bug]
* WPF Accessibility:High Contrast improvements - WPF applications running in high contrast themes, as well as those interacting with screen readers will see various improvements. To enable these changes, set the target framework to 4.7.1 or add "Switch.UseLegacyAccessibilityFeatures=false" to your AppContextSwitchOverrides. [447592, PresentationFramework.dll, PresentationCore.dll, Bug]
* Fixed problem where WPF fails to load resources if two versions of the same assembly are loaded. [454391, PresentationFramework.dll, Bug]
* Fixed ComException in PenIMC\_v400 that results in WPF application crashes. [463347, PenIMC2\_v0400.dll, PenIMC\_v0400.dll, Bug]
* On a machine with touch or stylus device, loading a .NET 3.5 WPF application and a .NET 4.x WPF application side-by-side in the same process can result in heap corruption. This change fixes this problem allowing side-by-side execution in the same process on touch/stylus enabled devices.  [377651, PenIMC.dll, PenIMC\_v0400.dll, PresentationCore.dll, WindowsBase.dll, Feature]
* Added support for updating visual tree after changing implicit data template. [406804, PresentationFramework.dll, Feature]
* Added ability to tell whether a property value inside a template is a dynamic resource reference. [406807, PresentationFramework.dll, Feature]
* Provided source info for elements in template created by XamlReader.Load [406808, PresentationFramework.dll, Feature]
* Enabled VisualTree notifications for debugging [406811, PresentationFramework.dll, Feature]
* A WPF app that implements an event handler for the Selector.SelectionChanged event should see the new values for the SelectedIndex, SelectedItem and SelectedValue properties.  This worked correctly in all cases except for one: when the selection change was caused by changing SelectedValue and the handler queried the SelectedValue property, it saw the old value.   This has been fixed. [96884, PresentationFramework,dll, Bug]
* A WPF app with an event handler for the TabControl.SelectionChanged sees the wrong (old) value for TabControl.SelectedContent.  Also, if the selection change occurs while keyboard focus is in the content area, the focus should remain in the content area (provided the new selected content has a focusable element).  This has been fixed. [208019, PresentationFramework,dll, Bug]
* Fixed an issue for touch or stylus-enabled machines, where repeated use of popups in WPF applications can cause loss of touch and stylus support. [479874, PresentationCore.dll, Bug]
* Fixed an issue for touch or stylus-enabled machines, where WPF applications may throw a NullReferenceException in WispLogic.ProcessInputReport. [481090, PresentationCore.dll, Bug]
