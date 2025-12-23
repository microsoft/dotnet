```diff
---C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.6
+++C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.6.1
 namespace System.ComponentModel.DataAnnotations {
  public class RegularExpressionAttribute : ValidationAttribute {
+   public int MatchTimeoutInMilliseconds { get; set; }
  }
 }
 namespace System.Data.SqlClient {
  public enum SqlBulkCopyOptions {
+   AllowEncryptedValueModifications = 64,
  }
  public sealed class SqlColumnEncryptionCertificateStoreProvider : SqlColumnEncryptionKeyStoreProvider {
+   public const string ProviderName = "MSSQL_CERTIFICATE_STORE";
  }
+ public class SqlColumnEncryptionCngProvider : SqlColumnEncryptionKeyStoreProvider {
+   public const string ProviderName = "MSSQL_CNG_STORE";
+   public SqlColumnEncryptionCngProvider();
+   public override byte[] DecryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] encryptedColumnEncryptionKey);
+   public override byte[] EncryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] columnEncryptionKey);
  }
+ public class SqlColumnEncryptionCspProvider : SqlColumnEncryptionKeyStoreProvider {
+   public const string ProviderName = "MSSQL_CSP_PROVIDER";
+   public SqlColumnEncryptionCspProvider();
+   public override byte[] DecryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] encryptedColumnEncryptionKey);
+   public override byte[] EncryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] columnEncryptionKey);
  }
  public sealed class SqlConnectionStringBuilder : DbConnectionStringBuilder {
+   public bool TransparentNetworkIPResolution { get; set; }
  }
 }
 namespace System.Diagnostics {
  public sealed class ProcessStartInfo {
+   public string PasswordInClearText { get; set; }
  }
 }
 namespace System.Drawing.Design {
  public class ToolboxItem : ISerializable {
+   public Bitmap OriginalBitmap { get; set; }
  }
 }
 namespace System.Net {
  public abstract class TransportContext {
+   public virtual IEnumerable<TokenBinding> GetTlsTokenBindings();
  }
 }
 namespace System.Security.Authentication.ExtendedProtection {
+ public class TokenBinding {
+   public TokenBindingType BindingType { get; }
+   public byte[] GetRawTokenBindingId();
  }
+ public enum TokenBindingType {
+   Provided = 0,
+   Referred = 1,
  }
 }
 namespace System.Security.Cryptography {
  public abstract class ECDsa : AsymmetricAlgorithm {
+   protected virtual byte[] HashData(byte[] data, int offset, int count, HashAlgorithmName hashAlgorithm);
+   protected virtual byte[] HashData(Stream data, HashAlgorithmName hashAlgorithm);
+   public virtual byte[] SignData(byte[] data, int offset, int count, HashAlgorithmName hashAlgorithm);
+   public virtual byte[] SignData(byte[] data, HashAlgorithmName hashAlgorithm);
+   public virtual byte[] SignData(Stream data, HashAlgorithmName hashAlgorithm);
+   public bool VerifyData(byte[] data, byte[] signature, HashAlgorithmName hashAlgorithm);
+   public virtual bool VerifyData(byte[] data, int offset, int count, byte[] signature, HashAlgorithmName hashAlgorithm);
+   public bool VerifyData(Stream data, byte[] signature, HashAlgorithmName hashAlgorithm);
  }
  public sealed class ECDsaCng : ECDsa {
+   protected override byte[] HashData(byte[] data, int offset, int count, HashAlgorithmName hashAlgorithm);
+   protected override byte[] HashData(Stream data, HashAlgorithmName hashAlgorithm);
  }
 }
 namespace System.Security.Cryptography.X509Certificates {
+ public static class ECDsaCertificateExtensions {
+   public static ECDsa GetECDsaPrivateKey(this X509Certificate2 certificate);
+   public static ECDsa GetECDsaPublicKey(this X509Certificate2 certificate);
  }
  public enum X509ChainStatusFlags {
+   ExplicitDistrust = 67108864,
+   HasNotSupportedCriticalExtension = 134217728,
+   HasWeakSignature = 1048576,
  }
 }
 namespace System.ServiceProcess {
  public class ServiceController : Component {
+   public ServiceStartMode StartType { get; }
  }
  public enum ServiceStartMode {
+   Boot = 0,
+   System = 1,
  }
 }
 namespace System.Transactions {
  public class Transaction : IDisposable, ISerializable {
+   public Guid PromoterType { get; }
+   public bool EnlistPromotableSinglePhase(IPromotableSinglePhaseNotification promotableSinglePhaseNotification, Guid promoterType);
+   public byte[] GetPromotedToken();
+   public void SetDistributedTransactionIdentifier(IPromotableSinglePhaseNotification promotableNotification, Guid distributedTransactionIdentifier);
  }
  public static class TransactionInterop {
+   public static readonly Guid PromoterTypeDtc;
  }
 }
 namespace System.Web.Security {
  public class MembershipPasswordAttribute : ValidationAttribute {
+   public Nullable<int> PasswordStrengthRegexTimeout { get; set; }
  }
 }
 namespace System.Web.UI.WebControls {
  public class RegularExpressionValidator : BaseValidator {
+   public Nullable<int> MatchTimeout { get; set; }
  }
 }
 namespace System.Windows {
  public sealed class TextDecorationCollection : Animatable, ICollection, ICollection<TextDecoration>, IEnumerable, IEnumerable<TextDecoration>, IList, IList<TextDecoration> {
+   public bool TryRemove(IEnumerable<TextDecoration> textDecorations, out TextDecorationCollection result);
  }
 }
 namespace System.Windows.Controls {
  public class ScrollViewer : ContentControl {
+   protected override void OnStylusSystemGesture(StylusSystemGestureEventArgs e);
  }
 }
 namespace System.Windows.Forms {
  public class TextBox : TextBoxBase {
+   protected override bool ProcessCmdKey(ref Message m, Keys keyData);
  }
 }
 namespace System.Xaml {
  public class XamlObjectWriterSettings : XamlWriterSettings {
+   public Uri SourceBamlUri { get; set; }
  }
 }
```