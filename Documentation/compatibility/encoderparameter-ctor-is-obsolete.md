## EncoderParameter ctor is obsolete

### Scope
Minor

### Version Introduced
4.5

### Source Analyzer Status
Available

### Change Description
The <xref:System.Drawing.Imaging.EncoderParameter.#ctor(System.Drawing.Imaging.Encoder,System.Int32,System.Int32,System.Int32,System.Int32)>
constructor is obsolete now and will introduce build warnings if used.

- [ ] Quirked
- [x] Build-time break

### Recommended Action
Although the
<xref:System.Drawing.Imaging.EncoderParameter.#ctor(System.Drawing.Imaging.Encoder,System.Int32,System.Int32,System.Int32,System.Int32)>

constructor will continue to work, the following constructor should be used
instead to avoid the obsolete build warning when re-compiling code with .NET Framework  4.5
tools:
<xref:System.Drawing.Imaging.EncoderParameter.#ctor(System.Drawing.Imaging.Encoder,System.Int32,System.Drawing.Imaging.EncoderParameterValueType,System.IntPtr)>.

### Affected APIs
* `M:System.Drawing.Imaging.EncoderParameter.#ctor(System.Drawing.Imaging.Encoder,System.Int32,System.Int32,System.Int32,System.Int32)`

### Category
Windows Forms

<!-- breaking change id: 24 -->
