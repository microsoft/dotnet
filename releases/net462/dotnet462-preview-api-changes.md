```diff
 namespace System.Data.SqlClient {
+    public enum PoolBlockingPeriod {
+        AlwaysBlock = 1,
+        Auto = 0,
+        NeverBlock = 2,
+    }
     public sealed class SqlConnection : DbConnection, ICloneable {
+        public static TimeSpan ColumnEncryptionKeyCacheTtl { get; set; }
+        public static bool ColumnEncryptionQueryMetadataCacheEnabled { get; set; }
     }
     public sealed class SqlConnectionStringBuilder : DbConnectionStringBuilder {
+        public PoolBlockingPeriod PoolBlockingPeriod { get; set; }
     }
 }
 namespace System.Diagnostics.Tracing {
-    public abstract class EventListener : IDisposable {
+    public class EventListener : IDisposable {
-        protected EventListener();
+        public EventListener();
-        protected internal abstract void OnEventWritten(EventWrittenEventArgs eventData);
+        protected internal virtual void OnEventWritten(EventWrittenEventArgs eventData);
+        public event EventHandler<EventSourceCreatedEventArgs> EventSourceCreated;
+        public event EventHandler<EventWrittenEventArgs> EventWritten;
     }
     public class EventSource : IDisposable {
+        public event EventHandler<EventCommandEventArgs> EventCommandExecuted;
     }
+    public class EventSourceCreatedEventArgs : EventArgs {
+        public EventSourceCreatedEventArgs();
+        public EventSource EventSource { get; internal set; }
+    }
 }
 namespace System.Security.Cryptography {
+    public sealed class AesCng : Aes {
+        public AesCng();
+        public AesCng(string keyName);
+        public AesCng(string keyName, CngProvider provider);
+        public AesCng(string keyName, CngProvider provider, CngKeyOpenOptions openOptions);
+        public override byte[] Key { get; set; }
+        public override int KeySize { get; set; }
+        public override ICryptoTransform CreateDecryptor();
+        public override ICryptoTransform CreateDecryptor(byte[] rgbKey, byte[] rgbIV);
+        public override ICryptoTransform CreateEncryptor();
+        public override ICryptoTransform CreateEncryptor(byte[] rgbKey, byte[] rgbIV);
+        public override void GenerateIV();
+        public override void GenerateKey();
+    }
     public abstract class DSA : AsymmetricAlgorithm {
+        protected virtual byte[] HashData(byte[] data, int offset, int count, HashAlgorithmName hashAlgorithm);
+        protected virtual byte[] HashData(Stream data, HashAlgorithmName hashAlgorithm);
+        public byte[] SignData(byte[] data, HashAlgorithmName hashAlgorithm);
+        public virtual byte[] SignData(byte[] data, int offset, int count, HashAlgorithmName hashAlgorithm);
+        public virtual byte[] SignData(Stream data, HashAlgorithmName hashAlgorithm);
+        public bool VerifyData(byte[] data, byte[] signature, HashAlgorithmName hashAlgorithm);
+        public virtual bool VerifyData(byte[] data, int offset, int count, byte[] signature, HashAlgorithmName hashAlgorithm);
+        public virtual bool VerifyData(Stream data, byte[] signature, HashAlgorithmName hashAlgorithm);
     }
+    public sealed class DSACng : DSA {
+        public DSACng();
+        public DSACng(CngKey key);
+        public DSACng(int keySize);
+        public CngKey Key { get; private set; }
+        public override string KeyExchangeAlgorithm { get; }
+        public override KeySizes[] LegalKeySizes { get; }
+        public override string SignatureAlgorithm { get; }
+        public override byte[] CreateSignature(byte[] rgbHash);
+        public override DSAParameters ExportParameters(bool includePrivateParameters);
+        public override void ImportParameters(DSAParameters parameters);
+        public override bool VerifySignature(byte[] rgbHash, byte[] rgbSignature);
+    }
     public abstract class ECDiffieHellman : AsymmetricAlgorithm {
+        public byte[] DeriveKeyFromHash(ECDiffieHellmanPublicKey otherPartyPublicKey, HashAlgorithmName hashAlgorithm);
+        public virtual byte[] DeriveKeyFromHash(ECDiffieHellmanPublicKey otherPartyPublicKey, HashAlgorithmName hashAlgorithm, byte[] secretPrepend, byte[] secretAppend);
+        public byte[] DeriveKeyFromHmac(ECDiffieHellmanPublicKey otherPartyPublicKey, HashAlgorithmName hashAlgorithm, byte[] hmacKey);
+        public virtual byte[] DeriveKeyFromHmac(ECDiffieHellmanPublicKey otherPartyPublicKey, HashAlgorithmName hashAlgorithm, byte[] hmacKey, byte[] secretPrepend, byte[] secretAppend);
-        public abstract byte[] DeriveKeyMaterial(ECDiffieHellmanPublicKey otherPartyPublicKey);
+        public virtual byte[] DeriveKeyMaterial(ECDiffieHellmanPublicKey otherPartyPublicKey);
+        public virtual byte[] DeriveKeyTls(ECDiffieHellmanPublicKey otherPartyPublicKey, byte[] prfLabel, byte[] prfSeed);
     }
     public sealed class ECDiffieHellmanCng : ECDiffieHellman {
+        public override byte[] DeriveKeyFromHash(ECDiffieHellmanPublicKey otherPartyPublicKey, HashAlgorithmName hashAlgorithm, byte[] secretPrepend, byte[] secretAppend);
+        public override byte[] DeriveKeyFromHmac(ECDiffieHellmanPublicKey otherPartyPublicKey, HashAlgorithmName hashAlgorithm, byte[] hmacKey, byte[] secretPrepend, byte[] secretAppend);
+        public override byte[] DeriveKeyTls(ECDiffieHellmanPublicKey otherPartyPublicKey, byte[] prfLabel, byte[] prfSeed);
     }
     public abstract class ECDiffieHellmanPublicKey : IDisposable {
-        public abstract string ToXmlString();
+        public virtual string ToXmlString();
     }
+    public sealed class TripleDESCng : TripleDES {
+        public TripleDESCng();
+        public TripleDESCng(string keyName);
+        public TripleDESCng(string keyName, CngProvider provider);
+        public TripleDESCng(string keyName, CngProvider provider, CngKeyOpenOptions openOptions);
+        public override byte[] Key { get; set; }
+        public override int KeySize { get; set; }
+        public override ICryptoTransform CreateDecryptor();
+        public override ICryptoTransform CreateDecryptor(byte[] rgbKey, byte[] rgbIV);
+        public override ICryptoTransform CreateEncryptor();
+        public override ICryptoTransform CreateEncryptor(byte[] rgbKey, byte[] rgbIV);
+        public override void GenerateIV();
+        public override void GenerateKey();
+    }
 }
 namespace System.Security.Cryptography.X509Certificates {
+    public static class DSACertificateExtensions {
+        public static DSA GetDSAPrivateKey(this X509Certificate2 certificate);
+        public static DSA GetDSAPublicKey(this X509Certificate2 certificate);
+    }
 }
 namespace System.Security.Cryptography.Xml {
     public class SignedXml {
+        public const string XmlDsigRSASHA256Url = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256";
+        public const string XmlDsigRSASHA384Url = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha384";
+        public const string XmlDsigRSASHA512Url = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha512";
+        public const string XmlDsigSHA256Url = "http://www.w3.org/2001/04/xmlenc#sha256";
+        public const string XmlDsigSHA384Url = "http://www.w3.org/2001/04/xmldsig-more#sha384";
+        public const string XmlDsigSHA512Url = "http://www.w3.org/2001/04/xmlenc#sha512";
     }
 }
 namespace System.Security.Principal {
     public class WindowsIdentity : ClaimsIdentity, IDeserializationCallback, IDisposable, ISerializable {
-        public static T RunImpersonated<T>(SafeAccessTokenHandle safeAccessTokenHandle, Func<T> func);
+        [MethodImpl(NoInlining)]public static T RunImpersonated<T>(SafeAccessTokenHandle safeAccessTokenHandle, Func<T> func);
-        public static void RunImpersonated(SafeAccessTokenHandle safeAccessTokenHandle, Action action);
+        [MethodImpl(NoInlining)]public static void RunImpersonated(SafeAccessTokenHandle safeAccessTokenHandle, Action action);
     }
 }
 namespace System.Web {
     public sealed class HttpCachePolicy {
+        public DateTime UtcTimestampCreated { get; set; }
+        public HttpCacheability GetCacheability();
+        public string GetCacheExtensions();
+        public string GetETag();
+        public bool GetETagFromFileDependencies();
+        public DateTime GetExpires();
+        public bool GetIgnoreRangeRequests();
+        public bool GetLastModifiedFromFileDependencies();
+        public TimeSpan GetMaxAge();
+        public bool GetNoServerCaching();
+        public bool GetNoStore();
+        public bool GetNoTransforms();
+        public int GetOmitVaryStar();
+        public TimeSpan GetProxyMaxAge();
+        public HttpCacheRevalidation GetRevalidation();
+        public DateTime GetUtcLastModified();
+        public string GetVaryByCustom();
+        public bool HasSlidingExpiration();
+        public bool IsModified();
+        public bool IsValidUntilExpires();
     }
     public sealed class HttpCacheVaryByContentEncodings {
+        public string[] GetContentEncodings();
+        public void SetContentEncodings(string[] contentEncodings);
     }
     public sealed class HttpCacheVaryByHeaders {
+        public string[] GetHeaders();
+        public void SetHeaders(string[] headers);
     }
     public sealed class HttpCacheVaryByParams {
+        public string[] GetParams();
+        public void SetParams(string[] parameters);
     }
 }
 namespace System.Web.Caching {
     public sealed class AggregateCacheDependency : CacheDependency, ICacheDependencyChanged {
+        public override string[] GetFileDependencies();
     }
     public class CacheDependency : IDisposable {
+        public virtual string[] GetFileDependencies();
     }
+    public abstract class OutputCacheProviderAsync : OutputCacheProvider {
+        protected OutputCacheProviderAsync();
+        public abstract Task<object> AddAsync(string key, object entry, DateTime utcExpiry);
+        public abstract Task<object> GetAsync(string key);
+        public abstract Task RemoveAsync(string key);
+        public abstract Task SetAsync(string key, object entry, DateTime utcExpiry);
+    }
+    public static class OutputCacheUtility {
+        public static CacheDependency CreateCacheDependency(HttpResponse response);
+        public static ArrayList GetContentBuffers(HttpResponse response);
+        public static IEnumerable<KeyValuePair<HttpCacheValidateHandler, object>> GetValidationCallbacks(HttpResponse response);
+        public static void SetContentBuffers(HttpResponse response, ArrayList buffers);
+        public static string SetupKernelCaching(string originalCacheUrl, HttpResponse response);
+    }
 }
+namespace System.Web.Globalization {
+    public interface IStringLocalizerProvider {
+        string GetLocalizedString(CultureInfo culture, string name, params object[] arguments);
+    }
+    public sealed class ResourceFileStringLocalizerProvider : IStringLocalizerProvider {
+        public const string ResourceFileName = "DataAnnotation.Localization";
+        public ResourceFileStringLocalizerProvider();
+        public string GetLocalizedString(CultureInfo culture, string name, params object[] arguments);
+    }
+    public static class StringLocalizerProviders {
+        public static IStringLocalizerProvider DataAnnotationStringLocalizerProvider { get; set; }
+    }
+}
 namespace System.Web.ModelBinding {
     public class DataAnnotationsModelValidator : ModelValidator {
+        protected virtual string GetLocalizedErrorMessage(string errorMessage);
+        protected string GetLocalizedString(string name, params object[] arguments);
     }
+    public sealed class MaxLengthAttributeAdapter : DataAnnotationsModelValidator<MaxLengthAttribute> {
+        public MaxLengthAttributeAdapter(ModelMetadata metadata, ModelBindingExecutionContext context, MaxLengthAttribute attribute);
+    }
+    public sealed class MinLengthAttributeAdapter : DataAnnotationsModelValidator<MinLengthAttribute> {
+        public MinLengthAttributeAdapter(ModelMetadata metadata, ModelBindingExecutionContext context, MinLengthAttribute attribute);
+    }
 }
 namespace System.Web.SessionState {
+    public interface ISessionStateModule : IHttpModule {
+        void ReleaseSessionState(HttpContext context);
+        Task ReleaseSessionStateAsync(HttpContext context);
+    }
-    public sealed class SessionStateModule : IHttpModule {
+    public sealed class SessionStateModule : IHttpModule, ISessionStateModule {
+        public void ReleaseSessionState(HttpContext context);
+        public Task ReleaseSessionStateAsync(HttpContext context);
     }
     public static class SessionStateUtility {
+        public static bool IsSessionStateReadOnly(HttpContext context);
+        public static bool IsSessionStateRequired(HttpContext context);
     }
 }
 namespace System.Windows {
+    public sealed class DpiChangedEventArgs : RoutedEventArgs {
+        public DpiScale NewDpi { get; private set; }
+        public DpiScale OldDpi { get; private set; }
+    }
+    public delegate void DpiChangedEventHandler(object sender, DpiChangedEventArgs e); {
+        public DpiChangedEventHandler(object @object, IntPtr method);
+        public virtual IAsyncResult BeginInvoke(object sender, DpiChangedEventArgs e, AsyncCallback callback, object @object);
+        public virtual void EndInvoke(IAsyncResult result);
+        public virtual void Invoke(object sender, DpiChangedEventArgs e);
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct DpiScale {
+        public DpiScale(double dpiScaleX, double dpiScaleY);
+        public double DpiScaleX { get; }
+        public double DpiScaleY { get; }
+        public double PixelsPerDip { get; }
+        public double PixelsPerInchX { get; }
+        public double PixelsPerInchY { get; }
+    }
     public static class FrameworkCompatibilityPreferences {
+        public static bool ShouldThrowOnCopyOrCutFailure { get; set; }
     }
+    public sealed class HwndDpiChangedEventArgs : HandledEventArgs {
+        public DpiScale NewDpi { get; private set; }
+        public DpiScale OldDpi { get; private set; }
+        public Rect SuggestedRect { get; private set; }
+    }
+    public delegate void HwndDpiChangedEventHandler(object sender, HwndDpiChangedEventArgs e); {
+        public HwndDpiChangedEventHandler(object @object, IntPtr method);
+        public virtual IAsyncResult BeginInvoke(object sender, HwndDpiChangedEventArgs e, AsyncCallback callback, object @object);
+        public virtual void EndInvoke(IAsyncResult result);
+        public virtual void Invoke(object sender, HwndDpiChangedEventArgs e);
+    }
     public class Window : ContentControl, IWindowService {
+        public static readonly RoutedEvent DpiChangedEvent;
+        protected override void OnDpiChanged(DpiScale oldDpi, DpiScale newDpi);
+        public event DpiChangedEventHandler DpiChanged;
     }
 }
 namespace System.Windows.Controls {
     public class FlowDocumentReader : Control, IAddChild, IJournalState {
+        protected override void OnDpiChanged(DpiScale oldDpiScaleInfo, DpiScale newDpiScaleInfo);
     }
     public class Image : FrameworkElement, IProvidePropertyFallback, IUriContext {
+        public static readonly RoutedEvent DpiChangedEvent;
+        protected override void OnDpiChanged(DpiScale oldDpi, DpiScale newDpi);
+        public event DpiChangedEventHandler DpiChanged;
     }
     public class RichTextBox : TextBoxBase, IAddChild {
+        protected override void OnDpiChanged(DpiScale oldDpiScaleInfo, DpiScale newDpiScaleInfo);
     }
 }
 namespace System.Windows.Controls.Primitives {
     public class DocumentPageView : FrameworkElement, IDisposable, IServiceProvider {
+        protected override void OnDpiChanged(DpiScale oldDpiScaleInfo, DpiScale newDpiScaleInfo);
     }
     public abstract class DocumentViewerBase : Control, IAddChild, IServiceProvider {
+        protected override void OnDpiChanged(DpiScale oldDpiScaleInfo, DpiScale newDpiScaleInfo);
     }
 }
 namespace System.Windows.Diagnostics {
+    public static class ResourceDictionaryDiagnostics {
+        public static IEnumerable<ResourceDictionaryInfo> GenericResourceDictionaries { get; }
+        public static IEnumerable<ResourceDictionaryInfo> ThemedResourceDictionaries { get; }
+        public static event EventHandler<ResourceDictionaryLoadedEventArgs> GenericResourceDictionaryLoaded;
+        public static event EventHandler<ResourceDictionaryLoadedEventArgs> ThemedResourceDictionaryLoaded;
+        public static event EventHandler<ResourceDictionaryUnloadedEventArgs> ThemedResourceDictionaryUnloaded;
+    }
+    public class ResourceDictionaryInfo {
+        public Assembly Assembly { get; private set; }
+        public ResourceDictionary ResourceDictionary { get; private set; }
+        public Assembly ResourceDictionaryAssembly { get; private set; }
+        public Uri SourceUri { get; private set; }
+    }
+    public class ResourceDictionaryLoadedEventArgs : EventArgs {
+        public ResourceDictionaryInfo ResourceDictionaryInfo { get; private set; }
+    }
+    public class ResourceDictionaryUnloadedEventArgs : EventArgs {
+        public ResourceDictionaryInfo ResourceDictionaryInfo { get; private set; }
+    }
 }
 namespace System.Windows.Documents {
     public class FlowDocument : FrameworkContentElement, IAddChild, IDocumentPaginatorSource, IServiceProvider {
+        public void SetDpi(DpiScale dpiInfo);
     }
 }
 namespace System.Windows.Interop {
     public abstract class HwndHost : FrameworkElement, IDisposable, IKeyboardInputSink, IWin32Window {
+        public static readonly RoutedEvent DpiChangedEvent;
+        protected override void OnDpiChanged(DpiScale oldDpi, DpiScale newDpi);
+        public event DpiChangedEventHandler DpiChanged;
     }
     public class HwndSource : PresentationSource, IDisposable, IKeyboardInputSink, IWin32Window {
+        protected virtual void OnDpiChanged(HwndDpiChangedEventArgs e);
+        public event HwndDpiChangedEventHandler DpiChanged;
     }
 }
 namespace System.Windows.Media {
     public class FormattedText {
+        public FormattedText(string textToFormat, CultureInfo culture, FlowDirection flowDirection, Typeface typeface, double emSize, Brush foreground, double pixelsPerDip);
+        public FormattedText(string textToFormat, CultureInfo culture, FlowDirection flowDirection, Typeface typeface, double emSize, Brush foreground, NumberSubstitution numberSubstitution, double pixelsPerDip);
+        public FormattedText(string textToFormat, CultureInfo culture, FlowDirection flowDirection, Typeface typeface, double emSize, Brush foreground, NumberSubstitution numberSubstitution, TextFormattingMode textFormattingMode, double pixelsPerDip);
+        public double PixelsPerDip { get; set; }
     }
     public class GlyphRun : DUCE.IResource, ISupportInitialize {
+        public GlyphRun(GlyphTypeface glyphTypeface, int bidiLevel, bool isSideways, double renderingEmSize, float pixelsPerDip, IList<ushort> glyphIndices, Point baselineOrigin, IList<double> advanceWidths, IList<Point> glyphOffsets, IList<char> characters, string deviceFontName, IList<ushort> clusterMap, IList<bool> caretStops, XmlLanguage language);
+        public GlyphRun(float pixelsPerDip);
+        public float PixelsPerDip { get; set; }
     }
     public abstract class Visual : DependencyObject, DUCE.IResource {
+        protected virtual void OnDpiChanged(DpiScale oldDpi, DpiScale newDpi);
     }
     public static class VisualTreeHelper {
+        public static DpiScale GetDpi(Visual visual);
+        public static void SetRootDpi(Visual visual, DpiScale dpiInfo);
     }
 }
 namespace System.Windows.Media.TextFormatting {
     public abstract class TextLine : IDisposable, ITextMetrics {
+        protected TextLine(double pixelsPerDip);
+        public double PixelsPerDip { get; set; }
     }
     public abstract class TextRunProperties {
+        public double PixelsPerDip { get; set; }
     }
     public abstract class TextSource {
+        public double PixelsPerDip { get; set; }
     }
 }
 namespace Microsoft.JScript {
     public sealed class LenientMathObject : MathObject {
-        public const double SQRT2 = 1.4142135623730952;
+        public const double SQRT2 = 1.4142135623730951;
     }
     public class MathObject : JSObject {
-        public const double SQRT2 = 1.4142135623730952;
+        public const double SQRT2 = 1.4142135623730951;
     }
 }
-namespace Microsoft.VisualC {
-    public sealed class DebugInfoInPDBAttribute : Attribute {
-        public DebugInfoInPDBAttribute();
-    }
-    public sealed class DecoratedNameAttribute : Attribute {
-        public DecoratedNameAttribute();
-        public DecoratedNameAttribute(string decoratedName);
-    }
-    public sealed class IsConstModifier {
-        public IsConstModifier();
-    }
-    public sealed class IsCXXReferenceModifier {
-        public IsCXXReferenceModifier();
-    }
-    public sealed class IsLongModifier {
-        public IsLongModifier();
-    }
-    public sealed class IsSignedModifier {
-        public IsSignedModifier();
-    }
-    public sealed class IsVolatileModifier {
-        public IsVolatileModifier();
-    }
-    public sealed class MiscellaneousBitsAttribute : Attribute {
-        public int m_dwAttrs;
-        public MiscellaneousBitsAttribute(int miscellaneousBits);
-    }
-    public sealed class NeedsCopyConstructorModifier {
-        public NeedsCopyConstructorModifier();
-    }
-    public sealed class NoSignSpecifiedModifier {
-        public NoSignSpecifiedModifier();
-    }
-}
-namespace Microsoft.VisualC.StlClr {
-    public delegate TResult BinaryDelegate<TArg1, TArg2, TResult>(TArg1 A_0, TArg2 A_1); {
-        [MethodImpl(ForwardRef)]public BinaryDelegate(object A_0, IntPtr A_1);
-        [MethodImpl(ForwardRef)]public IAsyncResult BeginInvoke(TArg1 __unnamed000, TArg2 __unnamed001, AsyncCallback callback, object obj);
-        [MethodImpl(ForwardRef)]public TResult EndInvoke(IAsyncResult result);
-        [MethodImpl(ForwardRef)]public TResult Invoke(TArg1 A_0, TArg2 A_1);
-    }
-    public class DequeEnumerator<TValue> : DequeEnumeratorBase<TValue>, IEnumerator<TValue> {
-        public DequeEnumerator(IDeque<TValue> _Cont, int _First);
-        public virtual new TValue Current { get; set; }
-        public sealed override void Dispose();
-        protected virtual void Dispose(bool A_0);
-        public override bool MoveNext();
-        public override void Reset();
-    }
-    public class DequeEnumeratorBase<TValue> : IEnumerator {
-        public DequeEnumeratorBase(IDeque<TValue> _Cont, int _First);
-        public virtual object Current { get; set; }
-        public virtual bool MoveNext();
-        public virtual void Reset();
-    }
-    public class GenericPair<TValue1, TValue2> {
-        public TValue1 first;
-        public TValue2 second;
-        public GenericPair();
-        public GenericPair(GenericPair<TValue1, TValue2> _Right);
-        public GenericPair(ref KeyValuePair<TValue1, TValue2> _Right);
-        public GenericPair(TValue1 _Val1);
-        public GenericPair(TValue1 _Val1, TValue2 _Val2);
-        public override bool Equals(object _Right_arg);
-        public GenericPair<TValue1, TValue2> op_Assign(GenericPair<TValue1, TValue2> _Right);
-        public void swap(GenericPair<TValue1, TValue2> _Right);
-    }
-    public class HashEnumerator<TKey, TValue> : HashEnumeratorBase<TKey, TValue>, IEnumerator<TValue> {
-        public HashEnumerator(INode<TValue> _First);
-        public virtual new TValue Current { get; set; }
-        public sealed override void Dispose();
-        protected virtual void Dispose(bool A_0);
-        public override bool MoveNext();
-        public override void Reset();
-    }
-    public class HashEnumeratorBase<TKey, TValue> : IEnumerator {
-        public HashEnumeratorBase(INode<TValue> _First);
-        public virtual object Current { get; set; }
-        public virtual bool MoveNext();
-        public virtual void Reset();
-    }
-    public interface IDeque<TValue> : ICloneable, ICollection, IEnumerable, IRandomAccessContainer<TValue> {
-        TValue back_item { get; set; }
-        TValue front_item { get; set; }
-        TValue this[int _Pos] { get; set; }
-        void assign(IEnumerable _Right);
-        void assign(IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        void assign(int _Count, TValue _Val);
-        TValue at(int _Pos);
-        TValue back();
-        void begin(ref ContainerRandomAccessIterator<TValue> );
-        int begin_bias();
-        void clear();
-        bool empty();
-        void end(ref ContainerRandomAccessIterator<TValue> );
-        int end_bias();
-        void erase(ref ContainerRandomAccessIterator<TValue> , ContainerRandomAccessIterator<TValue> _Where);
-        void erase(ref ContainerRandomAccessIterator<TValue> , ContainerRandomAccessIterator<TValue> _First_iter, ContainerRandomAccessIterator<TValue> _Last_iter);
-        TValue front();
-        uint get_generation();
-        void insert(ContainerRandomAccessIterator<TValue> _Where_iter, IEnumerable _Right);
-        void insert(ContainerRandomAccessIterator<TValue> _Where, int _Count, TValue _Val);
-        void insert(ref ContainerRandomAccessIterator<TValue> , ContainerRandomAccessIterator<TValue> _Where, TValue _Val);
-        void insert(ContainerRandomAccessIterator<TValue> _Where, IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        void pop_back();
-        void pop_front();
-        void push_back(TValue _Val);
-        void push_front(TValue _Val);
-        void rbegin(ref ReverseRandomAccessIterator<TValue> );
-        void rend(ref ReverseRandomAccessIterator<TValue> );
-        void resize(int _Newsize);
-        void resize(int _Newsize, TValue _Val);
-        int size();
-        void swap(IDeque<TValue> A_0);
-    }
-    public interface IHash<TKey, TValue> : IBidirectionalContainer<TValue>, ICloneable, ICollection, IEnumerable {
-        void begin(ref ContainerBidirectionalIterator<TValue> );
-        int bucket_count();
-        void clear();
-        int count(TKey _Keyval);
-        bool empty();
-        void end(ref ContainerBidirectionalIterator<TValue> );
-        void equal_range(ref GenericPair<ContainerBidirectionalIterator<TValue>, ContainerBidirectionalIterator<TValue>> , TKey _Keyval);
-        void erase(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _Where);
-        void erase(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _First_iter, ContainerBidirectionalIterator<TValue> _Last_iter);
-        int erase(TKey _Keyval);
-        void find(ref ContainerBidirectionalIterator<TValue> , TKey _Keyval);
-        UnaryDelegate<TKey, int> hash_delegate();
-        void insert(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _Where, TValue _Val);
-        void insert(ref GenericPair<ContainerBidirectionalIterator<TValue>, bool> , TValue _Val);
-        void insert(IEnumerable _Right);
-        void insert(IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        BinaryDelegate<TKey, TKey, bool> key_comp();
-        float load_factor();
-        void lower_bound(ref ContainerBidirectionalIterator<TValue> , TKey _Keyval);
-        float max_load_factor();
-        void max_load_factor(float _Newmax);
-        void rbegin(ref ReverseBidirectionalIterator<TValue> );
-        void rehash(int _Buckets);
-        void rend(ref ReverseBidirectionalIterator<TValue> );
-        int size();
-        void swap(IHash<TKey, TValue> _Right);
-        void upper_bound(ref ContainerBidirectionalIterator<TValue> , TKey _Keyval);
-        BinaryDelegate<TValue, TValue, bool> value_comp();
-    }
-    public interface IList<TValue> : IBidirectionalContainer<TValue>, ICloneable, ICollection, IEnumerable {
-        TValue back_item { get; set; }
-        TValue front_item { get; set; }
-        void assign(IEnumerable _Right);
-        void assign(IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        void assign(int _Count, TValue _Val);
-        TValue back();
-        void begin(ref ContainerBidirectionalIterator<TValue> );
-        void clear();
-        bool empty();
-        void end(ref ContainerBidirectionalIterator<TValue> );
-        void erase(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _Where);
-        void erase(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _First_iter, ContainerBidirectionalIterator<TValue> _Last_iter);
-        TValue front();
-        void insert(ContainerBidirectionalIterator<TValue> _Where_iter, IEnumerable _Right);
-        void insert(ContainerBidirectionalIterator<TValue> _Where, int _Count, TValue _Val);
-        void insert(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _Where, TValue _Val);
-        void insert(ContainerBidirectionalIterator<TValue> _Where, IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        void merge(IList<TValue> _Right, BinaryDelegate<TValue, TValue, bool> _Pred);
-        void pop_back();
-        void pop_front();
-        void push_back(TValue _Val);
-        void push_front(TValue _Val);
-        void rbegin(ref ReverseBidirectionalIterator<TValue> );
-        void remove(TValue _Val);
-        void remove_if(UnaryDelegate<TValue, bool> _Pred);
-        void rend(ref ReverseBidirectionalIterator<TValue> );
-        void resize(int _Newsize);
-        void resize(int _Newsize, TValue _Val);
-        void reverse();
-        int size();
-        void sort(BinaryDelegate<TValue, TValue, bool> _Pred);
-        void splice(ContainerBidirectionalIterator<TValue> _Where, IList<TValue> _Right);
-        void splice(ContainerBidirectionalIterator<TValue> _Where, IList<TValue> _Right, ContainerBidirectionalIterator<TValue> _First);
-        void splice(ContainerBidirectionalIterator<TValue> _Where, IList<TValue> _Right, ContainerBidirectionalIterator<TValue> _First, ContainerBidirectionalIterator<TValue> _Last);
-        void swap(IList<TValue> _Right);
-        void unique(BinaryDelegate<TValue, TValue, bool> _Pred);
-    }
-    public interface IPriorityQueue<TValue, TCont> : ICloneable {
-        TValue top_item { get; set; }
-        void assign(IPriorityQueue<TValue, TCont> _Right);
-        bool empty();
-        TCont get_container();
-        void pop();
-        void push(TValue _Val);
-        int size();
-        TValue top();
-        BinaryDelegate<TValue, TValue, bool> value_comp();
-    }
-    public interface IQueue<TValue, TCont> : ICloneable {
-        void assign(IQueue<TValue, TCont> _Right);
-        TValue back();
-        bool empty();
-        TValue front();
-        TCont get_container();
-        void pop();
-        void push(TValue _Val);
-        int size();
-    }
-    public interface IStack<TValue, TCont> : ICloneable {
-        TValue top_item { get; set; }
-        void assign(IStack<TValue, TCont> _Right);
-        bool empty();
-        TCont get_container();
-        void pop();
-        void push(TValue _Val);
-        int size();
-        TValue top();
-    }
-    public interface ITree<TKey, TValue> : IBidirectionalContainer<TValue>, ICloneable, ICollection, IEnumerable {
-        void begin(ref ContainerBidirectionalIterator<TValue> );
-        void clear();
-        int count(TKey _Keyval);
-        bool empty();
-        void end(ref ContainerBidirectionalIterator<TValue> );
-        void equal_range(ref GenericPair<ContainerBidirectionalIterator<TValue>, ContainerBidirectionalIterator<TValue>> , TKey _Keyval);
-        void erase(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _Where);
-        void erase(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _First_iter, ContainerBidirectionalIterator<TValue> _Last_iter);
-        int erase(TKey _Keyval);
-        void find(ref ContainerBidirectionalIterator<TValue> , TKey _Keyval);
-        void insert(ref ContainerBidirectionalIterator<TValue> , ContainerBidirectionalIterator<TValue> _Where, TValue _Val);
-        void insert(ref GenericPair<ContainerBidirectionalIterator<TValue>, bool> , TValue _Val);
-        void insert(IEnumerable<TValue> _Right);
-        void insert(IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        BinaryDelegate<TKey, TKey, bool> key_comp();
-        void lower_bound(ref ContainerBidirectionalIterator<TValue> , TKey _Keyval);
-        void rbegin(ref ReverseBidirectionalIterator<TValue> );
-        void rend(ref ReverseBidirectionalIterator<TValue> );
-        int size();
-        void swap(ITree<TKey, TValue> _Right);
-        void upper_bound(ref ContainerBidirectionalIterator<TValue> , TKey _Keyval);
-        BinaryDelegate<TValue, TValue, bool> value_comp();
-    }
-    public interface IVector<TValue> : ICloneable, ICollection, IEnumerable, IRandomAccessContainer<TValue> {
-        TValue back_item { get; set; }
-        TValue front_item { get; set; }
-        TValue this[int _Pos] { get; set; }
-        void assign(IEnumerable _Right);
-        void assign(IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        void assign(int _Count, TValue _Val);
-        TValue at(int _Pos);
-        TValue back();
-        void begin(ref ContainerRandomAccessIterator<TValue> );
-        int capacity();
-        void clear();
-        bool empty();
-        void end(ref ContainerRandomAccessIterator<TValue> );
-        void erase(ref ContainerRandomAccessIterator<TValue> , ContainerRandomAccessIterator<TValue> _Where);
-        void erase(ref ContainerRandomAccessIterator<TValue> , ContainerRandomAccessIterator<TValue> _First_iter, ContainerRandomAccessIterator<TValue> _Last_iter);
-        TValue front();
-        uint get_generation();
-        void insert(ContainerRandomAccessIterator<TValue> _Where_iter, IEnumerable _Right);
-        void insert(ContainerRandomAccessIterator<TValue> _Where, int _Count, TValue _Val);
-        void insert(ref ContainerRandomAccessIterator<TValue> , ContainerRandomAccessIterator<TValue> _Where, TValue _Val);
-        void insert(ContainerRandomAccessIterator<TValue> _Where, IInputIterator<TValue> _First, IInputIterator<TValue> _Last);
-        void pop_back();
-        void push_back(TValue _Val);
-        void rbegin(ref ReverseRandomAccessIterator<TValue> );
-        void rend(ref ReverseRandomAccessIterator<TValue> );
-        void reserve(int _Capacity);
-        void resize(int _Newsize);
-        void resize(int _Newsize, TValue _Val);
-        int size();
-        void swap(IVector<TValue> A_0);
-    }
-    public class ListEnumerator<TValue> : ListEnumeratorBase<TValue>, IEnumerator<TValue> {
-        public ListEnumerator(INode<TValue> _First);
-        public virtual new TValue Current { get; set; }
-        public sealed override void Dispose();
-        protected virtual void Dispose(bool A_0);
-        public override bool MoveNext();
-        public override void Reset();
-    }
-    public class ListEnumeratorBase<TValue> : IEnumerator {
-        public ListEnumeratorBase(INode<TValue> _First);
-        public virtual object Current { get; set; }
-        public virtual bool MoveNext();
-        public virtual void Reset();
-    }
-    public class TreeEnumerator<TKey, TValue> : TreeEnumeratorBase<TKey, TValue>, IEnumerator<TValue> {
-        public TreeEnumerator(INode<TValue> _First);
-        public virtual new TValue Current { get; set; }
-        public sealed override void Dispose();
-        protected virtual void Dispose(bool A_0);
-        public override bool MoveNext();
-        public override void Reset();
-    }
-    public class TreeEnumeratorBase<TKey, TValue> : IEnumerator {
-        public TreeEnumeratorBase(INode<TValue> _First);
-        public virtual object Current { get; set; }
-        public virtual bool MoveNext();
-        public virtual void Reset();
-    }
-    public delegate TResult UnaryDelegate<TArg, TResult>(TArg A_0); {
-        [MethodImpl(ForwardRef)]public UnaryDelegate(object A_0, IntPtr A_1);
-        [MethodImpl(ForwardRef)]public IAsyncResult BeginInvoke(TArg __unnamed000, AsyncCallback callback, object obj);
-        [MethodImpl(ForwardRef)]public TResult EndInvoke(IAsyncResult result);
-        [MethodImpl(ForwardRef)]public TResult Invoke(TArg A_0);
-    }
-    public class VectorEnumerator<TValue> : VectorEnumeratorBase<TValue>, IEnumerator<TValue> {
-        public VectorEnumerator(IVector<TValue> _Cont, int _First);
-        public virtual new TValue Current { get; set; }
-        public sealed override void Dispose();
-        protected virtual void Dispose(bool A_0);
-        public override bool MoveNext();
-        public override void Reset();
-    }
-    public class VectorEnumeratorBase<TValue> : IEnumerator {
-        public VectorEnumeratorBase(IVector<TValue> _Cont, int _First);
-        public virtual object Current { get; set; }
-        public virtual bool MoveNext();
-        public virtual void Reset();
-    }
-}
-namespace Microsoft.VisualC.StlClr.Generic {
-    public class ConstContainerBidirectionalIterator<TValue> : IBidirectionalIterator<TValue> {
-        public ConstContainerBidirectionalIterator();
-        public ConstContainerBidirectionalIterator(ConstContainerBidirectionalIterator<TValue> _Right);
-        public ConstContainerBidirectionalIterator(ContainerBidirectionalIterator<TValue> _Right);
-        public ConstContainerBidirectionalIterator(INode<TValue> _Node);
-        public virtual object Clone();
-        public virtual object container();
-        public bool equal_to(ConstContainerBidirectionalIterator<TValue> _Right);
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public virtual void next();
-        public ConstContainerBidirectionalIterator<TValue> op_Assign(ConstContainerBidirectionalIterator<TValue> _Right);
-        public ConstContainerBidirectionalIterator<TValue> op_Assign(ContainerBidirectionalIterator<TValue> _Right);
-        public void operator --(ref ConstContainerBidirectionalIterator<TValue> );
-        public void operator --(ref ConstContainerBidirectionalIterator<TValue> , int A_0);
-        public bool operator ==(ConstContainerBidirectionalIterator<TValue> _Right);
-        public bool operator ==(IInputIterator<TValue> _Right);
-        public implicit operator IBidirectionalIterator<TValue> ();
-        public void operator ++(ref ConstContainerBidirectionalIterator<TValue> );
-        public void operator ++(ref ConstContainerBidirectionalIterator<TValue> , int A_0);
-        public bool operator !=(ConstContainerBidirectionalIterator<TValue> _Right);
-        public bool operator !=(IInputIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ConstContainerBidirectionalIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ConstContainerBidirectionalIterator<TValue> _Left);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-    public class ConstContainerRandomAccessIterator<TValue> : IRandomAccessIterator<TValue> {
-        public ConstContainerRandomAccessIterator();
-        public ConstContainerRandomAccessIterator(ConstContainerRandomAccessIterator<TValue> _Right);
-        public ConstContainerRandomAccessIterator(ContainerRandomAccessIterator<TValue> _Right);
-        public ConstContainerRandomAccessIterator(IRandomAccessContainer<TValue> _Cont, int _Offset);
-        public TValue this[int _Pos] { get; }
-        public virtual object Clone();
-        public virtual object container();
-        public int distance(ConstContainerRandomAccessIterator<TValue> _Right);
-        public virtual int distance(IRandomAccessIterator<TValue> _Right);
-        public bool equal_to(ConstContainerRandomAccessIterator<TValue> _Right);
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public bool less_than(ConstContainerRandomAccessIterator<TValue> _Right);
-        public virtual bool less_than(IRandomAccessIterator<TValue> _Right);
-        public virtual int move(int _Offset);
-        public virtual void next();
-        public void operator +(ref ConstContainerRandomAccessIterator<TValue> , int _Right);
-        public static void operator +(ref ConstContainerRandomAccessIterator<TValue> , int _Left, ConstContainerRandomAccessIterator<TValue> _Right);
-        public ConstContainerRandomAccessIterator<TValue> op_Assign(ConstContainerRandomAccessIterator<TValue> _Right);
-        public ConstContainerRandomAccessIterator<TValue> op_Assign(ContainerRandomAccessIterator<TValue> _Right);
-        public void operator --(ref ConstContainerRandomAccessIterator<TValue> );
-        public void operator --(ref ConstContainerRandomAccessIterator<TValue> , int A_0);
-        public bool operator ==(ConstContainerRandomAccessIterator<TValue> _Right);
-        public bool operator ==(IInputIterator<TValue> _Right);
-        public bool operator >(ConstContainerRandomAccessIterator<TValue> _Right);
-        public static bool operator >(IRandomAccessIterator<TValue> _Left, ConstContainerRandomAccessIterator<TValue> _Right);
-        public bool operator >=(ConstContainerRandomAccessIterator<TValue> _Right);
-        public bool operator >=(IRandomAccessIterator<TValue> _Right);
-        public implicit operator IRandomAccessIterator<TValue> ();
-        public void operator ++(ref ConstContainerRandomAccessIterator<TValue> );
-        public void operator ++(ref ConstContainerRandomAccessIterator<TValue> , int A_0);
-        public bool operator !=(ConstContainerRandomAccessIterator<TValue> _Right);
-        public bool operator !=(IInputIterator<TValue> _Right);
-        public bool operator <(ConstContainerRandomAccessIterator<TValue> _Right);
-        public bool operator <(IRandomAccessIterator<TValue> _Right);
-        public bool operator <=(ConstContainerRandomAccessIterator<TValue> _Right);
-        public static bool operator <=(IRandomAccessIterator<TValue> _Left, ConstContainerRandomAccessIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ConstContainerRandomAccessIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ConstContainerRandomAccessIterator<TValue> _Left);
-        public void operator -(ref ConstContainerRandomAccessIterator<TValue> , int _Right);
-        public int operator -(IRandomAccessIterator<TValue> _Right);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-    public class ConstReverseBidirectionalIterator<TValue> : IBidirectionalIterator<TValue> {
-        public ConstReverseBidirectionalIterator();
-        public ConstReverseBidirectionalIterator(ConstReverseBidirectionalIterator<TValue> _Right);
-        public ConstReverseBidirectionalIterator(IBidirectionalIterator<TValue> _Iter);
-        public ConstReverseBidirectionalIterator(ReverseBidirectionalIterator<TValue> _Iter);
-        public IBidirectionalIterator<TValue> base();
-        public virtual object Clone();
-        public virtual object container();
-        public bool equal_to(ConstReverseBidirectionalIterator<TValue> _Right);
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public virtual void next();
-        public ConstReverseBidirectionalIterator<TValue> op_Assign(ConstReverseBidirectionalIterator<TValue> _Right);
-        public ConstReverseBidirectionalIterator<TValue> op_Assign(ReverseBidirectionalIterator<TValue> _Right);
-        public void operator --(ref ConstReverseBidirectionalIterator<TValue> );
-        public void operator --(ref ConstReverseBidirectionalIterator<TValue> , int A_0);
-        public bool operator ==(ConstReverseBidirectionalIterator<TValue> _Right);
-        public bool operator ==(IInputIterator<TValue> _Right);
-        public implicit operator IBidirectionalIterator<TValue> ();
-        public void operator ++(ref ConstReverseBidirectionalIterator<TValue> );
-        public void operator ++(ref ConstReverseBidirectionalIterator<TValue> , int A_0);
-        public bool operator !=(ConstReverseBidirectionalIterator<TValue> _Right);
-        public bool operator !=(IInputIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ConstReverseBidirectionalIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ConstReverseBidirectionalIterator<TValue> _Left);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-    public class ConstReverseRandomAccessIterator<TValue> : IRandomAccessIterator<TValue> {
-        public ConstReverseRandomAccessIterator();
-        public ConstReverseRandomAccessIterator(ConstReverseRandomAccessIterator<TValue> _Right);
-        public ConstReverseRandomAccessIterator(IRandomAccessIterator<TValue> _Iter);
-        public ConstReverseRandomAccessIterator(ReverseRandomAccessIterator<TValue> _Iter);
-        public TValue this[int _Pos] { get; }
-        public IRandomAccessIterator<TValue> base();
-        public virtual object Clone();
-        public virtual object container();
-        public int distance(ConstReverseRandomAccessIterator<TValue> _Right);
-        public virtual int distance(IRandomAccessIterator<TValue> _Right);
-        public bool equal_to(ConstReverseRandomAccessIterator<TValue> _Right);
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public bool less_than(ConstReverseRandomAccessIterator<TValue> _Right);
-        public virtual bool less_than(IRandomAccessIterator<TValue> _Right);
-        public virtual int move(int _Offset);
-        public virtual void next();
-        public void operator +(ref ConstReverseRandomAccessIterator<TValue> , int _Right);
-        public static void operator +(ref ConstReverseRandomAccessIterator<TValue> , int _Left, ConstReverseRandomAccessIterator<TValue> _Right);
-        public ConstReverseRandomAccessIterator<TValue> op_Assign(ConstReverseRandomAccessIterator<TValue> _Right);
-        public ConstReverseRandomAccessIterator<TValue> op_Assign(ReverseRandomAccessIterator<TValue> _Right);
-        public void operator --(ref ConstReverseRandomAccessIterator<TValue> );
-        public void operator --(ref ConstReverseRandomAccessIterator<TValue> , int A_0);
-        public bool operator ==(ConstReverseRandomAccessIterator<TValue> _Right);
-        public bool operator >(ConstReverseRandomAccessIterator<TValue> _Right);
-        public bool operator >=(ConstReverseRandomAccessIterator<TValue> _Right);
-        public implicit operator IRandomAccessIterator<TValue> ();
-        public void operator ++(ref ConstReverseRandomAccessIterator<TValue> );
-        public void operator ++(ref ConstReverseRandomAccessIterator<TValue> , int A_0);
-        public bool operator !=(ConstReverseRandomAccessIterator<TValue> _Right);
-        public bool operator <(ConstReverseRandomAccessIterator<TValue> _Right);
-        public bool operator <=(ConstReverseRandomAccessIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ConstReverseRandomAccessIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ConstReverseRandomAccessIterator<TValue> _Left);
-        public void operator -(ref ConstReverseRandomAccessIterator<TValue> , int _Right);
-        public int operator -(IRandomAccessIterator<TValue> _Right);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-    public class ContainerBidirectionalIterator<TValue> : IBidirectionalIterator<TValue> {
-        public ContainerBidirectionalIterator();
-        public ContainerBidirectionalIterator(ContainerBidirectionalIterator<TValue> _Right);
-        public ContainerBidirectionalIterator(INode<TValue> _Node);
-        public virtual object Clone();
-        public virtual object container();
-        public bool equal_to(ContainerBidirectionalIterator<TValue> _Right);
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public virtual void next();
-        public ContainerBidirectionalIterator<TValue> op_Assign(ContainerBidirectionalIterator<TValue> _Right);
-        public void operator --(ref ContainerBidirectionalIterator<TValue> );
-        public void operator --(ref ContainerBidirectionalIterator<TValue> , int A_0);
-        public bool operator ==(ContainerBidirectionalIterator<TValue> _Right);
-        public bool operator ==(IInputIterator<TValue> _Right);
-        public implicit operator IBidirectionalIterator<TValue> ();
-        public void operator ++(ref ContainerBidirectionalIterator<TValue> );
-        public void operator ++(ref ContainerBidirectionalIterator<TValue> , int A_0);
-        public bool operator !=(ContainerBidirectionalIterator<TValue> _Right);
-        public bool operator !=(IInputIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ContainerBidirectionalIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ContainerBidirectionalIterator<TValue> _Left);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-    public class ContainerRandomAccessIterator<TValue> : IRandomAccessIterator<TValue> {
-        public ContainerRandomAccessIterator();
-        public ContainerRandomAccessIterator(ContainerRandomAccessIterator<TValue> _Right);
-        public ContainerRandomAccessIterator(IRandomAccessContainer<TValue> _Cont, int _Offset);
-        public TValue this[int _Pos] { get; set; }
-        public virtual object Clone();
-        public virtual object container();
-        public int distance(ContainerRandomAccessIterator<TValue> _Right);
-        public virtual int distance(IRandomAccessIterator<TValue> _Right);
-        public bool equal_to(ContainerRandomAccessIterator<TValue> _Right);
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public bool less_than(ContainerRandomAccessIterator<TValue> _Right);
-        public virtual bool less_than(IRandomAccessIterator<TValue> _Right);
-        public virtual int move(int _Offset);
-        public virtual void next();
-        public void operator +(ref ContainerRandomAccessIterator<TValue> , int _Right);
-        public static void operator +(ref ContainerRandomAccessIterator<TValue> , int _Left, ContainerRandomAccessIterator<TValue> _Right);
-        public ContainerRandomAccessIterator<TValue> op_Assign(ContainerRandomAccessIterator<TValue> _Right);
-        public void operator --(ref ContainerRandomAccessIterator<TValue> );
-        public void operator --(ref ContainerRandomAccessIterator<TValue> , int A_0);
-        public bool operator ==(ContainerRandomAccessIterator<TValue> _Right);
-        public bool operator ==(IInputIterator<TValue> _Right);
-        public bool operator >(ContainerRandomAccessIterator<TValue> _Right);
-        public static bool operator >(IRandomAccessIterator<TValue> _Left, ContainerRandomAccessIterator<TValue> _Right);
-        public bool operator >=(ContainerRandomAccessIterator<TValue> _Right);
-        public bool operator >=(IRandomAccessIterator<TValue> _Right);
-        public implicit operator IRandomAccessIterator<TValue> ();
-        public void operator ++(ref ContainerRandomAccessIterator<TValue> );
-        public void operator ++(ref ContainerRandomAccessIterator<TValue> , int A_0);
-        public bool operator !=(ContainerRandomAccessIterator<TValue> _Right);
-        public bool operator !=(IInputIterator<TValue> _Right);
-        public bool operator <(ContainerRandomAccessIterator<TValue> _Right);
-        public bool operator <(IRandomAccessIterator<TValue> _Right);
-        public bool operator <=(ContainerRandomAccessIterator<TValue> _Right);
-        public static bool operator <=(IRandomAccessIterator<TValue> _Left, ContainerRandomAccessIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ContainerRandomAccessIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ContainerRandomAccessIterator<TValue> _Left);
-        public void operator -(ref ContainerRandomAccessIterator<TValue> , int _Right);
-        public int operator -(IRandomAccessIterator<TValue> _Right);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-    public interface IBaseIterator<TValue> : ICloneable {
-        object container();
-        int get_bias();
-        object get_node();
-        void next();
-        bool valid();
-    }
-    public interface IBidirectionalContainer<TValue> {
-        uint get_generation();
-    }
-    public interface IBidirectionalIterator<TValue> : IForwardIterator<TValue> {
-        void prev();
-    }
-    public interface IForwardIterator<TValue> : IInputIterator<TValue>, IOutputIterator<TValue>
-    public interface IInputIterator<TValue> : IBaseIterator<TValue> {
-        bool equal_to(IInputIterator<TValue> A_0);
-        TValue get_cref();
-    }
-    public interface INode<TValue> {
-        TValue _Value { get; set; }
-        IBidirectionalContainer<TValue> container();
-        bool is_head();
-        INode<TValue> next_node();
-        INode<TValue> prev_node();
-    }
-    public interface IOutputIterator<TValue> : IBaseIterator<TValue> {
-        TValue get_ref();
-    }
-    public interface IRandomAccessContainer<TValue> {
-        TValue at_bias(int A_0);
-        bool valid_bias(int A_0);
-    }
-    public interface IRandomAccessIterator<TValue> : IBidirectionalIterator<TValue> {
-        int distance(IRandomAccessIterator<TValue> _Right);
-        bool less_than(IRandomAccessIterator<TValue> _Right);
-        int move(int _Offset);
-    }
-    public class ReverseBidirectionalIterator<TValue> : IBidirectionalIterator<TValue> {
-        public ReverseBidirectionalIterator();
-        public ReverseBidirectionalIterator(IBidirectionalIterator<TValue> _Iter);
-        public ReverseBidirectionalIterator(ReverseBidirectionalIterator<TValue> _Right);
-        public IBidirectionalIterator<TValue> base();
-        public virtual object Clone();
-        public virtual object container();
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public bool equal_to(ReverseBidirectionalIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public virtual void next();
-        public ReverseBidirectionalIterator<TValue> op_Assign(ReverseBidirectionalIterator<TValue> _Right);
-        public void operator --(ref ReverseBidirectionalIterator<TValue> );
-        public void operator --(ref ReverseBidirectionalIterator<TValue> , int A_0);
-        public bool operator ==(IInputIterator<TValue> _Right);
-        public bool operator ==(ReverseBidirectionalIterator<TValue> _Right);
-        public implicit operator IBidirectionalIterator<TValue> ();
-        public void operator ++(ref ReverseBidirectionalIterator<TValue> );
-        public void operator ++(ref ReverseBidirectionalIterator<TValue> , int A_0);
-        public bool operator !=(IInputIterator<TValue> _Right);
-        public bool operator !=(ReverseBidirectionalIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ReverseBidirectionalIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ReverseBidirectionalIterator<TValue> _Left);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-    public class ReverseRandomAccessIterator<TValue> : IRandomAccessIterator<TValue> {
-        public ReverseRandomAccessIterator();
-        public ReverseRandomAccessIterator(IRandomAccessIterator<TValue> _Iter);
-        public ReverseRandomAccessIterator(ReverseRandomAccessIterator<TValue> _Right);
-        public TValue this[int _Pos] { get; set; }
-        public IRandomAccessIterator<TValue> base();
-        public virtual object Clone();
-        public virtual object container();
-        public virtual int distance(IRandomAccessIterator<TValue> _Right);
-        public int distance(ReverseRandomAccessIterator<TValue> _Right);
-        public virtual bool equal_to(IInputIterator<TValue> _Right);
-        public bool equal_to(ReverseRandomAccessIterator<TValue> _Right);
-        public virtual int get_bias();
-        public virtual TValue get_cref();
-        public virtual object get_node();
-        public virtual TValue get_ref();
-        public virtual bool less_than(IRandomAccessIterator<TValue> _Right);
-        public bool less_than(ReverseRandomAccessIterator<TValue> _Right);
-        public virtual int move(int _Offset);
-        public virtual void next();
-        public void operator +(ref ReverseRandomAccessIterator<TValue> , int _Right);
-        public static void operator +(ref ReverseRandomAccessIterator<TValue> , int _Left, ReverseRandomAccessIterator<TValue> _Right);
-        public ReverseRandomAccessIterator<TValue> op_Assign(ReverseRandomAccessIterator<TValue> _Right);
-        public void operator --(ref ReverseRandomAccessIterator<TValue> );
-        public void operator --(ref ReverseRandomAccessIterator<TValue> , int A_0);
-        public bool operator ==(ReverseRandomAccessIterator<TValue> _Right);
-        public bool operator >(ReverseRandomAccessIterator<TValue> _Right);
-        public bool operator >=(ReverseRandomAccessIterator<TValue> _Right);
-        public implicit operator IRandomAccessIterator<TValue> ();
-        public void operator ++(ref ReverseRandomAccessIterator<TValue> );
-        public void operator ++(ref ReverseRandomAccessIterator<TValue> , int A_0);
-        public bool operator !=(ReverseRandomAccessIterator<TValue> _Right);
-        public bool operator <(ReverseRandomAccessIterator<TValue> _Right);
-        public bool operator <=(ReverseRandomAccessIterator<TValue> _Right);
-        public static TValue op_MemberSelection(ReverseRandomAccessIterator<TValue> _Left);
-        public static TValue op_PointerDereference(ReverseRandomAccessIterator<TValue> _Left);
-        public int operator -(IRandomAccessIterator<TValue> _Right);
-        public void operator -(ref ReverseRandomAccessIterator<TValue> , int _Right);
-        public virtual void prev();
-        public virtual bool valid();
-    }
-}
```
