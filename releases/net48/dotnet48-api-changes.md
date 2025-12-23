```diff
namespace System.Security.Cryptography.X509Certificates {
    public class X509Certificate {
        public virtual byte[] GetCertHash(HashAlgorithmName hashAlgorithm)
        public virtual string GetCertHashString(HashAlgorithmName hashAlgorithm)
    }
}
namespace System.Security.Cryptography {
    protected class SHA1Managed.Dispose(bool)
    protected class SHA256Managed.Dispose(bool)
    protected class SHA384Managed.Dispose(bool)
    protected class SHA512Managed.Dispose(bool) 
}
namespace System {
    public static class GC{
       public static long GetAllocatedBytesForCurrentThread()
    }
}
namespace System.Reflection{
    public enum MethodImplAttributes{SecurityMitigations}
}
namespace System.Runtime.CompilerServices {
    public enum MethodImplOptions{ SecurityMitigations }
}
namespace System.Threading {
    public static class Interlocked{
     public static void SpeculationBarrier()
    }
}
namespace System.Net.Configuration {
    public sealed class WebProxyScriptElement : ConfigurationElement {
        [ConfigurationProperty("autoConfigUrlRetryInterval", DefaultValue = 600)]
        public static int AutoConfigUrlRetryInterval { get; set; }
    }
}
namespace System.Net {
    [Flags]
    public enum SecurityProtocolType {
        Tls13 = 12288
    }
}
namespace System.Security.Authentication {
    public enum SslProtocols {
        Tls13 = 12288,
    }
}
namespace System.Net.Configuration {
    public sealed class SettingsSection : ConfigurationSection {
        [ConfigurationProperty("windowsAuthentication")]
        public WindowsAuthenticationElement WindowsAuthentication { get; }
    }
    public sealed class WindowsAuthenticationElement : ConfigurationElement {
        [ConfigurationProperty("defaultCredentialsHandleCacheSize", DefaultValue = 0)]
        public int DefaultCredentialsHandleCacheSize { get; set; }
    }
}
namespace System.ServiceModel.Configuration {
    public sealed class ServiceHealthElement : BehaviorExtensionElement {
        public ServiceHealthElement();
        public override Type BehaviorType { get; }
        public bool HealthDetailsEnabled { get; set; }
        public string HttpGetBinding { get; set; }
        public string HttpGetBindingConfiguration { get; set; }
        public bool HttpGetEnabled { get; set; }
        public Uri HttpGetUrl { get; set; }
        public string HttpsGetBinding { get; set; }
        public string HttpsGetBindingConfiguration { get; set; }
        public bool HttpsGetEnabled { get; set; }
        public Uri HttpsGetUrl { get; set; }
        protected override ConfigurationPropertyCollection Properties { get; }
        public override void CopyFrom(ServiceModelExtensionElement from);
        protected internal override object CreateBehavior();
    }
}
namespace System.ServiceModel.Description {
    public class ServiceHealthBehavior : ServiceHealthBehaviorBase {
        public ServiceHealthBehavior();
        protected virtual bool HasXmlSupport { get; }
        protected static void AddHttpProperty(Message message, HttpStatusCode status, bool isXml);
        protected static bool EnsureHttpStatusCode(int code);
        protected virtual HttpStatusCode GetHttpResponseCode(ServiceHostBase serviceHost, string[] queries);
        protected virtual ServiceHealthSectionCollection GetServiceHealthSections(ServiceHostBase serviceHost);
        protected virtual XmlDocument GetXmlDocument(ServiceHostBase serviceHost);
        public override void HandleHealthRequest(ServiceHostBase serviceHost, Message httpGetRequest, string[] queries, out Message replyMessage);
        protected static bool TryParseBooleanQueryParameter(string parameterName, string parameter, bool defaultValue, out bool result);
        protected static bool TryParseHttpStatusCodeQueryParameter(string parameterName, string parameter, HttpStatusCode defaultErrorCode, out HttpStatusCode result);
    }
    public abstract class ServiceHealthBehaviorBase : IServiceBehavior {
        protected ServiceHealthBehaviorBase();
        public bool HealthDetailsEnabled { get; set; }
        public Binding HttpGetBinding { get; set; }
        public bool HttpGetEnabled { get; set; }
        public Uri HttpGetUrl { get; set; }
        public Binding HttpsGetBinding { get; set; }
        public bool HttpsGetEnabled { get; set; }
        public Uri HttpsGetUrl { get; set; }
        protected DateTimeOffset ServiceStartTime { get; }
        public abstract void HandleHealthRequest(ServiceHostBase serviceHost, Message httpGetRequest, string[] queries, out Message replyMessage);
        void System.ServiceModel.Description.IServiceBehavior.AddBindingParameters(ServiceDescription description, ServiceHostBase serviceHostBase, Collection<ServiceEndpoint> endpoints, BindingParameterCollection parameters);
        void System.ServiceModel.Description.IServiceBehavior.ApplyDispatchBehavior(ServiceDescription description, ServiceHostBase serviceHostBase);
        void System.ServiceModel.Description.IServiceBehavior.Validate(ServiceDescription description, ServiceHostBase serviceHostBase);
    }
    public sealed class ServiceHealthElement {
        public ServiceHealthElement(string key, string[] values);
        public string Key { get; set; }
        public string[] Values { get; set; }
    }
    public sealed class ServiceHealthElementCollection : KeyedCollection<string, ServiceHealthElement> {
        public ServiceHealthElementCollection();
        public void Add(string key, string value);
        public void Add(string key, string[] values);
        protected override string GetKeyForItem(ServiceHealthElement element);
    }
    public class ServiceHealthModel {
        public const string Namespace = "http://schemas.microsoft.com/net/2018/08/health";
        public ServiceHealthModel();
        public ServiceHealthModel(ServiceHostBase serviceHost);
        public ServiceHealthModel(ServiceHostBase serviceHost, DateTimeOffset serviceStartTime);
        public ServiceHealthModel.ChannelDispatcherModel[] ChannelDispatchers { get; }
        public DateTimeOffset Date { get; }
        public ServiceHealthModel.ProcessInformationModel ProcessInformation { get; }
        public ServiceHealthModel.ProcessThreadsModel ProcessThreads { get; }
        public ServiceHealthModel.ServiceEndpointModel[] ServiceEndpoints { get; }
        public ServiceHealthModel.ServicePropertiesModel ServiceProperties { get; }
        public class ChannelDispatcherModel {
            public ChannelDispatcherModel();
            public ChannelDispatcherModel(ChannelDispatcherBase channelDispatcher);
            public string BindingName { get; }
            public ServiceHealthModel.CommunicationTimeoutsModel CommunicationTimeouts { get; }
            public string ContractName { get; }
            public bool IsSystemEndpoint { get; }
            public Nullable<CommunicationState> ListenerState { get; }
            public string ListenerUri { get; }
            public string MessageEncoder { get; }
            public string[] MessageInspectors { get; }
            public ServiceHealthModel.ServiceThrottleModel ServiceThrottle { get; }
            public Nullable<CommunicationState> State { get; }
        }
        public class CommunicationTimeoutsModel {
            public CommunicationTimeoutsModel();
            public CommunicationTimeoutsModel(IDefaultCommunicationTimeouts timeouts);
            public TimeSpan CloseTimeout { get; }
            public bool HasTimeouts { get; }
            public TimeSpan OpenTimeout { get; }
            public TimeSpan ReceiveTimeout { get; }
            public TimeSpan SendTimeout { get; }
        }
        public class ProcessInformationModel {
            public ProcessInformationModel();
            public ProcessInformationModel(ServiceHostBase serviceHost);
            public int Bitness { get; }
            public string GCMode { get; }
            public string ProcessName { get; }
            public DateTimeOffset ProcessStartDate { get; }
            public DateTimeOffset ServiceStartDate { get; }
            public ServiceHealthModel.ProcessThreadsModel Threads { get; }
            public TimeSpan Uptime { get; }
            public void SetServiceStartDate(DateTimeOffset serviceStartTime);
        }
        public class ProcessThreadsModel {
            public ProcessThreadsModel();
            public int AvailableCompletionPortThreads { get; }
            public int AvailableWorkerThreads { get; }
            public int MaxCompletionPortThreads { get; }
            public int MaxWorkerThreads { get; }
            public int MinCompletionPortThreads { get; }
            public int MinWorkerThreads { get; }
            public int NativeThreadCount { get; }
        }
        public class ServiceEndpointModel {
            public ServiceEndpointModel();
            public ServiceEndpointModel(ServiceEndpoint endpoint);
            public string Address { get; }
            public string[] BehaviorNames { get; }
            public string BindingName { get; }
            public string ContractName { get; }
        }
        public class ServicePropertiesModel {
            public ServicePropertiesModel();
            public ServicePropertiesModel(ServiceHostBase serviceHost);
            public string[] BaseAddresses { get; }
            public Nullable<ConcurrencyMode> ConcurrencyMode { get; }
            public Nullable<InstanceContextMode> InstanceContextMode { get; }
            public string Name { get; }
            public string[] ServiceBehaviorNames { get; }
            public ServiceHealthModel.ServiceThrottleModel ServiceThrottle { get; }
            public string ServiceTypeName { get; }
            public CommunicationState State { get; }
        }
        public class ServiceThrottleModel {
            public ServiceThrottleModel();
            public ServiceThrottleModel(ServiceThrottle serviceThrottle);
            public int CallsCapacity { get; }
            public int CallsCount { get; }
            public bool HasThrottle { get; }
            public int InstanceContextsCapacity { get; }
            public int InstanceContextsCount { get; }
            public int SessionsCapacity { get; }
            public int SessionsCount { get; }
        }
    }
    public sealed class ServiceHealthSection : Collection<ServiceHealthElementCollection> {
        public ServiceHealthSection();
        public ServiceHealthSection(string title);
        public string BackgroundColor { get; set; }
        public string ForegroundColor { get; set; }
        public string Title { get; set; }
        public ServiceHealthElementCollection CreateElementsCollection();
    }
    public sealed class ServiceHealthSectionCollection : Collection<ServiceHealthSection> {
        public ServiceHealthSectionCollection();
        public ServiceHealthSection CreateSection(string title);
        public ServiceHealthSection CreateSection(string title, string backgroundColor);
        public ServiceHealthSection CreateSection(string title, string backgroundColor, string foregroundColor);
    }
}
namespace System.Windows.Forms {
    public class AccessibleObject : StandardOleMarshalObject, IAccessible, IReflect, UnsafeNativeMethods.IEnumVariant, UnsafeNativeMethods.IExpandCollapseProvider, UnsafeNativeMethods.IGridItemProvider, UnsafeNativeMethods.IGridProvider, UnsafeNativeMethods.IOleWindow, UnsafeNativeMethods.IRawElementProviderSimple, UnsafeNativeMethods.ITableItemProvider, UnsafeNativeMethods.ITableProvider, UnsafeNativeMethods.IToggleProvider, UnsafeNativeMethods.IValueProvider {
        public bool RaiseAutomationNotification(AutomationNotificationKind notificationKind, AutomationNotificationProcessing notificationProcessing, string notificationText);
    }
    public class AccessibleObject {
        public virtual bool RaiseLiveRegionChanged();
    }
      public class Label : Control, IAutomationLiveRegion {
        public AutomationLiveSetting LiveSetting { get; set; }
    }
    public class ToolStripComboBox : ToolStripControlHost {
       protected override AccessibleObject CreateAccessibilityInstance();
    }
    public class ToolStripProgressBar : ToolStripControlHost {
       protected override AccessibleObject CreateAccessibilityInstance();
    }
    protected override AccessibleObject CreateAccessibilityInstance() {
       protected override AccessibleObject CreateAccessibilityInstance();
    }
    public class ToolStripStatusLabel : ToolStripLabel { }
    public class ToolStripStatusLabel : ToolStripLabel, IAutomationLiveRegion {
        protected override AccessibleObject CreateAccessibilityInstance();
        public AutomationLiveSetting LiveSetting { get; set; }
        protected override void OnTextChanged(EventArgs e) {
    }
    public class Button : ButtonBase, IButtonControl {
        protected override void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew);
    }
    public class CheckBox : ButtonBase {
        protected override void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew);
    }
    public class RadioButton : ButtonBase {
        protected override void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew);
    }
    public partial class Control {
        public Size LogicalToDeviceUnits(Size value)
    }

    public class PropertyGrid : ContainerControl, IComPropertyBrowser, UnsafeNativeMethods.IPropertyNotifySink {
        protected override void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew);
    }
    public abstract class ScrollBar : Control {
        protected override void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew) {
        public bool ScaleScrollBarForDpiChange { get; set; }
    }
    public class SystemInformation {
        public static int VerticalScrollBarArrowHeightForDpi(int dpi);
    }
}
namespace System.Windows.Forms.Automation {
    public enum AutomationNotificationKind {
        ActionAborted = 3,
        ActionCompleted = 2,
        ItemAdded = 0,
        ItemRemoved = 1,
        Other = 4,
    }
    public enum AutomationNotificationProcessing {
        All = 2,
        CurrentThenMostRecent = 4,
        ImportantAll = 0,
        ImportantMostRecent = 1,
        MostRecent = 3,
    }
    public enum AutomationLiveSetting {
        Assertive = 2,
        Off = 0,
        Polite = 1,
    }
    public interface IAutomationLiveRegion {
        AutomationLiveSetting LiveSetting { get; set; }
    }
}
namespace System.Windows.Automation.Peers {
    public abstract class AutomationPeer: DispatcherObject {
        virtual protected int GetSizeOfSetCore()
        virtual protected int GetPositionInSetCore()
            public int GetSizeOfSet()
            public int GetPositionInSet()
    }
    public abstract class AutomationPeer: DispatcherObject {
        virtual protected List<AutomationPeer> GetControlledPeersCore()
            public List<AutomationPeer> GetControlledPeers()
            private IRawElementProviderSimple[] GetControllerForProviderArray()
    }
    public abstract class AutomationPeer: DispatcherObject {
        public static readonly DependencyProperty SelectionTextBrushProperty
            public Brush SelectionTextBrush
            private static Brush GetDefaultSelectionTextBrush()
    }
    public class GroupItemAutomationPeer : FrameworkElementAutomationPeer {
        protected override List<AutomationPeer> GetChildrenCore()
            override protected void SetFocusCore()
            protected override bool IsKeyboardFocusableCore()
            override protected bool HasKeyboardFocusCore()
    }
}
namespace System.Windows.Automation {
    public static class AutomationProperties {
        public static void SetPositionInSet(DependencyObject element, int value)
        public static int GetPositionInSet(DependencyObject element)
            public static void SetSizeOfSet(DependencyObject element, int value)
            public static int GetSizeOfSet(DependencyObject element)
    }
    public sealed class AutomationElement {
         public static readonly AutomationProperty SizeOfSetProperty
            public static readonly AutomationProperty PositionInSetProperty
    }
    public sealed class AutomationElementIdentifiers {
         public static readonly AutomationProperty SizeOfSetProperty
            public static readonly AutomationProperty PositionInSetProperty
    }
}

```
