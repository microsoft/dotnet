.NET Framework 4.6.2 Release Notes
==================================

.NET Framework release notes describe product improvements grouped by product area. Each change includes a Microsoft-internal VSTS bug number, which acts as a useful unique ID for each change (can be used to report issues or when calling Microsoft Support).

Post-release servicing updates are also included, appended to the end of each product area. The following servicing updates have been included:

- [May 2017](https://blogs.msdn.microsoft.com/dotnet/2017/05/17/net-framework-may-2017-preview-of-quality-rollup/)

## Active Directory Services

* On calls made to System.DirectoryServices.AccountManagement UserPrincipal.GetAuthorizationGroups method against an Active Directory forest which contains SID History values for migrated users, an empty GroupPrincipal will be added to the list returned by GetAuthorizationGroups for every group with a migrated user SID. [191563]

## ASP.NET

* Fixed deadlock in AspNetSynchronizationContext [152944]
* Add support for sorting Model binding items by nested property names [173528]
* Fix Unhandled non-serializable exceptions in ASP.NET [160528]
* Fixed Non-interlocked update/read of 64-bit variable leads to wrong behavior. [92099]
* Since .NET 4.5 ASP.NET cache reports invalid size of the cache. This has been fixed. [154451]
* Fixed client side project compilation failure [156379]
* Fixed an issue with missing ".NET Memory Cache 4.0" performance counter [145677]
* Improve error message localization for DataAnnotationValidiation in ASP.NET model binding and Dynamic data. [176731]
* Enable customers using the Session State Store Providers with task returning methods. [179604]
* Enabling task returning methods to be used with the OutputCache Providers, to allow ASP.Net customers to get the scalability benefits of async. [187841]
* After installing 4.6.2, the max-age value in the following requests coming from Cache is incorrectly set. The issue is not preventing OutputCache on the server side to functional but will cause confusions and problems if customer applications looked at the max-age in the cache control headers.  [288340] [Added: May 2017]
* In the following scenarios, ASP.NET may duplicate the cookie in response headers:
    - Before a request cookie is loaded, the response cookie is added.
    - A response cookie is added, and then a native module sets the response cookie.
    
    With the fix, ASP.NET makes sure that response cookies are not duplicated. [364615] [Added: May 2017]
* Issue #1:  Users might obtain a NULL result when calling OperationContext.Current

  This issue occurs when one creates an OperationContextScope and proceeds to call OperationContext.Current within the using clause.  A common pattern that is prone to this failure is the following:
  
  ```csharp
  using (new OperationContextScope(OperationContext.Current))
  {
      OperationContext context = OperationContext.Current;  //OperationContext.Current returns null
      // ...
  }
   ```

  To work around this issue, one needs to change the code to something similar to the following:
 
  ``` csharp
  OperationContext ocx = OperationContext.Current;
  using (new OperationContextScope(OperationContext.Current))
  {
      OperationContext.Current = new OperationContext(ocx.Channel);
      // ...
  }
  ```
  Issue #2:  Users might run into a deadlock when using Reentrant services.

  This issue occurs when one creates a Reentrant service ? which restricts instances of the service to one thread of execution at a time.  Users prone to running into this problem will have the following ServiceBehaviorAttribute in their code:

  ```csharp
  [ServiceBehavior(ConcurrencyMode = ConcurrencyMode.Reentrant)]
  ```
  To work around this issue, users should set the ConcurrencyMode of their service to ConcurrencyMode.Single or ConcurrencyMode.Multiple, and provide the appropriate synchronization primitives to ensure a single thread can execute a single method at a time.

  We have rolled out an update of System.ServiceModel.dll and we strongly encourage users to patch their existing .NET 4.6.2 framework.  The patch fixes Issue #1, disables the flow of OperationContext.Current by default, and provides an Opt-In option to enables feature.

  To enable the flow of OperationContext.Current across multiple threads in async operations, use the following AppSettings key:
  
  ```xml
  <appSettings>
    <add key="Switch.System.ServiceModel.DisableOperationContextAsyncFlow" value="false"/>
  </appSettings>
  ```
  Setting the value of Switch.System.ServiceModel.DisableOperationContextAsyncFlow to true will disable the flow of the ExecutionContext in OperationContext.Current and will effectively revert the behavior to pre-4.6.2, which is the default behavior after this patch.  Setting the value to false will enable the feature and should not be used in Reentrant services. [253477] [Added: May 2017]

## BCL

* Fix RunContinuationsAscynchronously flag for all continuation types. [146618]
* Fixed NullReference exception if  "sha1RSA" is passed to RSACryptoServiceProvider.SignHash(). [147247]
* Fixed "Unhandled Exception: System.Security.SecurityException: Unable to retrieve security descriptor for this frame." in System.Security.Principal.WindowsIdentity.RunImpersonated() [149685]
* Removed the System.Numerics.Vectors façade from the targeting pack. If this façade is needed, add a reference to the System.Numerics.Vectors NuGet package. [120400]
* SignedXml now supports SHA256/384/512 signing. [125387]
* Added a new type called DSACng. [180229]
* Fixed Warnings generated during build that before required a global disable. [185846]
* Fixed potential threading issues with inconsistent values returned from the calls to AppContext. [181890]
* Framework support Unicode 8.0 for character categories. [176613]
* Improved interoperability with PFX files created with OpenSSL in GetECDsaPrivateKey. [171017]
* The ECDiffieHellman base class has been updated to provide better exposure for the hash, HMAC, and TLS-PRF key derivation methods, and the parameters they accept. [171018]
* Fixed System.Security.Cryptography.RSAPKCS1SignatureFormatter.ComputeSignature() and VerifySignature() failures with a NotSupportedException when an RSACng key is specified. [162556]
* Fixed message decryption issues in System.Security.Cryptography.Pkcs.EnvelopedCMS if the recipient certificate's private key is stored in a CNG key container. [163800]
* The factory method now returns SHA256Cng in FIPS-only mode. [163804]
* Fixed behavioral inconsistencies between .NET Core and .NET Framework 4.6 implementations of RSACng [164390]
* Update .NET to support packaged desktop applications. [191801]
* Fixed app crashes related to CompatSortNLSVersion handler initializations [191561]
* System.Security.Cryptography RSAOAEPKeyExchangeDeformatter, RSAOAEPKeyExchangeFormatter, RSAPKCS1KeyExchangeDeformatters and RSAPKCS1KeyExchangeFormatter no longer fail when used with a CNG key. [190217]
* Added support for AesCng and TripleDESCng. [187062]
* The DSA base class has been updated in the same manner as RSA in 4.6, and ECDsa in 4.6.1.  Accessing the public/private key of a DSA certificate can be done in a type-safe manner via cert.GetDSAPublicKey()/cert.GetDSAPrivateKey(), and signing and verification operations can be done without further casting. [167883]
* Improved usability of error message for System.BitConverter.ToString(Byte[] value, Int32 startIndex, Int32 length). [100012]
* Fix in bulletin MS16-019. [145386]
* Fix in bulletin MS16-035. [171029]
* AesCng() and TripleDEScng() updated to honor optional provider value. [176670]
* Fixes in System.Security.Cryptography [190217]
   RSAOAEPKeyExchangeDeformatter
   RSAOAEPKeyExchangeFormatter
   RSAPKCS1KeyExchangeDeformatters
   RSAPKCS1KeyExchangeFormatter 
* Localized RegionInfo object "BW". [194531]
* Fixed SignedXml.CheckSignature(X509Certificate2) will fail for DSA certs with large keys. [194760]
* Added support for long path names on Windows. [195340]
* Fixed EncryptedXml not supporting CNG certificates. [196759]
* Fixed AppContext switch default. [198124]
* Fixed string comparison hitting before the AppDomain is fully initialized. [198570]
* Fixed potential errors with String comparison hitting before the AppDomain is fully initialized. [199217]
* Added validation that AppContext defaults are correctly enabled. [200028]
* Fixed potential errors with String comparison hitting before the AppDomain is fully initialized. [200330] and [201338]
* Fixed file path syntax to correctly handle device path syntaxes (\\.\, \\?\) [202926]
* Fix for StringBuilder overflow and the length becoming negative when > 2GB of data is added/inserted. [216203]
* Users of SignedXml may get an exception like the following when running in some modes on older versions of Windows (for example, executing without loading the user profile on Windows Server 2008r2).

    ```console
    System.Security.Cryptography.CryptographicException: Object was not found.
    at System.Security.Cryptography.NCryptNative.CreatePersistedKey(SafeNCryptProviderHandle provider, String algorithm, String name, CngKeyCreationOptions options)
    ```
     [372920] [Added: May 2017]

## ClickOnce

* Added support for TLS1.1/1.2 in ClickOnce runtime. [193676]
* Fixed string truncations issue on ClickOnce security dialog. [176656]
* Added ClickOnce support for installation from web-sites that require Client Certificate to be supplied. [197343]

## CLR

* Added Custom attribute to opt out of NGen with method granularity [186172]
* Support .NET in packaged desktop apps. [191774]
* Fixed incorrect result generation while comparing 16-bit signed values. [187325]
* Fixed a JIT optimization bug [174983]
* Fixed crashes due to JIT32 inlining handling of struct [171773]
* Fixed issue with incomplete PDB information when invoking ildasm. [150267]
* Fixed a performance regression in debug start [164437]
* Fixed an issue in CLR type loader that causes type load failures in rare conditions. [185570]
* Fixed usability issues with error message received when System.BitConverter.ToString(Byte[] value, Int32 startIndex, Int32 length) is called [100012]
* Performance fixes in GC [162854]
* Fixed stress issues in GC [161104]
* Fixed crashes in EventListener.DisposeOnShutdown [156238]
* Implement EventCounter support [150674]
* Fixed System.Diagnostics.Tracing.EventSource does not serialize byte[] correctly [153224]
* Fixed RelatedActivityID is not set properly when using EventSource's ActivityTracker [154432]
* Fixed [EventSource] .WriteEvent handles null strings inconsistently depending on the overload getting called [95999]
* Added the event name to ThrowEventSourceException message [112066]
* Fixed typo in EventSource resource string [118799]
* Fixed unexpected exceptions thrown during OnEventSourceCreated [121699]
* In .NET 4.6 if two event names in EventSource differ by a suffix of Start or Stop, then the EventSource will fail to construct and never emit any logging. This is now fixed. [121820]
* Improve Diagnostic when using RelatedActivityID in EventSource [128437]
* User-defined subclasses named "EventSource" can be allowed by checking that the EventSource's type is not equal to typeof(EventSource) which is the type of the built in EventSource. [125529]
* When a byte array is written to an Event a spurious warning is generated by EventSource, claiming that the event has a mismatch in parameter count when it does not. [166228]
* Fixed erroneous removal of IF condition in a finally or catch handler if the condition check exists in the exit from the try-body and entry to the try-body. [149697]
* Fixed a codegen bug when encountering an unbox instruction while the evaluation stack has pending evaluations that side-effect arguments of the unbox. [150586]
* Fix for optimization bug in the JIT component of .NET 4.6.1 may incorrectly combine branches that test bit patterns into a single branch incorrectly leading to program failure. [168744]
* Fix for hang in GC when ETW happens to request to walk the heap at the end of a background server GC [179589]
* Fixed NullReferenceException in EventSource if activity tracking is enabled. [182896]
* Fixed an EventSource exception indicating the maximum number of arguments has been exceeded. [191686]
* Added support for memory limit specified by job objects to GC. [194795]
* Fixed JIT Optimizer bug causing structs to be treated as reference objects instead of values objects in .Net 4.6 when targeting amd64. [194809]
* Fixed potential crash when the JIT generates an incorrect initialization value for an initblk and initializes memory incorrectly. [199169]
* Added VariableHome API for NullReferenceException improvements. [199851]
* Fixed [EventSource] Tags field is ignored for complex types. [205969]
* Allowed the debugger to determine the layout of types without an instance of the type. [211562]
* Reduced events are being sent for telemetry to the CLR for Windows Server OSes. [211794]
* Support resolving Windows Runtime references through simple name in .NET SDK. [219126]
* Reliability improvements in RYUJIT complier code generation due to a missed AVX encoding case. [259784] [Added: May 2017]
* On a machine with many processors, there might a desire to have some processes use only some processes with Server GC. For example if you have a 40-proc machine, you might want to have process 0 use only 10 procs and process 1 use only 6. So process 0 gets 10 GC heaps/threads and process 1 gets 6. Below is an example of using these Server GC configs:

    ```xml
    <configuration>
    <runtime>
        <gcServer enabled="true"/>
        <GCHeapCount enabled="6"/>
        <GCNoAffinitize enabled="true"/>
        <GCHeapAffinitizeMask enabled="144"/>
    </runtime>
    </configuration>
    ```

   `<GCNoAffinitize enabled="true"/>` specifies to not affinitize the Server GC threads with CPUs.
    `<GCHeapCount enabled="6"/>` 6 specifies you want 6 heaps. The actual # of heaps is the min of what you specify and what your process is allowed to use.
    `<GCHeapAffinitizeMask enabled="144"/>` the # is in decimal so this is 0x90, meaning you want to use those 2 bits as your process mask. The actual # of heaps is the min of what you specify, what your process is allowed to use and the # of set bits in this mask you specify. [274126] [Added: May 2017]
* If you are marshaling array of struct A and also array of struct B as SAFEARRAY, and struct A/B has identical GUIDs, you may run into a memory leak.  [365349] [Added: May 2017]
* If you are marshaling array of struct A and also array of struct B as SAFEARRAY, and struct A/B has identical GUIDs, you may run into a memory leak.  [424243] [Added: May 2017]
* If you are marshaling array of struct A and also array of struct B as SAFEARRAY, and struct A/B has identical GUIDs, you may run into a memory leak.  [431586] [Added: May 2017]
* Rare crashes or deadlocks can happen if a GC occurs while another thread is running NGen'ed code which is making the initial call into a static method within the same module where one or more parameter types involve type-forwarded valuetypes. [378601] [Added: May 2017]
* Applications that frequently queue bursts of work items to the .NET ThreadPool, with idle or light activity between bursts, may be shown using PerfView to spend a significant amount of CPU time in clr!ThreadpoolMgr::UnfairSemaphore::Wait in a spin-wait. A new configuration variable is exposed to configure the spinning limit. The environment variable COMPlus_ThreadPool_UnfairSemaphoreSpinLimit may be set to a lower value (default is 0x32) to reduce the amount of spinning done, or zero (0) to disable spinning, before launching the application. Note that changes to this configuration variable may negatively affect the performance of applications, and such changes are not supported. [381905] [Added: May 2017]

## Entity Framework

* When there are more than 1000 queries in the EF 4.x application, the application may experience slowness due to exceeding the size limit of the query cache. With this fix, you can change the query cache size through the following AppSetting.
    ```xml
    <appSettings>
        <add key="EntityFramework_QueryCacheSize" value="3000"/>
    </appSettings>
    ```
     [379134] [Added: May 2017]

## Networking

* Fixed a crash with Null Reference in PinnableBufferCache.Free. [144864]
* Fix in bulletin MS16-065. [186985]
* Added CNG certificate support to NCL code in System.dll. [195318]
* An AccessViolationException gets thrown in HttpListenerRequest.GetTlsTokenBindingRequestInfo() if the RequestBuffer of the HttpListenerRequest has been moved by the garbage collector. This AccessViolation is caused by the fact that HttpListenerRequest is dereferencing a pointer inside RequestBuffer, without adjusting the pointer address the way other HttpListenerRequest methods do. This is now fixed. [204580]
* When attempting to access token bindings from the GetTlsTokenBindings API, an Access Violation exception can be thrown if managed memory has moved during the request. Pointers are now updated to reflect any memory movement.  [267430] [Added: May 2017]

## SQL

* Added Parameter Caching and CEK TTL improvements. [200050]
* Removed connection pool blocking period for Azure SQL DBs. [200140]
* Fixed incorrect error message in SqlClient when a Command Execution fails on Azure. [201189]
* Disallowed WAM option in native ADAL for AAD authorization. [201411]
* Fix in bulletin MS16-091. [222831]
* Fix for a crash that may occur when the connection pool is being replenished and during replenishment of the pool, the connection to SQL server fails. [229717]
* An OverflowException or IndexOutOfRangeException may be thrown during the prelogin phase of opening a SQL Connection due to receiving a TDS packet that is smaller than expected. [395584, 395586, 395589, 395592] [Added: May 2017]

## WCF

* Added a new option for client to find best matching WCF service endpoint using NetNamePipeBinding.[157498]
* CryptoConfig.CreateName(string algorithm) is now updated to understand SHA256 algorithms. [195341]
* Fixed a reliability issue in DataContractCriticalHelper which throws as a SerializationException when reading objects concurrently. [146940]
* Fixed System.ServiceModel.Activation.HostedAspNetEnvironment.get_WebSocketVersion failing during WP startup. [169409]
* Added support for OperationContext.Current with async. [171085]
* Added telemetry for WCF. [172127]
* Fixed a race in UnescapeDefaultValue in UriTemplate::Match when using Default Values [176590]
* Added Support for usage of X509 certificates which are stored using the CNG key storage provider. [182182]
* Fix for XmlSerializer not correctly serializing with XmlText's DataType set to "time". [184091]
* Removed Ssl3 from the WCF TransportDefaults. [186891]
* Fixed DataContractJsonSerializer producing wrong date/time data after having installed KB3093503 when the time zone is (UTC+2) Istanbul. [187509]
* Fixed Performance in AppServices Throughput. [201205]
* Fixed issue that could occur with tracing enabled on WCF async service; failed call generated double OperationFaulted traces. [208167]
* Fix for ArgumentException when opening service host when user's certificate has invalid key usage data. [223670]
* Fixed WCF SslStreamSecurity DNS Identity Check failure while targeting .NET Framework 4.6 when Alt subject is not present [182336]

## Windows Forms

* Fixed a crash in Windows Forms designer related to switching windows themes [172691]
* "Smart Tag" dialog processes "enter" key press properly and is same as in Visual Studio 2013 [174771]
* Enabled shortcut keys in the preferences dialog in mageui.exe tool [184655]
* A Windows Forms application that is using print preview dialog when printing to a network printer with certain non-default preferences set, can now opt in into a performance optimization that would considerably speed up the preview generation. [159091]
* Fixed a hang in Windows Forms app when Control.Invoke is called but the caller thread terminates before the invoke finishes [149183]
* Added an Application compatibility switch that fixes implementation of MemberDescriptor.Equals  function so that it compares the corresponding fields, instead of comparing description field to category field. [149471]
* Fixed potential race condition in System.Windows.Forms.Application.ThreadContext  [146065]
* Fixed a control in MageUI tool that is not accessible by a keyboard shortcut because the same shortcut letter is used for two controls [146678]
* Fixed a memory leak in Control.DrawToBitmap method. [188396]
* Fixed control text truncations issue in "Items Collection Editor" dialog in Visual Studio. [187716]
* Fixed a crash in Windows Forms Designer in Visual Studio related to adjusting TableLayoutPanel control. [190415]
* Fixed a crash in Windows Forms Designer in Visual Studio [190416]
* Fix in bulletin MS16-019. [174623]
* Added Long path support for Windows 10 Anniversary Update in Windows Forms. [191855]
* Improved reliability of Windows Forms applications [193532]
* Added support for CNG key providers to Mage and Mageui SDK tools [194373]
* Fixed printing delay in previewing the document with a network printer. [197824]
* Added Long path support for Windows 10 Anniversary Update in ClientConfigPath. [202970]
* Fixed X1 Professional Client "ok" button is gray and disabled after select Desktop in browse for folder. [207279]
* A windows Forms Application with MDI parent form under certain conditions will remove active child forms from the MDI child windows list. This happens when the closing of the child form is canceled by the user and the child windows list menu item is opened. [388401] [Added: May 2017]

## Workflow

* Workflow designer now supports "prepared for update" dynamic update XAML [98185]
* Fixed a FIPS compliance issue when using workflow tracking in WF3. [181434]
* Added Workflow/System.Messaging/System.Transactions Telemetry. [198681]
* Fixed transaction failure for SQLCLR usage of System.Transactions to promote a local SQL transaction to a distributed transaction. [206276]

## WPF

* Nested Markup Expressions scenarios, where the parent markup extension is locally defined, have been fixed now. Developers can use markup extension within their custom defined markup extensions without causing a compiler error. [117193]
* Fixed potential periodic hangs or poor performance of a WPF application running on a device that has touch support.  This is mostly seen when running over a touch-enabled remote desktop or other touch enabled remote access solutions.  [146399]
* Enable automatic invocation and dismissal of the touch keyboard in WPF applications without disabling WPF stylus/touch support on Windows 10 [178044]
* Fixed missing glyph symbol display issues for those WPF applications that render text in the following ranges using a font that does not contain these ranges. [165725]
   Ranges: 
   - Unicode = "0000-052F, 0590-06FF, 0750-077F, 08A0-08FF, 1D00-1FFF, 2C60-2C7F, A720-A7FF, FB00-FB0F, FB1D-FBFF"
   - Unicode = "FC00-FDCF, FDF0-FDFF, FE20-FE2F, FE70-FEFE"
* Developers of WPF applications on .NET 4.6.1 may notice that the number of promotions from a touch move event to a mouse move event do not correspond 1:1.  This change ensures that there is a corresponding mouse move promotion for every applicable touch move. [169470]
* Enable WPF Applications to look and feel great in multi DPI environments. This means crisper text, sharper images and general polish. [191569]
* WPF applications that allocate large numbers of bitmaps over time can possibly see performance issues such as frequent pauses and large numbers of garbage collections.  This fix changes the bitmap garbage collection strategy to help alleviate these issues. [121913]
* Enables enumeration of generic and themed ResourceDictionary instances, and provides a notification infrastructure for listening to loading and unloading of ResourceDictionary instances. [159740]
* Starting .NET 4.6, CurrentCulture or CurrentUICulture changes made by event handlers (or any other method that WPF orchestrates the dispatch for) are lost when the method completes. This can result in various unintended side-effects ranging from the selection of incorrect UI language by application code, to potential loss of state information. This fix addresses the bug described above. [157919]
* Fixed compilation error in situations when a locally defined custom type in a XAML resource dictionary is immediately followed by something like x:Array. [131561]
* Long runs of dashes are now displayed correctly, without spurious spaces. [92892]
* On environments where the secondary monitor is larger than the primary monitor, a WPF application won't maximize to the correct size. This is now fixed. [104034]
* Fixed Crash after refreshing a collection underlying a ComboBox. [125219]
* Fixed crash in DataGrid view. [150804]
* Fixed Groups not being sorted correctly after property changes.  [165198]
* Fixed RibbonGallery being disabled. [173053]
* Fixed memory usage issues with printing in Windows 8 and above. [174139]
* Fix in bulletin MS16-035. [176941]
* Developers can opt-in to receiving an exception when TextBoxBase controls fail to complete a Copy or Cut operation.  [177621]
* WPF applications being used via multi-touch enabled devices could sometimes lose mouse promotion after a multi-touch drag/drop.  This occurred when users removed touch points other than the primary (or dragging) touch point first.  Doing so would cause an incorrect count of active touch devices causing mouse promotion handling to be incorrect for future touch interaction.  This is now fixed. [185548]
* WPF would previously throw an ArgumentException when a UI Automation Client queried for an unknown TextAttribute.  This was causing performance issues in WPF applications on Windows 8 and above.  WPF will now simply return NotSupported in response to querying an unknown TextAttribute preserving the external behavior and helping alleviate performance issues. [187764]
* Fix for crash that occurs when:  App is running more than one dispatcher thread, First thread uses any ItemsControl, Second thread uses a Selector. While something is selected, the underlying collection raises a Reset event, or the ItemsSource changes. [190507]
* Per Monitor DPI Aware apps now can have their title bars scaled to the correct DPI when an app is moved from one DPI to a different one. [206796]
* Images created with BitmapCreateOptions=DelayCreation can now update their ImageSource by listening to the RoutedEvent DpiChanged on the Image. This event is fired before the Image is decoded, and thus the cost of decoding the image twice can be avoided. [206986]
* WPF apps which are Per monitor DPI aware, running on Windows 10 Anniversary Update, will not have their popup windows like Menus clipped the first time they are open on a monitor with a different DPI. [212426]
* Fixed for Wisptis doesn't support some scenarios in Windows 7, trying to load wisptis in certain scenarios can result in delays upon start or crashes. [215016]
* Fixed issues with the touch keyboard showing on controls when it should not. [222625]
* Fixed ArgumentException when scrolling a virtualized ItemsControl after adding new items [194726].
* Avoid unnecessary iteration through all items displayed in a virtualized ItemsControl with ScrollUnit=Item [202599].
* Fixed XPS printing crash when InvariantCulture is used. [143947]
* Fixed truncation of contents during copy & paste in HTML format when the WPF DataGrid control contains full width characters, for e.g. Japanese. [104825]
* In some situations, it is possible that WPF attempts to process a touch/stylus input with a null StylusDevice.  This can cause a NullReferenceException.  This fix checks for this issue and guards against it. [381810] [Added: May 2017]
* In some situations, it is possible that WPF attempts to process a touch/stylus input with a null StylusDevice.  This can cause a NullReferenceException.  This fix checks for this issue and guards against it. [378292] [Added: May 2017]
* There is a memory leak when a WPF application includes a D3DImage control, changes both the size and the content of the image, and runs with software rendering (e.g. running over Remote Desktop). [261136] [Added: May 2017]
* A WPF application with a virtualizing list control (ListBox, DataGrid, TreeView, etc.) can encounter an ArgumentNullException when scrolling to an item whose size has substantially decreased since the last time it was re-virtualized. [273803, 282662, 282664, 367282, 367285] [Added: May 2017]
* A WPF application that repeatedly changes the Template of a TextBox can encounter a memory leak of TextBoxView objects. The Template change can happen implicitly, for example by moving the TextBox in and out of the main visual tree, or by moving it between scopes of different implicitly-defined Styles. [245230] [Added: May 2017]
* A WPF application can encounter an ArgumentOutOfRangeException if it uses a DataGrid with column virtualization enabled, calls DataGrid.ScrollIntoView(row, column) before the column widths are known, then immediately changes the DataGrid.Columns collection before the DataGrid has rendered. [271673] [Added: May 2017]
