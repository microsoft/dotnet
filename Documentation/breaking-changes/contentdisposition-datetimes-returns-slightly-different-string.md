## 78: ContentDisposition DateTimes returns slightly different string

### Scope
Minor

### Version Introduced
4.6

### Source Analyzer Status
Available

### Change Description
String representations of ContentDispositions have been updated, beginning in 4.6, to always represent the hour component of a DateTime with two digits. This is to comply with [RFC822](http://www.ietf.org/rfc/rfc0822.txt) and [RFC2822](http://www.ietf.org/rfc/rfc2822.txt). This causes `ContentDisposition.ToString` to return a slightly different string in 4.6 in scenarios where one of the disposition's time elements was before 10:00 AM. Note that ContentDispositions are sometimes serialized via converting them to strings, so any ContentDisposition ToString operations, serialization, or GetHashCode calls should be reviewed.

- [ ] Quirked
- [ ] Build-time break

### Recommended Action
Do not expect that string representations of ContentDispositions from different .NET Framework versions will correctly compare to one another. Convert the strings back to ContentDispositions, if possible, before conducting a comparison.

### Affected APIs
* `M:System.Net.Mime.ContentDisposition.ToString`
* `M:System.Net.Mime.ContentDisposition.GetHashCode`

### Category
Networking

[More information](https://msdn.microsoft.com/en-us/library/dn833125(v=vs.110).aspx#Networking)
