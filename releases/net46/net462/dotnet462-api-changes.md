```diff
 namespace System.ComponentModel {
     public abstract class GroupDescription : INotifyPropertyChanged {
+        public IComparer CustomSort { get; set; }
+        public SortDescriptionCollection SortDescriptions { get; }
+        public bool ShouldSerializeSortDescriptions();
     }
 }
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
  namespace System.Windows.Data {
     public class PropertyGroupDescription : GroupDescription {
+        public static IComparer CompareNameAscending { get; }
+        public static IComparer CompareNameDescending { get; }
     }
 }
```
