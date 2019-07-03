## Contract.Invariant or Contract.Requires\<TException> do not consider String.IsNullOrEmpty to be pure

### Scope
Minor

### Version Introduced
4.6.1

### Source Analyzer Status
Investigating

### Change Description
For apps that target the .NET Framework 4.6.1, if the invariant contract for <xref:System.Diagnostics.Contracts.Contract.Invariant%2A?displayProperty=nameWithType> or the precondition contract for <xref:System.Diagnostics.Contracts.Contract.Requires%2A?displayProperty=nameWithType)> calls the <xref:System.String.IsNullOrEmpty%2A?displayProperty=nameWithType> method, the rewriter emits compiler warning CC1036: "Detected call to method 'System.String.IsNullOrWhteSpace(System.String)' without [Pure] in method." This is a compiler warning rather than a compiler error.

- [ ] Quirked 
- [ ] Build-time break 

### Recommended Action

This behavior was addressed in [GitHub Issue #339](https://github.com/Microsoft/CodeContracts/issues/339). To eliminate this warning, you can download and compile an updated version of the source code for the Code Contracts tool from [GitHub](https://github.com/Microsoft/CodeContracts/blob/master/README.md). Download information is found at the bottom of the page.

### Affected APIs
- M:System.Diagnostics.Contracts.Contract.Invariant(System.Boolean)   
- M:System.Diagnostics.Contracts.Contract.Requires(System.Boolean)

### Category
Tools

<!-- breaking change id: 189 -->
