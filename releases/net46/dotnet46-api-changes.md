```diff
 namespace System {
+    public static class AppContext {
+        public static string BaseDirectory { get; }
+        public static void SetSwitch(string switchName, bool isEnabled);
+        public static bool TryGetSwitch(string switchName, out bool isEnabled);
+    }
     public abstract class Array : ICloneable, ICollection, IEnumerable, IList, IStructuralComparable, IStructuralEquatable {
+        public static T[] Empty<T>();
     }
     public static class Buffer {
+        [MethodImpl(AggressiveInlining)]public unsafe static void MemoryCopy(void* source, void* destination, long destinationSizeInBytes, long sourceBytesToCopy);
+        [MethodImpl(AggressiveInlining)]public unsafe static void MemoryCopy(void* source, void* destination, ulong destinationSizeInBytes, ulong sourceBytesToCopy);
     }
     public static class Console {
-        public static int Read();
+        [MethodImpl(NoInlining)]public static int Read();
-        public static string ReadLine();
+        [MethodImpl(NoInlining)]public static string ReadLine();
-        public static void Write(bool value);
+        [MethodImpl(NoInlining)]public static void Write(bool value);
-        public static void Write(char value);
+        [MethodImpl(NoInlining)]public static void Write(char value);
-        public static void Write(char[] buffer);
+        [MethodImpl(NoInlining)]public static void Write(char[] buffer);
-        public static void Write(char[] buffer, int index, int count);
+        [MethodImpl(NoInlining)]public static void Write(char[] buffer, int index, int count);
-        public static void Write(decimal value);
+        [MethodImpl(NoInlining)]public static void Write(decimal value);
-        public static void Write(double value);
+        [MethodImpl(NoInlining)]public static void Write(double value);
-        public static void Write(int value);
+        [MethodImpl(NoInlining)]public static void Write(int value);
-        public static void Write(long value);
+        [MethodImpl(NoInlining)]public static void Write(long value);
-        public static void Write(object value);
+        [MethodImpl(NoInlining)]public static void Write(object value);
-        public static void Write(float value);
+        [MethodImpl(NoInlining)]public static void Write(float value);
-        public static void Write(string value);
+        [MethodImpl(NoInlining)]public static void Write(string value);
-        public static void Write(string format, object arg0);
+        [MethodImpl(NoInlining)]public static void Write(string format, object arg0);
-        public static void Write(string format, object arg0, object arg1);
+        [MethodImpl(NoInlining)]public static void Write(string format, object arg0, object arg1);
-        public static void Write(string format, object arg0, object arg1, object arg2);
+        [MethodImpl(NoInlining)]public static void Write(string format, object arg0, object arg1, object arg2);
-        public static void Write(string format, object arg0, object arg1, object arg2, object arg3, __arglist);
+        [MethodImpl(NoInlining)]public static void Write(string format, object arg0, object arg1, object arg2, object arg3, __arglist);
-        public static void Write(string format, params object[] arg);
+        [MethodImpl(NoInlining)]public static void Write(string format, params object[] arg);
-        public static void Write(uint value);
+        [MethodImpl(NoInlining)]public static void Write(uint value);
-        public static void Write(ulong value);
+        [MethodImpl(NoInlining)]public static void Write(ulong value);
-        public static void WriteLine();
+        [MethodImpl(NoInlining)]public static void WriteLine();
-        public static void WriteLine(bool value);
+        [MethodImpl(NoInlining)]public static void WriteLine(bool value);
-        public static void WriteLine(char value);
+        [MethodImpl(NoInlining)]public static void WriteLine(char value);
-        public static void WriteLine(char[] buffer);
+        [MethodImpl(NoInlining)]public static void WriteLine(char[] buffer);
-        public static void WriteLine(char[] buffer, int index, int count);
+        [MethodImpl(NoInlining)]public static void WriteLine(char[] buffer, int index, int count);
-        public static void WriteLine(decimal value);
+        [MethodImpl(NoInlining)]public static void WriteLine(decimal value);
-        public static void WriteLine(double value);
+        [MethodImpl(NoInlining)]public static void WriteLine(double value);
-        public static void WriteLine(int value);
+        [MethodImpl(NoInlining)]public static void WriteLine(int value);
-        public static void WriteLine(long value);
+        [MethodImpl(NoInlining)]public static void WriteLine(long value);
-        public static void WriteLine(object value);
+        [MethodImpl(NoInlining)]public static void WriteLine(object value);
-        public static void WriteLine(float value);
+        [MethodImpl(NoInlining)]public static void WriteLine(float value);
-        public static void WriteLine(string value);
+        [MethodImpl(NoInlining)]public static void WriteLine(string value);
-        public static void WriteLine(string format, object arg0);
+        [MethodImpl(NoInlining)]public static void WriteLine(string format, object arg0);
-        public static void WriteLine(string format, object arg0, object arg1);
+        [MethodImpl(NoInlining)]public static void WriteLine(string format, object arg0, object arg1);
-        public static void WriteLine(string format, object arg0, object arg1, object arg2);
+        [MethodImpl(NoInlining)]public static void WriteLine(string format, object arg0, object arg1, object arg2);
-        public static void WriteLine(string format, object arg0, object arg1, object arg2, object arg3, __arglist);
+        [MethodImpl(NoInlining)]public static void WriteLine(string format, object arg0, object arg1, object arg2, object arg3, __arglist);
-        public static void WriteLine(string format, params object[] arg);
+        [MethodImpl(NoInlining)]public static void WriteLine(string format, params object[] arg);
-        public static void WriteLine(uint value);
+        [MethodImpl(NoInlining)]public static void WriteLine(uint value);
-        public static void WriteLine(ulong value);
+        [MethodImpl(NoInlining)]public static void WriteLine(ulong value);
     }
     public struct DateTimeOffset : IComparable, IComparable<DateTimeOffset>, IDeserializationCallback, IEquatable<DateTimeOffset>, IFormattable, ISerializable {
+        public static DateTimeOffset FromUnixTimeMilliseconds(long milliseconds);
+        public static DateTimeOffset FromUnixTimeSeconds(long seconds);
+        public long ToUnixTimeMilliseconds();
+        public long ToUnixTimeSeconds();
     }
+    public abstract class FormattableString : IFormattable {
+        protected FormattableString();
+        public abstract int ArgumentCount { get; }
+        public abstract string Format { get; }
+        public abstract object GetArgument(int index);
+        public abstract object[] GetArguments();
+        public static string Invariant(FormattableString formattable);
+        string System.IFormattable.ToString(string ignored, IFormatProvider formatProvider);
+        public override string ToString();
+        public abstract string ToString(IFormatProvider formatProvider);
+    }
     public static class GC {
+        public static void Collect(int generation, GCCollectionMode mode, bool blocking, bool compacting);
+        public static void EndNoGCRegion();
+        public static bool TryStartNoGCRegion(long totalSize);
+        public static bool TryStartNoGCRegion(long totalSize, bool disallowFullBlockingGC);
+        public static bool TryStartNoGCRegion(long totalSize, long lohSize);
+        public static bool TryStartNoGCRegion(long totalSize, long lohSize, bool disallowFullBlockingGC);
     }
     public sealed class String : ICloneable, IComparable, IComparable<string>, IConvertible, IEnumerable, IEnumerable<char>, IEquatable<string> {
+        public static string Format(IFormatProvider provider, string format, object arg0);
+        public static string Format(IFormatProvider provider, string format, object arg0, object arg1);
+        public static string Format(IFormatProvider provider, string format, object arg0, object arg1, object arg2);
     }
     public class Uri : ISerializable {
+        public string IdnHost { get; }
     }
 }
 namespace System.Collections.Concurrent {
-    public class BlockingCollection<T> : ICollection, IDisposable, IEnumerable, IEnumerable<T> {
+    public class BlockingCollection<T> : ICollection, IDisposable, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T> {
     }
-    public class ConcurrentBag<T> : ICollection, IEnumerable, IEnumerable<T>, IProducerConsumerCollection<T> {
+    public class ConcurrentBag<T> : ICollection, IEnumerable, IEnumerable<T>, IProducerConsumerCollection<T>, IReadOnlyCollection<T> {
     }
-    public class ConcurrentDictionary<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>> {
+    public class ConcurrentDictionary<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>>, IReadOnlyCollection<KeyValuePair<TKey, TValue>>, IReadOnlyDictionary<TKey, TValue> {
+        IEnumerable<TKey> System.Collections.Generic.IReadOnlyDictionary<TKey,TValue>.Keys { get; }
+        IEnumerable<TValue> System.Collections.Generic.IReadOnlyDictionary<TKey,TValue>.Values { get; }
     }
-    public class ConcurrentQueue<T> : ICollection, IEnumerable, IEnumerable<T>, IProducerConsumerCollection<T> {
+    public class ConcurrentQueue<T> : ICollection, IEnumerable, IEnumerable<T>, IProducerConsumerCollection<T>, IReadOnlyCollection<T> {
     }
-    public class ConcurrentStack<T> : ICollection, IEnumerable, IEnumerable<T>, IProducerConsumerCollection<T> {
+    public class ConcurrentStack<T> : ICollection, IEnumerable, IEnumerable<T>, IProducerConsumerCollection<T>, IReadOnlyCollection<T> {
     }
 }
 namespace System.Collections.Generic {
     public class Dictionary<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDeserializationCallback, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>>, IReadOnlyCollection<KeyValuePair<TKey, TValue>>, IReadOnlyDictionary<TKey, TValue>, ISerializable {
-        public sealed class KeyCollection : ICollection, ICollection<TKey>, IEnumerable, IEnumerable<TKey> {
+        public sealed class KeyCollection : ICollection, ICollection<TKey>, IEnumerable, IEnumerable<TKey>, IReadOnlyCollection<TKey> {
         }
-        public sealed class ValueCollection : ICollection, ICollection<TValue>, IEnumerable, IEnumerable<TValue> {
+        public sealed class ValueCollection : ICollection, ICollection<TValue>, IEnumerable, IEnumerable<TValue>, IReadOnlyCollection<TValue> {
         }
     }
-    public class HashSet<T> : ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, ISerializable, ISet<T> {
+    public class HashSet<T> : ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T>, ISerializable, ISet<T> {
     }
-    public class LinkedList<T> : ICollection, ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, ISerializable {
+    public class LinkedList<T> : ICollection, ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T>, ISerializable {
     }
-    public class Queue<T> : ICollection, IEnumerable, IEnumerable<T> {
+    public class Queue<T> : ICollection, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T> {
     }
-    public class SortedDictionary<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>> {
+    public class SortedDictionary<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>>, IReadOnlyCollection<KeyValuePair<TKey, TValue>>, IReadOnlyDictionary<TKey, TValue> {
-        public sealed class KeyCollection : ICollection, ICollection<TKey>, IEnumerable, IEnumerable<TKey> {
+        public sealed class KeyCollection : ICollection, ICollection<TKey>, IEnumerable, IEnumerable<TKey>, IReadOnlyCollection<TKey> {
         }
-        public sealed class ValueCollection : ICollection, ICollection<TValue>, IEnumerable, IEnumerable<TValue> {
+        public sealed class ValueCollection : ICollection, ICollection<TValue>, IEnumerable, IEnumerable<TValue>, IReadOnlyCollection<TValue> {
         }
+        IEnumerable<TKey> System.Collections.Generic.IReadOnlyDictionary<TKey,TValue>.Keys { get; }
+        IEnumerable<TValue> System.Collections.Generic.IReadOnlyDictionary<TKey,TValue>.Values { get; }
     }
-    public class SortedList<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>> {
+    public class SortedList<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>>, IReadOnlyCollection<KeyValuePair<TKey, TValue>>, IReadOnlyDictionary<TKey, TValue> {
+        IEnumerable<TKey> System.Collections.Generic.IReadOnlyDictionary<TKey,TValue>.Keys { get; }
+        IEnumerable<TValue> System.Collections.Generic.IReadOnlyDictionary<TKey,TValue>.Values { get; }
     }
-    public class SortedSet<T> : ICollection, ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, ISerializable, ISet<T> {
+    public class SortedSet<T> : ICollection, ICollection<T>, IDeserializationCallback, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T>, ISerializable, ISet<T> {
     }
-    public class Stack<T> : ICollection, IEnumerable, IEnumerable<T> {
+    public class Stack<T> : ICollection, IEnumerable, IEnumerable<T>, IReadOnlyCollection<T> {
     }
 }
 namespace System.Collections.ObjectModel {
     public class ReadOnlyDictionary<TKey, TValue> : ICollection, ICollection<KeyValuePair<TKey, TValue>>, IDictionary, IDictionary<TKey, TValue>, IEnumerable, IEnumerable<KeyValuePair<TKey, TValue>>, IReadOnlyCollection<KeyValuePair<TKey, TValue>>, IReadOnlyDictionary<TKey, TValue> {
-        public sealed class KeyCollection : ICollection, ICollection<TKey>, IEnumerable, IEnumerable<TKey> {
+        public sealed class KeyCollection : ICollection, ICollection<TKey>, IEnumerable, IEnumerable<TKey>, IReadOnlyCollection<TKey> {
         }
-        public sealed class ValueCollection : ICollection, ICollection<TValue>, IEnumerable, IEnumerable<TValue> {
+        public sealed class ValueCollection : ICollection, ICollection<TValue>, IEnumerable, IEnumerable<TValue>, IReadOnlyCollection<TValue> {
         }
     }
 }
 namespace System.Configuration {
     public sealed class RsaProtectedConfigurationProvider : ProtectedConfigurationProvider {
+        public bool UseFIPS { get; }
     }
 }
 namespace System.Data.Common {
     public class DbEnumerator : IEnumerator {
+        public DbEnumerator(DbDataReader reader);
+        public DbEnumerator(DbDataReader reader, bool closeReader);
     }
 }
 namespace System.Data.SqlClient {
+    public enum SqlAuthenticationMethod {
+        ActiveDirectoryIntegrated = 3,
+        ActiveDirectoryPassword = 2,
+        NotSpecified = 0,
+        SqlPassword = 1,
+    }
     public sealed class SqlBulkCopy : IDisposable {
+        public void WriteToServer(DbDataReader reader);
+        public Task WriteToServerAsync(DbDataReader reader);
+        public Task WriteToServerAsync(DbDataReader reader, CancellationToken cancellationToken);
     }
+    public sealed class SqlColumnEncryptionCertificateStoreProvider : SqlColumnEncryptionKeyStoreProvider {
+        public SqlColumnEncryptionCertificateStoreProvider();
+        public override byte[] DecryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] encryptedColumnEncryptionKey);
+        public override byte[] EncryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] columnEncryptionKey);
+    }
+    public abstract class SqlColumnEncryptionKeyStoreProvider {
+        protected SqlColumnEncryptionKeyStoreProvider();
+        public abstract byte[] DecryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] encryptedColumnEncryptionKey);
+        public abstract byte[] EncryptColumnEncryptionKey(string masterKeyPath, string encryptionAlgorithm, byte[] columnEncryptionKey);
+    }
     public sealed class SqlCommand : DbCommand, ICloneable {
+        public SqlCommand(string cmdText, SqlConnection connection, SqlTransaction transaction, SqlCommandColumnEncryptionSetting columnEncryptionSetting);
+        public SqlCommandColumnEncryptionSetting ColumnEncryptionSetting { get; }
     }
+    public enum SqlCommandColumnEncryptionSetting {
+        Disabled = 3,
+        Enabled = 1,
+        ResultSetOnly = 2,
+        UseConnectionSetting = 0,
+    }
     public sealed class SqlConnection : DbConnection, ICloneable {
+        public string AccessToken { get; set; }
+        public static IDictionary<string, IList<string>> ColumnEncryptionTrustedMasterKeyPaths { get; }
+        public static void RegisterColumnEncryptionKeyStoreProviders(IDictionary<string, SqlColumnEncryptionKeyStoreProvider> customProviders);
     }
+    public enum SqlConnectionColumnEncryptionSetting {
+        Disabled = 0,
+        Enabled = 1,
+    }
     public sealed class SqlConnectionStringBuilder : DbConnectionStringBuilder {
+        public SqlAuthenticationMethod Authentication { get; set; }
+        public SqlConnectionColumnEncryptionSetting ColumnEncryptionSetting { get; set; }
     }
     public sealed class SqlParameter : DbParameter, ICloneable, IDataParameter, IDbDataParameter {
+        public bool ForceColumnEncryption { get; set; }
     }
 }
 namespace System.Diagnostics {
     public sealed class Debugger {
-        public static bool IsAttached { get; }
+        public static bool IsAttached { [MethodImpl(InternalCall)]get; }
     }
     public class Process : Component {
+        public SafeProcessHandle SafeHandle { get; }
     }
     public sealed class ProcessStartInfo {
+        public IDictionary<string, string> Environment { get; }
     }
 }
 namespace System.Diagnostics.Tracing {
+    public enum EventActivityOptions {
+        Detachable = 8,
+        Disable = 2,
+        None = 0,
+        Recursive = 4,
+    }
     public sealed class EventAttribute : Attribute {
+        public EventActivityOptions ActivityOptions { get; set; }
+        public EventChannel Channel { get; set; }
+        public EventTags Tags { get; set; }
     }
+    public enum EventChannel : byte {
+        Admin = (byte)16,
+        Analytic = (byte)18,
+        Debug = (byte)19,
+        None = (byte)0,
+        Operational = (byte)17,
+    }
     public class EventCommandEventArgs : EventArgs {
-        public IDictionary<string, string> Arguments { get; private set; }
+        public IDictionary<string, string> Arguments { get; internal set; }
-        public EventCommand Command { get; private set; }
+        public EventCommand Command { get; internal set; }
     }
+    public class EventDataAttribute : Attribute {
+        public EventDataAttribute();
+        public string Name { get; set; }
+    }
+    public class EventFieldAttribute : Attribute {
+        public EventFieldAttribute();
+        public EventFieldFormat Format { get; set; }
+        public EventFieldTags Tags { get; set; }
+    }
+    public enum EventFieldFormat {
+        Boolean = 3,
+        Default = 0,
+        Hexadecimal = 4,
+        HResult = 15,
+        Json = 12,
+        String = 2,
+        Xml = 11,
+    }
+    public enum EventFieldTags {
+        None = 0,
+    }
+    public class EventIgnoreAttribute : Attribute {
+        public EventIgnoreAttribute();
+    }
     public enum EventKeywords : long {
+        All = (long)-1,
+        MicrosoftTelemetry = (long)562949953421312,
     }
+    public enum EventManifestOptions {
+        AllCultures = 2,
+        AllowEventSourceOverride = 8,
+        None = 0,
+        OnlyIfNeededForRegistration = 4,
+        Strict = 1,
+    }
     public class EventSource : IDisposable {
+        protected EventSource(EventSourceSettings settings);
+        protected EventSource(EventSourceSettings settings, params string[] traits);
+        public EventSource(string eventSourceName);
+        public EventSource(string eventSourceName, EventSourceSettings config);
+        public EventSource(string eventSourceName, EventSourceSettings config, params string[] traits);
+        public EventSourceSettings Settings { get; }
+        public static string GenerateManifest(Type eventSourceType, string assemblyPathToIncludeInManifest, EventManifestOptions flags);
+        public string GetTrait(string key);
+        public bool IsEnabled(EventLevel level, EventKeywords keywords, EventChannel channel);
+        public void Write<T>(string eventName, T data);
+        public void Write<T>(string eventName, EventSourceOptions options, T data);
+        public void Write<T>(string eventName, ref EventSourceOptions options, ref T data);
+        public void Write<T>(string eventName, ref EventSourceOptions options, ref Guid activityId, ref Guid relatedActivityId, ref T data);
+        public void Write(string eventName);
+        public void Write(string eventName, EventSourceOptions options);
+        protected void WriteEvent(int eventId, byte[] arg1);
+        protected void WriteEvent(int eventId, int arg1, string arg2);
+        protected void WriteEvent(int eventId, long arg1, byte[] arg2);
+        protected void WriteEvent(int eventId, long arg1, string arg2);
-        protected void WriteEventWithRelatedActivityId(int eventId, Guid childActivityID, params object[] args);
+        protected void WriteEventWithRelatedActivityId(int eventId, Guid relatedActivityId, params object[] args);
-        protected unsafe void WriteEventWithRelatedActivityIdCore(int eventId, Guid* childActivityID, int eventDataCount, EventSource.EventData* data);
+        protected unsafe void WriteEventWithRelatedActivityIdCore(int eventId, Guid* relatedActivityId, int eventDataCount, EventSource.EventData* data);
     }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct EventSourceOptions {
+        public EventActivityOptions ActivityOptions { get; set; }
+        public EventKeywords Keywords { get; set; }
+        public EventLevel Level { get; set; }
+        public EventOpcode Opcode { get; set; }
+        public EventTags Tags { get; set; }
+    }
+    public enum EventSourceSettings {
+        Default = 0,
+        EtwManifestEventFormat = 4,
+        EtwSelfDescribingEventFormat = 8,
+        ThrowOnEventWriteErrors = 1,
+    }
+    public enum EventTags {
+        None = 0,
+    }
     public class EventWrittenEventArgs : EventArgs {
+        public EventChannel Channel { get; }
+        public string EventName { get; internal set; }
+        public ReadOnlyCollection<string> PayloadNames { get; internal set; }
+        public EventTags Tags { get; }
     }
 }
 namespace System.DirectoryServices.ActiveDirectory {
     public class Domain : ActiveDirectoryPartition {
+        public int DomainModeLevel { get; }
+        public void RaiseDomainFunctionalityLevel(int domainMode);
     }
     public enum DomainMode {
+        Unknown = -1,
     }
     public class Forest : IDisposable {
+        public int ForestModeLevel { get; }
+        public void RaiseForestFunctionalityLevel(int forestMode);
     }
     public enum ForestMode {
+        Unknown = -1,
     }
 }
 namespace System.Globalization {
     public class CompareInfo : IDeserializationCallback {
+        public virtual int GetHashCode(string source, CompareOptions options);
     }
     public class CultureInfo : ICloneable, IFormatProvider {
-        public static CultureInfo CurrentCulture { get; }
+        public static CultureInfo CurrentCulture { get; set; }
-        public static CultureInfo CurrentUICulture { get; }
+        public static CultureInfo CurrentUICulture { get; set; }
     }
 }
 namespace System.IO {
     public class MemoryStream : Stream {
+        public virtual bool TryGetBuffer(out ArraySegment<byte> buffer);
     }
 }
 namespace System.IO.MemoryMappedFiles {
     public class MemoryMappedFile : IDisposable {
+        public static MemoryMappedFile CreateFromFile(FileStream fileStream, string mapName, long capacity, MemoryMappedFileAccess access, HandleInheritability inheritability, bool leaveOpen);
+        public static MemoryMappedFile CreateNew(string mapName, long capacity, MemoryMappedFileAccess access, MemoryMappedFileOptions options, HandleInheritability inheritability);
+        public static MemoryMappedFile CreateOrOpen(string mapName, long capacity, MemoryMappedFileAccess access, MemoryMappedFileOptions options, HandleInheritability inheritability);
     }
 }
 namespace System.IO.Pipes {
     public sealed class NamedPipeClientStream : PipeStream {
+        public Task ConnectAsync();
+        public Task ConnectAsync(CancellationToken cancellationToken);
+        public Task ConnectAsync(int timeout);
+        public Task ConnectAsync(int timeout, CancellationToken cancellationToken);
     }
     public sealed class NamedPipeServerStream : PipeStream {
+        public Task WaitForConnectionAsync();
+        public Task WaitForConnectionAsync(CancellationToken cancellationToken);
     }
 }
 namespace System.Linq.Expressions {
-    public class DynamicExpression : Expression {
+    public class DynamicExpression : Expression, IArgumentProvider, IDynamicExpression {
+        int System.Linq.Expressions.IArgumentProvider.ArgumentCount { get; }
+        Expression System.Linq.Expressions.IArgumentProvider.GetArgument(int index);
+        object System.Linq.Expressions.IDynamicExpression.CreateCallSite();
+        Expression System.Linq.Expressions.IDynamicExpression.Rewrite(Expression[] args);
     }
-    public sealed class ElementInit {
+    public sealed class ElementInit : IArgumentProvider {
+        int System.Linq.Expressions.IArgumentProvider.ArgumentCount { get; }
+        Expression System.Linq.Expressions.IArgumentProvider.GetArgument(int index);
     }
+    public interface IArgumentProvider {
+        int ArgumentCount { get; }
+        Expression GetArgument(int index);
+    }
+    public interface IDynamicExpression : IArgumentProvider {
+        Type DelegateType { get; }
+        object CreateCallSite();
+        Expression Rewrite(Expression[] args);
+    }
-    public sealed class IndexExpression : Expression {
+    public sealed class IndexExpression : Expression, IArgumentProvider {
+        int System.Linq.Expressions.IArgumentProvider.ArgumentCount { get; }
+        Expression System.Linq.Expressions.IArgumentProvider.GetArgument(int index);
     }
-    public sealed class InvocationExpression : Expression {
+    public sealed class InvocationExpression : Expression, IArgumentProvider {
+        int System.Linq.Expressions.IArgumentProvider.ArgumentCount { get; }
+        Expression System.Linq.Expressions.IArgumentProvider.GetArgument(int index);
     }
-    public class MethodCallExpression : Expression {
+    public class MethodCallExpression : Expression, IArgumentProvider {
+        int System.Linq.Expressions.IArgumentProvider.ArgumentCount { get; }
+        Expression System.Linq.Expressions.IArgumentProvider.GetArgument(int index);
     }
-    public class NewExpression : Expression {
+    public class NewExpression : Expression, IArgumentProvider {
+        int System.Linq.Expressions.IArgumentProvider.ArgumentCount { get; }
+        Expression System.Linq.Expressions.IArgumentProvider.GetArgument(int index);
     }
 }
 namespace System.Net {
     public class ServicePointManager {
+        public static bool ReusePort { get; set; }
     }
 }
 namespace System.Net.Sockets {
     public enum SocketOptionName {
+        ReuseUnicastPort = 12295,
     }
     public class TcpClient : IDisposable {
+        public void Dispose();
-        void System.IDisposable.Dispose();
     }
     public class UdpClient : IDisposable {
+        public void Dispose();
-        void System.IDisposable.Dispose();
     }
 }
 namespace System.Numerics {
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct Matrix3x2 : IEquatable<Matrix3x2> {
+        public float M11;
+        public float M12;
+        public float M21;
+        public float M22;
+        public float M31;
+        public float M32;
+        public Matrix3x2(float m11, float m12, float m21, float m22, float m31, float m32);
+        public static Matrix3x2 Identity { get; }
+        public bool IsIdentity { get; }
+        public Vector2 Translation { get; set; }
+        public static Matrix3x2 Add(Matrix3x2 value1, Matrix3x2 value2);
+        public static Matrix3x2 CreateRotation(float radians);
+        public static Matrix3x2 CreateRotation(float radians, Vector2 centerPoint);
+        public static Matrix3x2 CreateScale(float scale);
+        public static Matrix3x2 CreateScale(float xScale, float yScale);
+        public static Matrix3x2 CreateScale(float xScale, float yScale, Vector2 centerPoint);
+        public static Matrix3x2 CreateScale(float scale, Vector2 centerPoint);
+        public static Matrix3x2 CreateScale(Vector2 scales);
+        public static Matrix3x2 CreateScale(Vector2 scales, Vector2 centerPoint);
+        public static Matrix3x2 CreateSkew(float radiansX, float radiansY);
+        public static Matrix3x2 CreateSkew(float radiansX, float radiansY, Vector2 centerPoint);
+        public static Matrix3x2 CreateTranslation(float xPosition, float yPosition);
+        public static Matrix3x2 CreateTranslation(Vector2 position);
+        public bool Equals(Matrix3x2 other);
+        public override bool Equals(object obj);
+        public float GetDeterminant();
+        public override int GetHashCode();
+        public static bool Invert(Matrix3x2 matrix, out Matrix3x2 result);
+        public static Matrix3x2 Lerp(Matrix3x2 matrix1, Matrix3x2 matrix2, float amount);
+        public static Matrix3x2 Multiply(Matrix3x2 value1, Matrix3x2 value2);
+        public static Matrix3x2 Multiply(Matrix3x2 value1, float value2);
+        public static Matrix3x2 Negate(Matrix3x2 value);
+        public static Matrix3x2 operator +(Matrix3x2 value1, Matrix3x2 value2);
+        public static bool operator ==(Matrix3x2 value1, Matrix3x2 value2);
+        public static bool operator !=(Matrix3x2 value1, Matrix3x2 value2);
+        public static Matrix3x2 operator *(Matrix3x2 value1, Matrix3x2 value2);
+        public static Matrix3x2 operator *(Matrix3x2 value1, float value2);
+        public static Matrix3x2 operator -(Matrix3x2 value1, Matrix3x2 value2);
+        public static Matrix3x2 operator -(Matrix3x2 value);
+        public static Matrix3x2 Subtract(Matrix3x2 value1, Matrix3x2 value2);
+        public override string ToString();
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct Matrix4x4 : IEquatable<Matrix4x4> {
+        public float M11;
+        public float M12;
+        public float M13;
+        public float M14;
+        public float M21;
+        public float M22;
+        public float M23;
+        public float M24;
+        public float M31;
+        public float M32;
+        public float M33;
+        public float M34;
+        public float M41;
+        public float M42;
+        public float M43;
+        public float M44;
+        public Matrix4x4(Matrix3x2 value);
+        public Matrix4x4(float m11, float m12, float m13, float m14, float m21, float m22, float m23, float m24, float m31, float m32, float m33, float m34, float m41, float m42, float m43, float m44);
+        public static Matrix4x4 Identity { get; }
+        public bool IsIdentity { get; }
+        public Vector3 Translation { get; set; }
+        public static Matrix4x4 Add(Matrix4x4 value1, Matrix4x4 value2);
+        public static Matrix4x4 CreateBillboard(Vector3 objectPosition, Vector3 cameraPosition, Vector3 cameraUpVector, Vector3 cameraForwardVector);
+        public static Matrix4x4 CreateConstrainedBillboard(Vector3 objectPosition, Vector3 cameraPosition, Vector3 rotateAxis, Vector3 cameraForwardVector, Vector3 objectForwardVector);
+        public static Matrix4x4 CreateFromAxisAngle(Vector3 axis, float angle);
+        public static Matrix4x4 CreateFromQuaternion(Quaternion quaternion);
+        public static Matrix4x4 CreateFromYawPitchRoll(float yaw, float pitch, float roll);
+        public static Matrix4x4 CreateLookAt(Vector3 cameraPosition, Vector3 cameraTarget, Vector3 cameraUpVector);
+        public static Matrix4x4 CreateOrthographic(float width, float height, float zNearPlane, float zFarPlane);
+        public static Matrix4x4 CreateOrthographicOffCenter(float left, float right, float bottom, float top, float zNearPlane, float zFarPlane);
+        public static Matrix4x4 CreatePerspective(float width, float height, float nearPlaneDistance, float farPlaneDistance);
+        public static Matrix4x4 CreatePerspectiveFieldOfView(float fieldOfView, float aspectRatio, float nearPlaneDistance, float farPlaneDistance);
+        public static Matrix4x4 CreatePerspectiveOffCenter(float left, float right, float bottom, float top, float nearPlaneDistance, float farPlaneDistance);
+        public static Matrix4x4 CreateReflection(Plane value);
+        public static Matrix4x4 CreateRotationX(float radians);
+        public static Matrix4x4 CreateRotationX(float radians, Vector3 centerPoint);
+        public static Matrix4x4 CreateRotationY(float radians);
+        public static Matrix4x4 CreateRotationY(float radians, Vector3 centerPoint);
+        public static Matrix4x4 CreateRotationZ(float radians);
+        public static Matrix4x4 CreateRotationZ(float radians, Vector3 centerPoint);
+        public static Matrix4x4 CreateScale(float scale);
+        public static Matrix4x4 CreateScale(float xScale, float yScale, float zScale);
+        public static Matrix4x4 CreateScale(float xScale, float yScale, float zScale, Vector3 centerPoint);
+        public static Matrix4x4 CreateScale(float scale, Vector3 centerPoint);
+        public static Matrix4x4 CreateScale(Vector3 scales);
+        public static Matrix4x4 CreateScale(Vector3 scales, Vector3 centerPoint);
+        public static Matrix4x4 CreateShadow(Vector3 lightDirection, Plane plane);
+        public static Matrix4x4 CreateTranslation(float xPosition, float yPosition, float zPosition);
+        public static Matrix4x4 CreateTranslation(Vector3 position);
+        public static Matrix4x4 CreateWorld(Vector3 position, Vector3 forward, Vector3 up);
+        public static bool Decompose(Matrix4x4 matrix, out Vector3 scale, out Quaternion rotation, out Vector3 translation);
+        public bool Equals(Matrix4x4 other);
+        public override bool Equals(object obj);
+        public float GetDeterminant();
+        public override int GetHashCode();
+        public static bool Invert(Matrix4x4 matrix, out Matrix4x4 result);
+        public static Matrix4x4 Lerp(Matrix4x4 matrix1, Matrix4x4 matrix2, float amount);
+        public static Matrix4x4 Multiply(Matrix4x4 value1, Matrix4x4 value2);
+        public static Matrix4x4 Multiply(Matrix4x4 value1, float value2);
+        public static Matrix4x4 Negate(Matrix4x4 value);
+        public static Matrix4x4 operator +(Matrix4x4 value1, Matrix4x4 value2);
+        public static bool operator ==(Matrix4x4 value1, Matrix4x4 value2);
+        public static bool operator !=(Matrix4x4 value1, Matrix4x4 value2);
+        public static Matrix4x4 operator *(Matrix4x4 value1, Matrix4x4 value2);
+        public static Matrix4x4 operator *(Matrix4x4 value1, float value2);
+        public static Matrix4x4 operator -(Matrix4x4 value1, Matrix4x4 value2);
+        public static Matrix4x4 operator -(Matrix4x4 value);
+        public static Matrix4x4 Subtract(Matrix4x4 value1, Matrix4x4 value2);
+        public override string ToString();
+        public static Matrix4x4 Transform(Matrix4x4 value, Quaternion rotation);
+        public static Matrix4x4 Transpose(Matrix4x4 matrix);
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct Plane : IEquatable<Plane> {
+        public float D;
+        public Vector3 Normal;
+        public Plane(float x, float y, float z, float d);
+        public Plane(Vector3 normal, float d);
+        public Plane(Vector4 value);
+        [MethodImpl(AggressiveInlining)]public static Plane CreateFromVertices(Vector3 point1, Vector3 point2, Vector3 point3);
+        [MethodImpl(AggressiveInlining)]public static float Dot(Plane plane, Vector4 value);
+        [MethodImpl(AggressiveInlining)]public static float DotCoordinate(Plane plane, Vector3 value);
+        [MethodImpl(AggressiveInlining)]public static float DotNormal(Plane plane, Vector3 value);
+        [MethodImpl(AggressiveInlining)]public override bool Equals(object obj);
+        [MethodImpl(AggressiveInlining)]public bool Equals(Plane other);
+        public override int GetHashCode();
+        [MethodImpl(AggressiveInlining)]public static Plane Normalize(Plane value);
+        [MethodImpl(AggressiveInlining)]public static bool operator ==(Plane value1, Plane value2);
+        [MethodImpl(AggressiveInlining)]public static bool operator !=(Plane value1, Plane value2);
+        public override string ToString();
+        [MethodImpl(AggressiveInlining)]public static Plane Transform(Plane plane, Matrix4x4 matrix);
+        [MethodImpl(AggressiveInlining)]public static Plane Transform(Plane plane, Quaternion rotation);
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct Quaternion : IEquatable<Quaternion> {
+        public float W;
+        public float X;
+        public float Y;
+        public float Z;
+        public Quaternion(float x, float y, float z, float w);
+        public Quaternion(Vector3 vectorPart, float scalarPart);
+        public static Quaternion Identity { get; }
+        public bool IsIdentity { get; }
+        public static Quaternion Add(Quaternion value1, Quaternion value2);
+        public static Quaternion Concatenate(Quaternion value1, Quaternion value2);
+        public static Quaternion Conjugate(Quaternion value);
+        public static Quaternion CreateFromAxisAngle(Vector3 axis, float angle);
+        public static Quaternion CreateFromRotationMatrix(Matrix4x4 matrix);
+        public static Quaternion CreateFromYawPitchRoll(float yaw, float pitch, float roll);
+        public static Quaternion Divide(Quaternion value1, Quaternion value2);
+        public static float Dot(Quaternion quaternion1, Quaternion quaternion2);
+        public override bool Equals(object obj);
+        public bool Equals(Quaternion other);
+        public override int GetHashCode();
+        public static Quaternion Inverse(Quaternion value);
+        public float Length();
+        public float LengthSquared();
+        public static Quaternion Lerp(Quaternion quaternion1, Quaternion quaternion2, float amount);
+        public static Quaternion Multiply(Quaternion value1, Quaternion value2);
+        public static Quaternion Multiply(Quaternion value1, float value2);
+        public static Quaternion Negate(Quaternion value);
+        public static Quaternion Normalize(Quaternion value);
+        public static Quaternion operator +(Quaternion value1, Quaternion value2);
+        public static Quaternion operator /(Quaternion value1, Quaternion value2);
+        public static bool operator ==(Quaternion value1, Quaternion value2);
+        public static bool operator !=(Quaternion value1, Quaternion value2);
+        public static Quaternion operator *(Quaternion value1, Quaternion value2);
+        public static Quaternion operator *(Quaternion value1, float value2);
+        public static Quaternion operator -(Quaternion value1, Quaternion value2);
+        public static Quaternion operator -(Quaternion value);
+        public static Quaternion Slerp(Quaternion quaternion1, Quaternion quaternion2, float amount);
+        public static Quaternion Subtract(Quaternion value1, Quaternion value2);
+        public override string ToString();
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct Vector2 : IEquatable<Vector2>, IFormattable {
+        public float X;
+        public float Y;
+        public Vector2(float value);
+        public Vector2(float x, float y);
+        public static Vector2 One { get; }
+        public static Vector2 UnitX { get; }
+        public static Vector2 UnitY { get; }
+        public static Vector2 Zero { get; }
+        [MethodImpl(AggressiveInlining)]public static Vector2 Abs(Vector2 value);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Add(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Clamp(Vector2 value1, Vector2 min, Vector2 max);
+        [MethodImpl(AggressiveInlining)]public void CopyTo(float[] array);
+        public void CopyTo(float[] array, int index);
+        [MethodImpl(AggressiveInlining)]public static float Distance(Vector2 value1, Vector2 value2);
+        [MethodImpl(AggressiveInlining)]public static float DistanceSquared(Vector2 value1, Vector2 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Divide(Vector2 left, float divisor);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Divide(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static float Dot(Vector2 value1, Vector2 value2);
+        [MethodImpl(AggressiveInlining)]public override bool Equals(object obj);
+        public bool Equals(Vector2 other);
+        public override int GetHashCode();
+        [MethodImpl(AggressiveInlining)]public float Length();
+        [MethodImpl(AggressiveInlining)]public float LengthSquared();
+        [MethodImpl(AggressiveInlining)]public static Vector2 Lerp(Vector2 value1, Vector2 value2, float amount);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Max(Vector2 value1, Vector2 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Min(Vector2 value1, Vector2 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Multiply(float left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Multiply(Vector2 left, float right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Multiply(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Negate(Vector2 value);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Normalize(Vector2 value);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator +(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator /(Vector2 value1, float value2);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator /(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static bool operator ==(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static bool operator !=(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator *(float left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator *(Vector2 left, float right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator *(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator -(Vector2 left, Vector2 right);
+        [MethodImpl(AggressiveInlining)]public static Vector2 operator -(Vector2 value);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Reflect(Vector2 vector, Vector2 normal);
+        [MethodImpl(AggressiveInlining)]public static Vector2 SquareRoot(Vector2 value);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Subtract(Vector2 left, Vector2 right);
+        public override string ToString();
+        public string ToString(string format);
+        public string ToString(string format, IFormatProvider formatProvider);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Transform(Vector2 position, Matrix3x2 matrix);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Transform(Vector2 position, Matrix4x4 matrix);
+        [MethodImpl(AggressiveInlining)]public static Vector2 Transform(Vector2 value, Quaternion rotation);
+        [MethodImpl(AggressiveInlining)]public static Vector2 TransformNormal(Vector2 normal, Matrix3x2 matrix);
+        [MethodImpl(AggressiveInlining)]public static Vector2 TransformNormal(Vector2 normal, Matrix4x4 matrix);
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct Vector3 : IEquatable<Vector3>, IFormattable {
+        public float X;
+        public float Y;
+        public float Z;
+        public Vector3(float value);
+        public Vector3(float x, float y, float z);
+        public Vector3(Vector2 value, float z);
+        public static Vector3 One { get; }
+        public static Vector3 UnitX { get; }
+        public static Vector3 UnitY { get; }
+        public static Vector3 UnitZ { get; }
+        public static Vector3 Zero { get; }
+        [MethodImpl(AggressiveInlining)]public static Vector3 Abs(Vector3 value);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Add(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Clamp(Vector3 value1, Vector3 min, Vector3 max);
+        [MethodImpl(AggressiveInlining)]public void CopyTo(float[] array);
+        [MethodImpl(AggressiveInlining)]public void CopyTo(float[] array, int index);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Cross(Vector3 vector1, Vector3 vector2);
+        [MethodImpl(AggressiveInlining)]public static float Distance(Vector3 value1, Vector3 value2);
+        [MethodImpl(AggressiveInlining)]public static float DistanceSquared(Vector3 value1, Vector3 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Divide(Vector3 left, float divisor);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Divide(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static float Dot(Vector3 vector1, Vector3 vector2);
+        [MethodImpl(AggressiveInlining)]public override bool Equals(object obj);
+        public bool Equals(Vector3 other);
+        public override int GetHashCode();
+        [MethodImpl(AggressiveInlining)]public float Length();
+        [MethodImpl(AggressiveInlining)]public float LengthSquared();
+        [MethodImpl(AggressiveInlining)]public static Vector3 Lerp(Vector3 value1, Vector3 value2, float amount);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Max(Vector3 value1, Vector3 value2);
+        public static Vector3 Min(Vector3 value1, Vector3 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Multiply(float left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Multiply(Vector3 left, float right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Multiply(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Negate(Vector3 value);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Normalize(Vector3 value);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator +(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator /(Vector3 value1, float value2);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator /(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static bool operator ==(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static bool operator !=(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator *(float left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator *(Vector3 left, float right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator *(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator -(Vector3 left, Vector3 right);
+        [MethodImpl(AggressiveInlining)]public static Vector3 operator -(Vector3 value);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Reflect(Vector3 vector, Vector3 normal);
+        [MethodImpl(AggressiveInlining)]public static Vector3 SquareRoot(Vector3 value);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Subtract(Vector3 left, Vector3 right);
+        public override string ToString();
+        public string ToString(string format);
+        public string ToString(string format, IFormatProvider formatProvider);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Transform(Vector3 position, Matrix4x4 matrix);
+        [MethodImpl(AggressiveInlining)]public static Vector3 Transform(Vector3 value, Quaternion rotation);
+        [MethodImpl(AggressiveInlining)]public static Vector3 TransformNormal(Vector3 normal, Matrix4x4 matrix);
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct Vector4 : IEquatable<Vector4>, IFormattable {
+        public float W;
+        public float X;
+        public float Y;
+        public float Z;
+        public Vector4(float value);
+        public Vector4(float x, float y, float z, float w);
+        public Vector4(Vector2 value, float z, float w);
+        public Vector4(Vector3 value, float w);
+        public static Vector4 One { get; }
+        public static Vector4 UnitW { get; }
+        public static Vector4 UnitX { get; }
+        public static Vector4 UnitY { get; }
+        public static Vector4 UnitZ { get; }
+        public static Vector4 Zero { get; }
+        [MethodImpl(AggressiveInlining)]public static Vector4 Abs(Vector4 value);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Add(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Clamp(Vector4 value1, Vector4 min, Vector4 max);
+        [MethodImpl(AggressiveInlining)]public void CopyTo(float[] array);
+        [MethodImpl(AggressiveInlining)]public void CopyTo(float[] array, int index);
+        [MethodImpl(AggressiveInlining)]public static float Distance(Vector4 value1, Vector4 value2);
+        [MethodImpl(AggressiveInlining)]public static float DistanceSquared(Vector4 value1, Vector4 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Divide(Vector4 left, float divisor);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Divide(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static float Dot(Vector4 vector1, Vector4 vector2);
+        [MethodImpl(AggressiveInlining)]public override bool Equals(object obj);
+        public bool Equals(Vector4 other);
+        public override int GetHashCode();
+        [MethodImpl(AggressiveInlining)]public float Length();
+        [MethodImpl(AggressiveInlining)]public float LengthSquared();
+        [MethodImpl(AggressiveInlining)]public static Vector4 Lerp(Vector4 value1, Vector4 value2, float amount);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Max(Vector4 value1, Vector4 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Min(Vector4 value1, Vector4 value2);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Multiply(float left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Multiply(Vector4 left, float right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Multiply(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Negate(Vector4 value);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Normalize(Vector4 vector);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator +(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator /(Vector4 value1, float value2);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator /(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static bool operator ==(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static bool operator !=(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator *(float left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator *(Vector4 left, float right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator *(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator -(Vector4 left, Vector4 right);
+        [MethodImpl(AggressiveInlining)]public static Vector4 operator -(Vector4 value);
+        [MethodImpl(AggressiveInlining)]public static Vector4 SquareRoot(Vector4 value);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Subtract(Vector4 left, Vector4 right);
+        public override string ToString();
+        public string ToString(string format);
+        public string ToString(string format, IFormatProvider formatProvider);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Transform(Vector2 position, Matrix4x4 matrix);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Transform(Vector2 value, Quaternion rotation);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Transform(Vector3 position, Matrix4x4 matrix);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Transform(Vector3 value, Quaternion rotation);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Transform(Vector4 vector, Matrix4x4 matrix);
+        [MethodImpl(AggressiveInlining)]public static Vector4 Transform(Vector4 value, Quaternion rotation);
+    }
 }
 namespace System.Reflection {
     public sealed class AssemblyName : _AssemblyName, ICloneable, IDeserializationCallback, ISerializable {
-        public string CultureName { get; }
+        public string CultureName { get; set; }
     }
 }
 namespace System.Runtime {
     public enum GCLatencyMode {
+        NoGCRegion = 4,
     }
 }
 namespace System.Runtime.CompilerServices {
-    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
-    public struct AsyncTaskMethodBuilder : IAsyncMethodBuilder {
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct AsyncTaskMethodBuilder {
     }
-    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
-    public struct AsyncTaskMethodBuilder<TResult> : IAsyncMethodBuilder {
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct AsyncTaskMethodBuilder<TResult> {
     }
-    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
-    public struct AsyncVoidMethodBuilder : IAsyncMethodBuilder {
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct AsyncVoidMethodBuilder {
     }
+    public sealed class DisablePrivateReflectionAttribute : Attribute {
+        public DisablePrivateReflectionAttribute();
+    }
+    public static class FormattableStringFactory {
+        public static FormattableString Create(string format, params object[] arguments);
+    }
 }
 namespace System.Runtime.InteropServices {
     public static class Marshal {
-        public static IntPtr CreateAggregatedObject(IntPtr pOuter, object o);
+        [MethodImpl(InternalCall)]public static IntPtr CreateAggregatedObject(IntPtr pOuter, object o);
-        public static void DestroyStructure(IntPtr ptr, Type structuretype);
+        [MethodImpl(InternalCall)]public static void DestroyStructure(IntPtr ptr, Type structuretype);
-        public static int GetExceptionCode();
+        [MethodImpl(InternalCall)]public static int GetExceptionCode();
-        public static void GetNativeVariantForObject(object obj, IntPtr pDstNativeVariant);
+        [MethodImpl(InternalCall)]public static void GetNativeVariantForObject(object obj, IntPtr pDstNativeVariant);
-        public static object GetObjectForIUnknown(IntPtr pUnk);
+        [MethodImpl(InternalCall)]public static object GetObjectForIUnknown(IntPtr pUnk);
-        public static object GetObjectForNativeVariant(IntPtr pSrcNativeVariant);
+        [MethodImpl(InternalCall)]public static object GetObjectForNativeVariant(IntPtr pSrcNativeVariant);
-        public static object[] GetObjectsForNativeVariants(IntPtr aSrcNativeVariant, int cVars);
+        [MethodImpl(InternalCall)]public static object[] GetObjectsForNativeVariants(IntPtr aSrcNativeVariant, int cVars);
-        public static int GetStartComSlot(Type t);
+        [MethodImpl(InternalCall)]public static int GetStartComSlot(Type t);
-        public static object GetUniqueObjectForIUnknown(IntPtr unknown);
+        [MethodImpl(InternalCall)]public static object GetUniqueObjectForIUnknown(IntPtr unknown);
-        public static void StructureToPtr(object structure, IntPtr ptr, bool fDeleteOld);
+        [MethodImpl(InternalCall)]public static void StructureToPtr(object structure, IntPtr ptr, bool fDeleteOld);
-        public static IntPtr UnsafeAddrOfPinnedArrayElement(Array arr, int index);
+        [MethodImpl(InternalCall)]public static IntPtr UnsafeAddrOfPinnedArrayElement(Array arr, int index);
     }
 }
 namespace System.Runtime.Serialization {
     public sealed class CollectionDataContractAttribute : Attribute {
+        public bool IsItemNameSetExplicitly { get; }
+        public bool IsKeyNameSetExplicitly { get; }
+        public bool IsNameSetExplicitly { get; }
+        public bool IsNamespaceSetExplicitly { get; }
+        public bool IsReferenceSetExplicitly { get; }
+        public bool IsValueNameSetExplicitly { get; }
     }
     public sealed class DataContractAttribute : Attribute {
+        public bool IsNameSetExplicitly { get; }
+        public bool IsNamespaceSetExplicitly { get; }
+        public bool IsReferenceSetExplicitly { get; }
     }
     public sealed class DataMemberAttribute : Attribute {
+        public bool IsNameSetExplicitly { get; }
     }
     public sealed class EnumMemberAttribute : Attribute {
+        public bool IsValueSetExplicitly { get; }
     }
 }
 namespace System.Security.AccessControl {
     public sealed class AuthorizationRuleCollection : ReadOnlyCollectionBase {
+        public AuthorizationRuleCollection();
+        public void AddRule(AuthorizationRule rule);
     }
     public sealed class CommonSecurityDescriptor : GenericSecurityDescriptor {
+        public void AddDiscretionaryAcl(byte revision, int trusted);
+        public void AddSystemAcl(byte revision, int trusted);
     }
     public sealed class DiscretionaryAcl : CommonAcl {
+        public void AddAccess(AccessControlType accessType, SecurityIdentifier sid, ObjectAccessRule rule);
+        public bool RemoveAccess(AccessControlType accessType, SecurityIdentifier sid, ObjectAccessRule rule);
+        public void RemoveAccessSpecific(AccessControlType accessType, SecurityIdentifier sid, ObjectAccessRule rule);
+        public void SetAccess(AccessControlType accessType, SecurityIdentifier sid, ObjectAccessRule rule);
     }
     public abstract class ObjectSecurity {
+        protected ObjectSecurity();
+        protected ObjectSecurity(CommonSecurityDescriptor securityDescriptor);
     }
     public sealed class SystemAcl : CommonAcl {
+        public void AddAudit(SecurityIdentifier sid, ObjectAuditRule rule);
+        public bool RemoveAudit(SecurityIdentifier sid, ObjectAuditRule rule);
+        public void RemoveAuditSpecific(SecurityIdentifier sid, ObjectAuditRule rule);
+        public void SetAudit(SecurityIdentifier sid, ObjectAuditRule rule);
     }
 }
 namespace System.Security.Claims {
     public class Claim {
+        public Claim(BinaryReader reader);
+        public Claim(BinaryReader reader, ClaimsIdentity subject);
+        protected Claim(Claim other);
+        protected Claim(Claim other, ClaimsIdentity subject);
+        protected virtual byte[] CustomSerializationData { get; }
+        public virtual void WriteTo(BinaryWriter writer);
+        protected virtual void WriteTo(BinaryWriter writer, byte[] userData);
     }
     public class ClaimsIdentity : IIdentity {
+        public ClaimsIdentity(BinaryReader reader);
+        protected ClaimsIdentity(ClaimsIdentity other);
+        protected virtual byte[] CustomSerializationData { get; }
+        protected virtual Claim CreateClaim(BinaryReader reader);
+        public virtual void WriteTo(BinaryWriter writer);
+        protected virtual void WriteTo(BinaryWriter writer, byte[] userData);
     }
     public class ClaimsPrincipal : IPrincipal {
+        public ClaimsPrincipal(BinaryReader reader);
+        protected virtual byte[] CustomSerializationData { get; }
+        public virtual ClaimsPrincipal Clone();
+        protected virtual ClaimsIdentity CreateClaimsIdentity(BinaryReader reader);
+        public virtual void WriteTo(BinaryWriter writer);
+        protected virtual void WriteTo(BinaryWriter writer, byte[] userData);
     }
 }
 namespace System.Security.Cryptography {
     public abstract class AsymmetricAlgorithm : IDisposable {
-        public abstract string KeyExchangeAlgorithm { get; }
+        public virtual string KeyExchangeAlgorithm { get; }
-        public abstract string SignatureAlgorithm { get; }
+        public virtual string SignatureAlgorithm { get; }
-        public abstract void FromXmlString(string xmlString);
+        public virtual void FromXmlString(string xmlString);
-        public abstract string ToXmlString(bool includePrivateParameters);
+        public virtual string ToXmlString(bool includePrivateParameters);
     }
     public sealed class CngAlgorithm : IEquatable<CngAlgorithm> {
+        public static CngAlgorithm Rsa { get; }
     }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct HashAlgorithmName : IEquatable<HashAlgorithmName> {
+        public HashAlgorithmName(string name);
+        public static HashAlgorithmName MD5 { get; }
+        public string Name { get; }
+        public static HashAlgorithmName SHA1 { get; }
+        public static HashAlgorithmName SHA256 { get; }
+        public static HashAlgorithmName SHA384 { get; }
+        public static HashAlgorithmName SHA512 { get; }
+        public bool Equals(HashAlgorithmName other);
+        public override bool Equals(object obj);
+        public override int GetHashCode();
+        public static bool operator ==(HashAlgorithmName left, HashAlgorithmName right);
+        public static bool operator !=(HashAlgorithmName left, HashAlgorithmName right);
+        public override string ToString();
+    }
     public abstract class RandomNumberGenerator : IDisposable {
+        public virtual void GetBytes(byte[] data, int offset, int count);
     }
     public class Rfc2898DeriveBytes : DeriveBytes {
+        public byte[] CryptDeriveKey(string algname, string alghashname, int keySize, byte[] rgbIV);
     }
     public abstract class RSA : AsymmetricAlgorithm {
+        public override string KeyExchangeAlgorithm { get; }
+        public override string SignatureAlgorithm { get; }
+        public virtual byte[] Decrypt(byte[] data, RSAEncryptionPadding padding);
-        public abstract byte[] DecryptValue(byte[] rgb);
+        public virtual byte[] DecryptValue(byte[] rgb);
+        public virtual byte[] Encrypt(byte[] data, RSAEncryptionPadding padding);
-        public abstract byte[] EncryptValue(byte[] rgb);
+        public virtual byte[] EncryptValue(byte[] rgb);
+        protected virtual byte[] HashData(byte[] data, int offset, int count, HashAlgorithmName hashAlgorithm);
+        protected virtual byte[] HashData(Stream data, HashAlgorithmName hashAlgorithm);
+        public byte[] SignData(byte[] data, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public virtual byte[] SignData(byte[] data, int offset, int count, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public virtual byte[] SignData(Stream data, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public virtual byte[] SignHash(byte[] hash, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public bool VerifyData(byte[] data, byte[] signature, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public virtual bool VerifyData(byte[] data, int offset, int count, byte[] signature, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public bool VerifyData(Stream data, byte[] signature, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public virtual bool VerifyHash(byte[] hash, byte[] signature, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
     }
+    public sealed class RSACng : RSA {
+        public RSACng();
+        public RSACng(CngKey key);
+        public RSACng(int keySize);
+        public CngKey Key { get; private set; }
+        public override byte[] Decrypt(byte[] data, RSAEncryptionPadding padding);
+        public override byte[] Encrypt(byte[] data, RSAEncryptionPadding padding);
+        public override RSAParameters ExportParameters(bool includePrivateParameters);
+        public override void ImportParameters(RSAParameters parameters);
+        public override byte[] SignHash(byte[] hash, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public override bool VerifyHash(byte[] hash, byte[] signature, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+    }
     public sealed class RSACryptoServiceProvider : RSA, ICspAsymmetricAlgorithm {
+        public override byte[] Decrypt(byte[] data, RSAEncryptionPadding padding);
+        public override byte[] Encrypt(byte[] data, RSAEncryptionPadding padding);
+        public override byte[] SignHash(byte[] hash, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
+        public override bool VerifyHash(byte[] hash, byte[] signature, HashAlgorithmName hashAlgorithm, RSASignaturePadding padding);
     }
+    public sealed class RSAEncryptionPadding : IEquatable<RSAEncryptionPadding> {
+        public RSAEncryptionPaddingMode Mode { get; }
+        public HashAlgorithmName OaepHashAlgorithm { get; }
+        public static RSAEncryptionPadding OaepSHA1 { get; }
+        public static RSAEncryptionPadding OaepSHA256 { get; }
+        public static RSAEncryptionPadding OaepSHA384 { get; }
+        public static RSAEncryptionPadding OaepSHA512 { get; }
+        public static RSAEncryptionPadding Pkcs1 { get; }
+        public static RSAEncryptionPadding CreateOaep(HashAlgorithmName hashAlgorithm);
+        public override bool Equals(object obj);
+        public bool Equals(RSAEncryptionPadding other);
+        public override int GetHashCode();
+        public static bool operator ==(RSAEncryptionPadding left, RSAEncryptionPadding right);
+        public static bool operator !=(RSAEncryptionPadding left, RSAEncryptionPadding right);
+        public override string ToString();
+    }
+    public enum RSAEncryptionPaddingMode {
+        Oaep = 1,
+        Pkcs1 = 0,
+    }
+    public sealed class RSASignaturePadding : IEquatable<RSASignaturePadding> {
+        public RSASignaturePaddingMode Mode { get; }
+        public static RSASignaturePadding Pkcs1 { get; }
+        public static RSASignaturePadding Pss { get; }
+        public override bool Equals(object obj);
+        public bool Equals(RSASignaturePadding other);
+        public override int GetHashCode();
+        public static bool operator ==(RSASignaturePadding left, RSASignaturePadding right);
+        public static bool operator !=(RSASignaturePadding left, RSASignaturePadding right);
+        public override string ToString();
+    }
+    public enum RSASignaturePaddingMode {
+        Pkcs1 = 0,
+        Pss = 1,
+    }
 }
 namespace System.Security.Cryptography.X509Certificates {
+    public static class RSACertificateExtensions {
+        public static RSA GetRSAPrivateKey(this X509Certificate2 certificate);
+        public static RSA GetRSAPublicKey(this X509Certificate2 certificate);
+    }
-    public class X509Certificate : IDeserializationCallback, ISerializable {
+    public class X509Certificate : IDeserializationCallback, IDisposable, ISerializable {
+        public void Dispose();
+        protected virtual void Dispose(bool disposing);
     }
-    public class X509Chain {
+    public class X509Chain : IDisposable {
+        public SafeX509ChainHandle SafeHandle { get; }
+        public void Dispose();
+        protected virtual void Dispose(bool disposing);
     }
-    public sealed class X509Store {
+    public sealed class X509Store : IDisposable {
+        public void Dispose();
     }
 }
 namespace System.Security.Cryptography.Xml {
     public class EncryptedXml {
+        public int XmlDSigSearchDepth { get; set; }
     }
 }
 namespace System.Security.Principal {
     public class WindowsIdentity : ClaimsIdentity, IDeserializationCallback, IDisposable, ISerializable {
+        public SafeAccessTokenHandle AccessToken { get; }
+        public static T RunImpersonated<T>(SafeAccessTokenHandle safeAccessTokenHandle, Func<T> func);
+        public static void RunImpersonated(SafeAccessTokenHandle safeAccessTokenHandle, Action action);
     }
 }
 namespace System.ServiceModel {
     public sealed class TcpTransportSecurity {
+        public SslProtocols SslProtocols { get; set; }
     }
 }
 namespace System.ServiceModel.Channels {
     public class SslStreamSecurityBindingElement : StreamUpgradeBindingElement, IPolicyExportExtension, ITransportTokenAssertionProvider {
+        public SslProtocols SslProtocols { get; set; }
     }
 }
 namespace System.ServiceModel.Configuration {
     public sealed class SslStreamSecurityElement : BindingElementExtensionElement {
+        public SslProtocols SslProtocols { get; private set; }
     }
     public sealed class TcpTransportSecurityElement : ServiceModelConfigurationElement {
+        public SslProtocols SslProtocols { get; private set; }
     }
 }
 namespace System.Text {
     public abstract class Encoding : ICloneable {
+        protected Encoding(int codePage, EncoderFallback encoderFallback, DecoderFallback decoderFallback);
+        public unsafe string GetString(byte* bytes, int byteCount);
+        public static void RegisterProvider(EncodingProvider provider);
     }
+    public abstract class EncodingProvider {
+        public EncodingProvider();
+        public abstract Encoding GetEncoding(int codepage);
+        public virtual Encoding GetEncoding(int codepage, EncoderFallback encoderFallback, DecoderFallback decoderFallback);
+        public abstract Encoding GetEncoding(string name);
+        public virtual Encoding GetEncoding(string name, EncoderFallback encoderFallback, DecoderFallback decoderFallback);
+    }
     public sealed class StringBuilder : ISerializable {
+        public unsafe StringBuilder Append(char* value, int valueCount);
+        public StringBuilder AppendFormat(IFormatProvider provider, string format, object arg0);
+        public StringBuilder AppendFormat(IFormatProvider provider, string format, object arg0, object arg1);
+        public StringBuilder AppendFormat(IFormatProvider provider, string format, object arg0, object arg1, object arg2);
     }
 }
 namespace System.Threading {
+    public sealed class AsyncLocal<T> : IAsyncLocal {
+        public AsyncLocal();
+        public AsyncLocal(Action<AsyncLocalValueChangedArgs<T>> valueChangedHandler);
+        public T Value { get; set; }
+    }
+    [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
+    public struct AsyncLocalValueChangedArgs<T> {
+        public T CurrentValue { get; private set; }
+        public T PreviousValue { get; private set; }
+        public bool ThreadContextChanged { get; private set; }
+    }
+    public static class WaitHandleExtensions {
+        public static SafeWaitHandle GetSafeWaitHandle(this WaitHandle waitHandle);
+        public static void SetSafeWaitHandle(this WaitHandle waitHandle, SafeWaitHandle value);
+    }
 }
 namespace System.Threading.Tasks {
     public class Task : IAsyncResult, IDisposable, IThreadPoolWorkItem {
+        public static Task CompletedTask { get; }
+        public static Task<TResult> FromCanceled<TResult>(CancellationToken cancellationToken);
+        public static Task FromCanceled(CancellationToken cancellationToken);
+        public static Task<TResult> FromException<TResult>(Exception exception);
+        public static Task FromException(Exception exception);
     }
     public class TaskCompletionSource<TResult> {
+        public bool TrySetCanceled(CancellationToken cancellationToken);
     }
     public enum TaskContinuationOptions {
+        RunContinuationsAsynchronously = 64,
     }
     public enum TaskCreationOptions {
+        RunContinuationsAsynchronously = 64,
     }
 }
 namespace System.Web {
     public sealed class HttpRequest {
+        public ITlsTokenBindingInfo TlsTokenBindingInfo { get; }
     }
     public abstract class HttpRequestBase {
+        public virtual ITlsTokenBindingInfo TlsTokenBindingInfo { get; }
     }
     public class HttpRequestWrapper : HttpRequestBase {
+        public override ITlsTokenBindingInfo TlsTokenBindingInfo { get; }
     }
     public sealed class HttpResponse {
+        public Task FlushAsync();
+        public void PushPromise(string path);
+        public void PushPromise(string path, string method, NameValueCollection headers);
     }
     public abstract class HttpResponseBase {
+        public virtual Task FlushAsync();
+        public virtual void PushPromise(string path);
+        public virtual void PushPromise(string path, string method, NameValueCollection headers);
     }
     public class HttpResponseWrapper : HttpResponseBase {
+        public override Task FlushAsync();
+        public override void PushPromise(string path);
+        public override void PushPromise(string path, string method, NameValueCollection headers);
     }
+    public interface ITlsTokenBindingInfo {
+        byte[] GetProvidedTokenBindingId();
+        byte[] GetReferredTokenBindingId();
+    }
 }
 namespace System.Web.UI.WebControls {
     public class ModelDataSourceView : DataSourceView, IStateManager {
+        public override void Delete(IDictionary keys, IDictionary oldValues, DataSourceViewOperationCallback callback);
+        public override void Insert(IDictionary values, DataSourceViewOperationCallback callback);
+        public override void Select(DataSourceSelectArguments arguments, DataSourceViewSelectCallback callback);
+        public override void Update(IDictionary keys, IDictionary values, IDictionary oldValues, DataSourceViewOperationCallback callback);
     }
+    public sealed class SelectResult {
+        public SelectResult(int totalRowCount, IEnumerable results);
+        public IEnumerable Results { get; private set; }
+        public int TotalRowCount { get; private set; }
+    }
 }
 namespace System.Windows {
     public static class CoreCompatibilityPreferences {
+        public static Nullable<bool> EnableMultiMonitorDisplayClipping { get; set; }
     }
 }
+namespace System.Windows.Diagnostics {
+    public static class VisualDiagnostics {
+        public static XamlSourceInfo GetXamlSourceInfo(object obj);
+        public static event EventHandler<VisualTreeChangeEventArgs> VisualTreeChanged;
+    }
+    public class VisualTreeChangeEventArgs : EventArgs {
+        public VisualTreeChangeEventArgs(DependencyObject parent, DependencyObject child, int childIndex, VisualTreeChangeType changeType);
+        public VisualTreeChangeType ChangeType { get; private set; }
+        public DependencyObject Child { get; private set; }
+        public int ChildIndex { get; private set; }
+        public DependencyObject Parent { get; private set; }
+    }
+    public enum VisualTreeChangeType {
+        Add = 0,
+        Remove = 1,
+    }
+    public class XamlSourceInfo {
+        public XamlSourceInfo(Uri sourceUri, int lineNumber, int linePosition);
+        public int LineNumber { get; private set; }
+        public int LinePosition { get; private set; }
+        public Uri SourceUri { get; private set; }
+    }
+}
 namespace System.Windows.Forms {
     public class MonthCalendar : Control {
+        protected override void DefWndProc(ref Message m);
     }
 }
 namespace System.Windows.Input {
     public sealed class Cursor : IDisposable {
+        public Cursor(Stream cursorStream, bool scaleWithDpi);
+        public Cursor(string cursorFile, bool scaleWithDpi);
     }
     public sealed class StylusDevice : InputDevice {
+        public bool IsValid { get; }
     }
 }
 namespace System.Windows.Interop {
     [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
     public struct HwndSourceParameters {
+        public bool UsesPerPixelTransparency { get; set; }
     }
 }
 namespace System.Xaml {
     public class XamlObjectEventArgs : EventArgs {
+        public int ElementLineNumber { get; private set; }
+        public int ElementLinePosition { get; private set; }
+        public Uri SourceBamlUri { get; private set; }
     }
 }
 namespace System.Xml {
     public class XmlCDataSection : XmlCharacterData {
+        public override XmlNode PreviousText { get; }
     }
     public abstract class XmlNode : ICloneable, IEnumerable, IXPathNavigable {
+        public virtual XmlNode PreviousText { get; }
     }
     public class XmlSignificantWhitespace : XmlCharacterData {
+        public override XmlNode PreviousText { get; }
     }
     public class XmlText : XmlCharacterData {
+        public override XmlNode PreviousText { get; }
     }
     public class XmlWhitespace : XmlCharacterData {
+        public override XmlNode PreviousText { get; }
     }
 }
 namespace Microsoft.Win32 {
     public sealed class RegistryKey : MarshalByRefObject, IDisposable {
+        public RegistryKey CreateSubKey(string subkey, bool writable);
+        public RegistryKey CreateSubKey(string subkey, bool writable, RegistryOptions options);
+        public RegistryKey OpenSubKey(string name, RegistryRights rights);
     }
 }
 namespace Microsoft.Win32.SafeHandles {
+    public sealed class SafeAccessTokenHandle : SafeHandle {
+        public SafeAccessTokenHandle(IntPtr handle);
+        public static SafeAccessTokenHandle InvalidHandle { get; }
+        public override bool IsInvalid { get; }
+    }
+    public sealed class SafeProcessHandle : SafeHandleZeroOrMinusOneIsInvalid {
+        public SafeProcessHandle(IntPtr existingHandle, bool ownsHandle);
+    }
+    public sealed class SafeX509ChainHandle : SafeHandleZeroOrMinusOneIsInvalid {
+    }
 }
```
