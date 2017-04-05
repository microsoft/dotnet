## 24: EncoderParameter ctor is obsolete

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
The `EncoderParameter.EncoderParameter(Encoder, Int32, Int32, Int32)` constructor is obsolete now and will introduce build warnings if used.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
Although the `EncoderParameter.EncoderParameter(Encoder, Int32, Int32, Int32)`  constructor will continue to work, the following constructor should be used instead to avoid the obsolete build warning when re-compiling code with .NET 4.5 tools: [EncoderParameter.EncoderParameter(Encoder, Int32, EncoderParameterValueType, IntPtr)](https://msdn.microsoft.com/en-us/library/hh875096(v=vs.110).aspx).

### Affected APIs
* `M:System.Drawing.Imaging.EncoderParameter.#ctor(System.Drawing.Imaging.Encoder,System.Int32,System.Int32,System.Int32,System.Int32)`

### Category
Windows Forms

[More information](https://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx#winForms)
