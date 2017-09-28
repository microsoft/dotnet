## WPF InvalidCastException when Resolving DynamicResource

### Symptoms
The crash occurs when a DynamicResource reference to a value A, in a context where a different value B is expected.  The values have different types, leading to an InvalidCastException.

### Cause
The bug only occurs when the following conditions are met:
* An assembly declares its key in the Resources attached to a Style or Template.
* There's a DynamicResource reference using the same key string somewhere in WPF's theme file.

Under these conditions it is possible that the DynamicResource resolved to an unexpected type leading to an InvalidCastException.

### Resolution
The fix for this is expected in future servicing update for Windows 10.

### More information