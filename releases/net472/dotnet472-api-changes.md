```diff
 namespace System.Activities.Presentation {
     public static class WorkflowDesignerColors {
+        public const string ActivityDesignerSelectedTitleForegroundColorKey = "ActivityDesignerSelectedTitleForegroundColorKey";
+        public const string FlowchartConnectorColorKey = "FlowchartConnectorColorKey";
+        public const string PropertyToolBarHightlightedButtonForegroundColorKey = "PropertyToolBarHightlightedButtonForegroundColor";
+        public const string WorkflowViewElementSelectedCaptionColorKey = "WorkflowViewElementSelectedCaptionBrushColorKey";
+        public static Color ActivityDesignerSelectedTitleForegroundColor { get; }
+        public static Color ContextMenuItemTextHoverQuirkedColor { get; }
+        public static Color FlowchartConnectorColor { get; }
+        public static Color PropertyToolBarHightlightedButtonForegroundColor { get; }
+        public static Color WorkflowViewElementSelectedCaptionColor { get; }
     }
 }
 namespace System.Collections.Concurrent {
     public class ConcurrentDictionary<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>>, IReadOnlyCollection<KeyValuePair<TKey, TValue>>, IReadOnlyDictionary<TKey, TValue> {
+        public TValue AddOrUpdate<TArg>(TKey key, Func<TKey, TArg, TValue> addValueFactory, Func<TKey, TValue, TArg, TValue> updateValueFactory, TArg factoryArgument);
+        public TValue GetOrAdd<TArg>(TKey key, Func<TKey, TArg, TValue> valueFactory, TArg factoryArgument);
     }
 }
 namespace System.Collections.Generic {
     public class HashSet<T> : ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T>, ISerializable, ISet<T> {
+        public HashSet(int capacity);
+        public HashSet(int capacity, IEqualityComparer<T> comparer);
+        public bool TryGetValue(T equalValue, out T actualValue);
     }
     public class SortedSet<T> : ICollection, ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T>, ISerializable, ISet<T> {
+        public bool TryGetValue(T equalValue, out T actualValue);
     }
 }
 namespace System.Data.SqlClient {
+    public abstract class SqlAuthenticationInitializer {
+        protected SqlAuthenticationInitializer();
+        public abstract void Initialize();
+    }
     public enum SqlAuthenticationMethod {
+        ActiveDirectoryInteractive = 4,
     }
+    public class SqlAuthenticationParameters {
+        protected SqlAuthenticationParameters(SqlAuthenticationMethod authenticationMethod, string serverName, string databaseName, string resource, string authority, string userId, string password, Guid connectionId);
+        public SqlAuthenticationMethod AuthenticationMethod { get; }
+        public string Authority { get; }
+        public Guid ConnectionId { get; }
+        public string DatabaseName { get; }
+        public string Password { get; }
+        public string Resource { get; }
+        public string ServerName { get; }
+        public string UserId { get; }
+    }
+    public abstract class SqlAuthenticationProvider {
+        protected SqlAuthenticationProvider();
+        public abstract Task<SqlAuthenticationToken> AcquireTokenAsync(SqlAuthenticationParameters parameters);
+        public virtual void BeforeLoad(SqlAuthenticationMethod authenticationMethod);
+        public virtual void BeforeUnload(SqlAuthenticationMethod authenticationMethod);
+        public static SqlAuthenticationProvider GetProvider(SqlAuthenticationMethod authenticationMethod);
+        public abstract bool IsSupported(SqlAuthenticationMethod authenticationMethod);
+        public static bool SetProvider(SqlAuthenticationMethod authenticationMethod, SqlAuthenticationProvider provider);
+    }
+    public class SqlAuthenticationToken {
+        public SqlAuthenticationToken(string accessToken, DateTimeOffset expiresOn);
+        public string AccessToken { get; }
+        public DateTimeOffset ExpiresOn { get; }
+    }
+    public class SqlClientLogger {
+        public SqlClientLogger();
+        public bool IsLoggingEnabled { get; }
+        public bool LogAssert(bool value, string type, string method, string message);
+        public void LogError(string type, string method, string message);
+        public void LogInfo(string type, string method, string message);
+    }
     public class SqlColumnEncryptionCertificateStoreProvider : SqlColumnEncryptionKeyStoreProvider {
+        public override byte[] SignColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations);
+        public override bool VerifyColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations, byte[] signature);
     }
     public class SqlColumnEncryptionCngProvider : SqlColumnEncryptionKeyStoreProvider {
+        public override byte[] SignColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations);
+        public override bool VerifyColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations, byte[] signature);
     }
     public class SqlColumnEncryptionCspProvider : SqlColumnEncryptionKeyStoreProvider {
+        public override byte[] SignColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations);
+        public override bool VerifyColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations, byte[] signature);
     }
+    public abstract class SqlColumnEncryptionEnclaveProvider {
+        protected SqlColumnEncryptionEnclaveProvider();
+        public abstract void CreateEnclaveSession(byte[] enclaveAttestationInfo, ECDiffieHellmanCng clientDiffieHellmanKey, string attestationUrl, string servername, out SqlEnclaveSession sqlEnclaveSession, out long counter);
+        public abstract SqlEnclaveAttestationParameters GetAttestationParameters();
+        public abstract void GetEnclaveSession(string serverName, string attestationUrl, out SqlEnclaveSession sqlEnclaveSession, out long counter);
+        public abstract void InvalidateEnclaveSession(string serverName, string enclaveAttestationUrl, SqlEnclaveSession enclaveSession);
+    }
     public abstract class SqlColumnEncryptionKeyStoreProvider {
+        public virtual byte[] SignColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations);
+        public virtual bool VerifyColumnMasterKeyMetadata(string masterKeyPath, bool allowEnclaveComputations, byte[] signature);
     }
     public sealed class SqlConnectionStringBuilder : DbConnectionStringBuilder {
+        public string EnclaveAttestationUrl { get; set; }
     }
+    public class SqlEnclaveAttestationParameters {
+        public SqlEnclaveAttestationParameters(int protocol, byte[] input, ECDiffieHellmanCng clientDiffieHellmanKey);
+        public ECDiffieHellmanCng ClientDiffieHellmanKey { get; }
+        public int Protocol { get; }
+        public byte[] GetInput();
+    }
+    public class SqlEnclaveSession {
+        public SqlEnclaveSession(byte[] sessionKey, long sessionId);
+        public long SessionId { get; }
+        public byte[] GetSessionKey();
+    }
 }
 namespace System.IO.Compression {
     public class ZipArchiveEntry {
+        public int ExternalAttributes { get; set; }
     }
 }
 namespace System.Linq {
     public static class Enumerable {
+        public static HashSet<TSource> ToHashSet<TSource>(this IEnumerable<TSource> source);
+        public static HashSet<TSource> ToHashSet<TSource>(this IEnumerable<TSource> source, IEqualityComparer<TSource> comparer);
     }
 }
 namespace System.Net.Http {
     public class HttpClientHandler : HttpMessageHandler {
+        public static Func<HttpRequestMessage, X509Certificate2, X509Chain, SslPolicyErrors, bool> DangerousAcceptAnyServerCertificateValidator { get; }
     }
 }
 namespace System.Security.Cryptography {
     public class CryptoStream : Stream, IDisposable {
+        public CryptoStream(Stream stream, ICryptoTransform transform, CryptoStreamMode mode, bool leaveOpen);
     }
     public abstract class DSA : AsymmetricAlgorithm {
+        public static DSA Create(DSAParameters parameters);
+        public static DSA Create(int keySizeInBits);
     }
     public class Rfc2898DeriveBytes : DeriveBytes {
+        public Rfc2898DeriveBytes(byte[] password, byte[] salt, int iterations, HashAlgorithmName hashAlgorithm);
+        public Rfc2898DeriveBytes(string password, byte[] salt, int iterations, HashAlgorithmName hashAlgorithm);
+        public Rfc2898DeriveBytes(string password, int saltSize, int iterations, HashAlgorithmName hashAlgorithm);
     }
     public abstract class RSA : AsymmetricAlgorithm {
+        public static RSA Create(int keySizeInBits);
+        public static RSA Create(RSAParameters parameters);
     }
 }
 namespace System.Security.Cryptography.Pkcs {
     public sealed class SignerInfo {
+        public Oid SignatureAlgorithm { get; }
+        public byte[] GetSignature();
     }
 }
 namespace System.Security.Cryptography.X509Certificates {
+    public sealed class CertificateRequest {
+        public CertificateRequest(string subjectName, ECDsa key, HashAlgorithmName hashAlgorithm);
+        public CertificateRequest(string subjectName, RSA key, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public CertificateRequest(X500DistinguishedName subjectName, ECDsa key, HashAlgorithmName hashAlgorithm);
+        public CertificateRequest(X500DistinguishedName subjectName, PublicKey publicKey, HashAlgorithmName hashAlgorithm);
+        public CertificateRequest(X500DistinguishedName subjectName, RSA key, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public Collection<X509Extension> CertificateExtensions { get; }
+        public HashAlgorithmName HashAlgorithm { get; }
+        public PublicKey PublicKey { get; }
+        public X500DistinguishedName SubjectName { get; }
+        public X509Certificate2 Create(X500DistinguishedName issuerName, X509SignatureGenerator generator, DateTimeOffset notBefore, DateTimeOffset notAfter, byte[] serialNumber);
+        public X509Certificate2 Create(X509Certificate2 issuerCertificate, DateTimeOffset notBefore, DateTimeOffset notAfter, byte[] serialNumber);
+        public X509Certificate2 CreateSelfSigned(DateTimeOffset notBefore, DateTimeOffset notAfter);
+        public byte[] CreateSigningRequest();
+        public byte[] CreateSigningRequest(X509SignatureGenerator signatureGenerator);
+    }
     public static class DSACertificateExtensions {
+        public static X509Certificate2 CopyWithPrivateKey(this X509Certificate2 certificate, DSA privateKey);
     }
     public static class ECDsaCertificateExtensions {
+        public static X509Certificate2 CopyWithPrivateKey(this X509Certificate2 certificate, ECDsa privateKey);
     }
     public static class RSACertificateExtensions {
+        public static X509Certificate2 CopyWithPrivateKey(this X509Certificate2 certificate, RSA privateKey);
     }
+    public sealed class SubjectAlternativeNameBuilder {
+        public SubjectAlternativeNameBuilder();
+        public void AddDnsName(string dnsName);
+        public void AddEmailAddress(string emailAddress);
+        public void AddIpAddress(IPAddress ipAddress);
+        public void AddUri(Uri uri);
+        public void AddUserPrincipalName(string upn);
+        public X509Extension Build(bool critical=false);
+    }
     public enum X509KeyStorageFlags {
+        EphemeralKeySet = 32,
     }
+    public abstract class X509SignatureGenerator {
+        protected X509SignatureGenerator();
+        public PublicKey PublicKey { get; }
+        protected abstract PublicKey BuildPublicKey();
+        public static X509SignatureGenerator CreateForECDsa(ECDsa key);
+        public static X509SignatureGenerator CreateForRSA(RSA key, RSASignaturePadding signaturePadding);
+        public abstract byte[] GetSignatureAlgorithmIdentifier(HashAlgorithmName hashAlgorithm);
+        public abstract byte[] SignData(byte[] data, HashAlgorithmName hashAlgorithm);
+    }
 }
 namespace System.Web {
     public sealed class HttpCookie {
+        public SameSiteMode SameSite { get; set; }
     }
     public sealed class HttpRuntime {
+        public static IServiceProvider WebObjectActivator { get; set; }
     }
+    public enum SameSiteMode {
+        Lax = 1,
+        None = 0,
+        Strict = 2,
+    }
 }
 namespace System.Web.Configuration {
     public sealed class FormsAuthenticationConfiguration : ConfigurationElement {
+        public SameSiteMode CookieSameSite { get; set; }
     }
     public sealed class HttpCookiesSection : ConfigurationSection {
+        public SameSiteMode SameSite { get; set; }
     }
     public sealed class SessionStateSection : ConfigurationSection {
+        public SameSiteMode CookieSameSite { get; set; }
     }
 }
 namespace System.Web.Security {
     public sealed class FormsAuthentication {
+        public static SameSiteMode CookieSameSite { get; }
     }
 }
 namespace System.Windows.Diagnostics {
     public static class ResourceDictionaryDiagnostics {
+        public static IEnumerable<Application> GetApplicationOwners(ResourceDictionary dictionary);
+        public static IEnumerable<FrameworkContentElement> GetFrameworkContentElementOwners(ResourceDictionary dictionary);
+        public static IEnumerable<FrameworkElement> GetFrameworkElementOwners(ResourceDictionary dictionary);
+        public static IEnumerable<ResourceDictionary> GetResourceDictionariesForSource(Uri uri);
+        public static event EventHandler<StaticResourceResolvedEventArgs> StaticResourceResolved;
     }
+    public class StaticResourceResolvedEventArgs : EventArgs {
+        public ResourceDictionary ResourceDictionary { get; private set; }
+        public object ResourceKey { get; private set; }
+        public object TargetObject { get; private set; }
+        public object TargetProperty { get; private set; }
+    }
 }
 namespace System.Windows.Forms {
     public class DataGridView : Control, ISupportInitialize {
+        protected bool ProcessF3Key(Keys keyData);
     }
     public class DataGridViewComboBoxCell : DataGridViewCell {
+        protected class DataGridViewComboBoxCellAccessibleObject : DataGridViewCell.DataGridViewCellAccessibleObject {
+            public DataGridViewComboBoxCellAccessibleObject(DataGridViewCell owner);
+        }
+        protected override AccessibleObject CreateAccessibilityInstance();
     }
     public class DataGridViewComboBoxEditingControl : ComboBox, IDataGridViewEditingControl {
+        protected override AccessibleObject CreateAccessibilityInstance();
     }
     public class DataGridViewTextBoxCell : DataGridViewCell {
+        protected class DataGridViewTextBoxCellAccessibleObject : DataGridViewCell.DataGridViewCellAccessibleObject {
+            public DataGridViewTextBoxCellAccessibleObject(DataGridViewCell owner);
+        }
+        protected override AccessibleObject CreateAccessibilityInstance();
     }
     public class DataGridViewTextBoxEditingControl : TextBox, IDataGridViewEditingControl {
+        protected override AccessibleObject CreateAccessibilityInstance();
     }
     public class SystemInformation {
+        public static int GetHorizontalScrollBarArrowWidthForDpi(int dpi);
     }
 }
 namespace Microsoft.Build.Tasks.Windows {
     public sealed class GenerateTemporaryTargetAssembly : Task {
+        public bool GenerateTemporaryTargetAssemblyDebuggingInformation { get; set; }
     }
 }
 namespace Microsoft.Win32.SafeHandles {
     public abstract class SafeNCryptHandle : SafeHandleZeroOrMinusOneIsInvalid {
+        protected SafeNCryptHandle(IntPtr handle, SafeHandle parentHandle);
     }
     public sealed class SafeNCryptKeyHandle : SafeNCryptHandle {
+        public SafeNCryptKeyHandle(IntPtr handle, SafeHandle parentHandle);
     }
 }
```
