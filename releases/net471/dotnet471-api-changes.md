```diff
 namespace System {
+    public static class StringNormalizationExtensions {
+        public static bool IsNormalized(this string value);
+        public static bool IsNormalized(this string value, NormalizationForm normalizationForm);
+        public static string Normalize(this string value);
+        public static string Normalize(this string value, NormalizationForm normalizationForm);
+    }
-    public class Tuple<T1> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public class Tuple<T1, T2> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1, T2> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public class Tuple<T1, T2, T3> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1, T2, T3> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public class Tuple<T1, T2, T3, T4> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1, T2, T3, T4> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public class Tuple<T1, T2, T3, T4, T5> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1, T2, T3, T4, T5> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public class Tuple<T1, T2, T3, T4, T5, T6> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1, T2, T3, T4, T5, T6> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public class Tuple<T1, T2, T3, T4, T5, T6, T7> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1, T2, T3, T4, T5, T6, T7> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public class Tuple<T1, T2, T3, T4, T5, T6, T7, TRest> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple {
+    public class Tuple<T1, T2, T3, T4, T5, T6, T7, TRest> : IComparable, IStructuralComparable, IStructuralEquatable, ITuple, ITupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential, Size=1)]
-    public struct ValueTuple : IComparable, IComparable<ValueTuple>, IEquatable<ValueTuple>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential, Size=1)]
+    public struct ValueTuple : IComparable, IComparable<ValueTuple>, IEquatable<ValueTuple>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
-    public struct ValueTuple<T1> : IComparable, IComparable<ValueTuple<T1>>, IEquatable<ValueTuple<T1>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct ValueTuple<T1> : IComparable, IComparable<ValueTuple<T1>>, IEquatable<ValueTuple<T1>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public struct ValueTuple<T1, T2> : IComparable, IComparable<ValueTuple<T1, T2>>, IEquatable<ValueTuple<T1, T2>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    public struct ValueTuple<T1, T2> : IComparable, IComparable<ValueTuple<T1, T2>>, IEquatable<ValueTuple<T1, T2>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public struct ValueTuple<T1, T2, T3> : IComparable, IComparable<ValueTuple<T1, T2, T3>>, IEquatable<ValueTuple<T1, T2, T3>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    public struct ValueTuple<T1, T2, T3> : IComparable, IComparable<ValueTuple<T1, T2, T3>>, IEquatable<ValueTuple<T1, T2, T3>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public struct ValueTuple<T1, T2, T3, T4> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4>>, IEquatable<ValueTuple<T1, T2, T3, T4>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    public struct ValueTuple<T1, T2, T3, T4> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4>>, IEquatable<ValueTuple<T1, T2, T3, T4>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public struct ValueTuple<T1, T2, T3, T4, T5> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    public struct ValueTuple<T1, T2, T3, T4, T5> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public struct ValueTuple<T1, T2, T3, T4, T5, T6> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    public struct ValueTuple<T1, T2, T3, T4, T5, T6> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public struct ValueTuple<T1, T2, T3, T4, T5, T6, T7> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6, T7>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6, T7>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+    public struct ValueTuple<T1, T2, T3, T4, T5, T6, T7> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6, T7>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6, T7>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
-    public struct ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest>>, IStructuralComparable, IStructuralEquatable, ITupleInternal where TRest : struct {
+    public struct ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest>>, IStructuralComparable, IStructuralEquatable, ITuple, IValueTupleInternal where TRest : struct {
+        object System.Runtime.CompilerServices.ITuple.this[int index] { get; }
+        int System.Runtime.CompilerServices.ITuple.Length { get; }
     }
 }
 namespace System.Configuration {
+    public abstract class ConfigurationBuilder : ProviderBase {
+        protected ConfigurationBuilder();
+        public virtual ConfigurationSection ProcessConfigurationSection(ConfigurationSection configSection);
+        public virtual XmlNode ProcessRawXml(XmlNode rawXml);
+    }
+    public class ConfigurationBuilderCollection : ProviderCollection {
+        public ConfigurationBuilderCollection();
+        public new ConfigurationBuilder this[string name] { get; }
+        public override void Add(ProviderBase builder);
+    }
+    public class ConfigurationBuilderSettings : ConfigurationElement {
+        public ConfigurationBuilderSettings();
+        public ProviderSettingsCollection Builders { get; }
+        protected internal override ConfigurationPropertyCollection Properties { get; }
+    }
+    public sealed class ConfigurationBuildersSection : ConfigurationSection {
+        public ConfigurationBuildersSection();
+        public ProviderSettingsCollection Builders { get; }
+        public ConfigurationBuilder GetBuilderFromName(string builderName);
+    }
     public sealed class SectionInformation {
+        public ConfigurationBuilder ConfigurationBuilder { get; }
     }
 }
 namespace System.Configuration.Internal {
-    public class DelegatingConfigHost : IInternalConfigHost {
+    public class DelegatingConfigHost : IInternalConfigHost, IInternalConfigurationBuilderHost {
+        protected IInternalConfigurationBuilderHost ConfigBuilderHost { get; }
+        public virtual ConfigurationSection ProcessConfigurationSection(ConfigurationSection configSection, ConfigurationBuilder builder);
+        public virtual XmlNode ProcessRawXml(XmlNode rawXml, ConfigurationBuilder builder);
     }
+    public interface IInternalConfigurationBuilderHost {
+        ConfigurationSection ProcessConfigurationSection(ConfigurationSection configSection, ConfigurationBuilder builder);
+        XmlNode ProcessRawXml(XmlNode rawXml, ConfigurationBuilder builder);
+    }
 }
 namespace System.Data.Common {
+    public abstract class DbColumn {
+        protected DbColumn();
+        public Nullable<bool> AllowDBNull { get; protected set; }
+        public string BaseCatalogName { get; protected set; }
+        public string BaseColumnName { get; protected set; }
+        public string BaseSchemaName { get; protected set; }
+        public string BaseServerName { get; protected set; }
+        public string BaseTableName { get; protected set; }
+        public string ColumnName { get; protected set; }
+        public Nullable<int> ColumnOrdinal { get; protected set; }
+        public Nullable<int> ColumnSize { get; protected set; }
+        public Type DataType { get; protected set; }
+        public string DataTypeName { get; protected set; }
+        public Nullable<bool> IsAliased { get; protected set; }
+        public Nullable<bool> IsAutoIncrement { get; protected set; }
+        public Nullable<bool> IsExpression { get; protected set; }
+        public Nullable<bool> IsHidden { get; protected set; }
+        public Nullable<bool> IsIdentity { get; protected set; }
+        public Nullable<bool> IsKey { get; protected set; }
+        public Nullable<bool> IsLong { get; protected set; }
+        public Nullable<bool> IsReadOnly { get; protected set; }
+        public Nullable<bool> IsUnique { get; protected set; }
+        public virtual object this[string property] { get; }
+        public Nullable<int> NumericPrecision { get; protected set; }
+        public Nullable<int> NumericScale { get; protected set; }
+        public string UdtAssemblyQualifiedName { get; protected set; }
+    }
+    public static class DbDataReaderExtensions {
+        public static bool CanGetColumnSchema(this DbDataReader reader);
+        public static ReadOnlyCollection<DbColumn> GetColumnSchema(this DbDataReader reader);
+    }
+    public interface IDbColumnSchemaGenerator {
+        ReadOnlyCollection<DbColumn> GetColumnSchema();
+    }
 }
 namespace System.Diagnostics {
+    public static class StackFrameExtensions {
+        public static IntPtr GetNativeImageBase(this StackFrame stackFrame);
+        public static IntPtr GetNativeIP(this StackFrame stackFrame);
+        public static bool HasILOffset(this StackFrame stackFrame);
+        public static bool HasMethod(this StackFrame stackFrame);
+        public static bool HasNativeImage(this StackFrame stackFrame);
+        public static bool HasSource(this StackFrame stackFrame);
+    }
 }
 namespace System.Diagnostics.Tracing {
+    public class EventCounter {
+        public EventCounter(string name, EventSource eventSource);
+        public void WriteMetric(float value);
+    }
 }
 namespace System.Globalization {
+    public static class GlobalizationExtensions {
+        public static StringComparer GetStringComparer(this CompareInfo compareInfo, CompareOptions options);
+    }
 }
 namespace System.Linq {
     public static class Enumerable {
+        public static IEnumerable<TSource> Append<TSource>(this IEnumerable<TSource> source, TSource element);
+        public static IEnumerable<TSource> Prepend<TSource>(this IEnumerable<TSource> source, TSource element);
     }
 }
 namespace System.Linq.Expressions {
     public sealed class Expression<TDelegate> : LambdaExpression {
+        public new TDelegate Compile(bool preferInterpretation);
     }
     public abstract class LambdaExpression : Expression {
+        public Delegate Compile(bool preferInterpretation);
     }
 }
 namespace System.Messaging {
     public enum HashAlgorithm {
+        Sha256 = 32780,
+        Sha384 = 32781,
+        Sha512 = 32782,
     }
 }
 namespace System.Net.Http {
     public class HttpClientHandler : HttpMessageHandler {
+        public bool CheckCertificateRevocationList { get; set; }
+        public X509CertificateCollection ClientCertificates { get; }
+        public ICredentials DefaultProxyCredentials { get; set; }
+        public int MaxConnectionsPerServer { get; set; }
+        public int MaxResponseHeadersLength { get; set; }
+        public IDictionary<string, object> Properties { get; }
+        public Func<HttpRequestMessage, X509Certificate2, X509Chain, SslPolicyErrors, bool> ServerCertificateCustomValidationCallback { get; set; }
+        public SslProtocols SslProtocols { get; set; }
     }
 }
 namespace System.Net.Sockets {
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct SocketReceiveFromResult {
+        public int ReceivedBytes;
+        public EndPoint RemoteEndPoint;
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct SocketReceiveMessageFromResult {
+        public IPPacketInformation PacketInformation;
+        public int ReceivedBytes;
+        public EndPoint RemoteEndPoint;
+        public SocketFlags SocketFlags;
+    }
+    public static class SocketTaskExtensions {
+        public static Task<Socket> AcceptAsync(this Socket socket);
+        public static Task<Socket> AcceptAsync(this Socket socket, Socket acceptSocket);
+        public static Task ConnectAsync(this Socket socket, EndPoint remoteEP);
+        public static Task ConnectAsync(this Socket socket, IPAddress address, int port);
+        public static Task ConnectAsync(this Socket socket, IPAddress[] addresses, int port);
+        public static Task ConnectAsync(this Socket socket, string host, int port);
+        public static Task<int> ReceiveAsync(this Socket socket, ArraySegment<byte> buffer, SocketFlags socketFlags);
+        public static Task<int> ReceiveAsync(this Socket socket, IList<ArraySegment<byte>> buffers, SocketFlags socketFlags);
+        public static Task<SocketReceiveFromResult> ReceiveFromAsync(this Socket socket, ArraySegment<byte> buffer, SocketFlags socketFlags, EndPoint remoteEndPoint);
+        public static Task<SocketReceiveMessageFromResult> ReceiveMessageFromAsync(this Socket socket, ArraySegment<byte> buffer, SocketFlags socketFlags, EndPoint remoteEndPoint);
+        public static Task<int> SendAsync(this Socket socket, ArraySegment<byte> buffer, SocketFlags socketFlags);
+        public static Task<int> SendAsync(this Socket socket, IList<ArraySegment<byte>> buffers, SocketFlags socketFlags);
+        public static Task<int> SendToAsync(this Socket socket, ArraySegment<byte> buffer, SocketFlags socketFlags, EndPoint remoteEP);
+    }
 }
 namespace System.Runtime.CompilerServices {
+    public sealed class IsByRefLikeAttribute : Attribute {
+        public IsByRefLikeAttribute();
+    }
+    public sealed class IsReadOnlyAttribute : Attribute {
+        public IsReadOnlyAttribute();
+    }
+    public interface ITuple {
+        object this[int index] { get; }
+        int Length { get; }
+    }
+    public static class RuntimeFeature {
+        public const string PortablePdb = "PortablePdb";
+        public static bool IsSupported(string feature);
+    }
 }
 namespace System.Runtime.InteropServices {
+    public enum Architecture {
+        Arm = 2,
+        Arm64 = 3,
+        X64 = 1,
+        X86 = 0,
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct OSPlatform : IEquatable<OSPlatform> {
+        public static OSPlatform Linux { get; }
+        public static OSPlatform OSX { get; }
+        public static OSPlatform Windows { get; }
+        public static OSPlatform Create(string osPlatform);
+        public override bool Equals(object obj);
+        public bool Equals(OSPlatform other);
+        public override int GetHashCode();
+        public static bool operator ==(OSPlatform left, OSPlatform right);
+        public static bool operator !=(OSPlatform left, OSPlatform right);
+        public override string ToString();
+    }
+    public static class RuntimeInformation {
+        public static string FrameworkDescription { get; }
+        public static Architecture OSArchitecture { get; }
+        public static string OSDescription { get; }
+        public static Architecture ProcessArchitecture { get; }
+        public static bool IsOSPlatform(OSPlatform osPlatform);
+    }
 }
 namespace System.Runtime.Serialization {
+    public static class DataContractSerializerExtensions {
+        public static ISerializationSurrogateProvider GetSerializationSurrogateProvider(this DataContractSerializer serializer);
+        public static void SetSerializationSurrogateProvider(this DataContractSerializer serializer, ISerializationSurrogateProvider provider);
+    }
+    public interface ISerializationSurrogateProvider {
+        object GetDeserializedObject(object obj, Type targetType);
+        object GetObjectToSerialize(object obj, Type targetType);
+        Type GetSurrogateType(Type type);
+    }
 }
 namespace System.Security {
+    public static class SecureStringMarshal {
+        public static IntPtr SecureStringToCoTaskMemAnsi(SecureString s);
+        public static IntPtr SecureStringToCoTaskMemUnicode(SecureString s);
+        public static IntPtr SecureStringToGlobalAllocAnsi(SecureString s);
+        public static IntPtr SecureStringToGlobalAllocUnicode(SecureString s);
+    }
 }
 namespace System.Security.Cryptography {
+    public sealed class IncrementalHash : IDisposable {
+        public HashAlgorithmName AlgorithmName { get; }
+        public void AppendData(byte[] data);
+        public void AppendData(byte[] data, int offset, int count);
+        public static IncrementalHash CreateHash(HashAlgorithmName hashAlgorithm);
+        public static IncrementalHash CreateHMAC(HashAlgorithmName hashAlgorithm, byte[] key);
+        public void Dispose();
+        public byte[] GetHashAndReset();
+    }
 }
 namespace System.ServiceModel.Channels {
     public class NamedPipeTransportBindingElement : ConnectionOrientedTransportBindingElement {
+        public Collection<SecurityIdentifier> AllowedSecurityIdentifiers { get; }
     }
 }
 namespace System.Text.RegularExpressions {
     public class Regex : ISerializable {
+        protected IDictionary CapNames { get; set; }
+        protected IDictionary Caps { get; set; }
     }
 }
 namespace System.Threading {
+    public sealed class PreAllocatedOverlapped : IDeferredDisposable, IDisposable {
+        public PreAllocatedOverlapped(IOCompletionCallback callback, object state, object pinData);
+        public void Dispose();
+    }
+    public sealed class ThreadPoolBoundHandle : IDisposable {
+        public SafeHandle Handle { get; }
+        public unsafe NativeOverlapped* AllocateNativeOverlapped(IOCompletionCallback callback, object state, object pinData);
+        public unsafe NativeOverlapped* AllocateNativeOverlapped(PreAllocatedOverlapped preAllocated);
+        public static ThreadPoolBoundHandle BindHandle(SafeHandle handle);
+        public void Dispose();
+        public unsafe void FreeNativeOverlapped(NativeOverlapped* overlapped);
+        public unsafe static object GetNativeOverlappedState(NativeOverlapped* overlapped);
+    }
 }
 namespace System.Web {
     public class HttpApplication : IComponent, IDisposable, IHttpAsyncHandler, IHttpHandler, IRequestCompletedNotifier, ISyncContext {
+        public void OnExecuteRequestStep(Action<HttpContextBase, Action> callback);
     }
     public sealed class HttpCookie {
+        public static bool TryParse(string input, out HttpCookie result);
     }
 }
 namespace System.Web.Configuration {
     public enum FormsAuthPasswordFormat {
+        SHA256 = 3,
+        SHA384 = 4,
+        SHA512 = 5,
     }
 }
 namespace System.Windows {
     public static class BaseCompatibilityPreferences {
+        public enum HandleDispatcherRequestProcessingFailureOptions {
+            Continue = 0,
+            Reset = 2,
+            Throw = 1,
+        }
+        public static BaseCompatibilityPreferences.HandleDispatcherRequestProcessingFailureOptions HandleDispatcherRequestProcessingFailure { get; set; }
     }
     public static class DependencyPropertyHelper {
+        public static bool IsTemplatedValueDynamic(DependencyObject elementInTemplate, DependencyProperty dependencyProperty);
     }
     public class ResourceDictionary : ICollection, IDictionary, IEnumerable, INameScope, ISupportInitialize, IUriContext {
+        public bool InvalidatesImplicitDataTemplateResources { get; set; }
     }
 }
 namespace System.Windows.Automation {
     public static class AutomationElementIdentifiers {
+        public static readonly AutomationEvent LiveRegionChangedEvent;
+        public static readonly AutomationProperty LiveSettingProperty;
     }
+    public enum AutomationLiveSetting {
+        Assertive = 2,
+        Off = 0,
+        Polite = 1,
+    }
     public static class AutomationProperties {
+        public static readonly DependencyProperty LiveSettingProperty;
+        public static AutomationLiveSetting GetLiveSetting(DependencyObject element);
+        public static void SetLiveSetting(DependencyObject element, AutomationLiveSetting value);
     }
 }
 namespace System.Windows.Automation.Peers {
     public enum AutomationEvents {
+        LiveRegionChanged = 18,
     }
     public abstract class AutomationPeer : DispatcherObject {
+        public AutomationLiveSetting GetLiveSetting();
+        protected virtual AutomationLiveSetting GetLiveSettingCore();
     }
     public class ContentElementAutomationPeer : AutomationPeer {
+        protected override AutomationLiveSetting GetLiveSettingCore();
     }
     public class ExpanderAutomationPeer : FrameworkElementAutomationPeer, IExpandCollapseProvider {
+        protected override List<AutomationPeer> GetChildrenCore();
+        protected override bool HasKeyboardFocusCore();
     }
     public abstract class ItemAutomationPeer : AutomationPeer, IVirtualizedItemProvider {
+        protected override AutomationLiveSetting GetLiveSettingCore();
     }
     public class UIElement3DAutomationPeer : AutomationPeer {
+        protected override AutomationLiveSetting GetLiveSettingCore();
     }
     public class UIElementAutomationPeer : AutomationPeer {
+        protected override AutomationLiveSetting GetLiveSettingCore();
     }
 }
 namespace System.Windows.Controls {
     public class Expander : HeaderedContentControl {
+        public override void OnApplyTemplate();
     }
 }
 namespace System.Windows.Diagnostics {
     public static class VisualDiagnostics {
+        public static void DisableVisualTreeChanged();
+        public static void EnableVisualTreeChanged();
     }
 }
 namespace System.Windows.Forms {
     public class DomainUpDown : UpDownBase {
         public class DomainUpDownAccessibleObject : Control.ControlAccessibleObject {
+            public override string Name { get; set; }
         }
     }
     public class MonthCalendar : Control {
+        protected override AccessibleObject CreateAccessibilityInstance();
     }
     public class ToolStripDropDownButton : ToolStripDropDownItem {
+        protected override AccessibleObject CreateAccessibilityInstance();
     }
 }
 namespace System.Xml.XmlConfiguration {
     public sealed class XmlReaderSection : ConfigurationSection {
+        public string CollapseWhiteSpaceIntoEmptyStringString { get; set; }
     }
 }
 namespace System.Xml.XPath {
+    public static class XDocumentExtensions {
+        public static IXPathNavigable ToXPathNavigable(this XNode node);
+    }
 }
```
