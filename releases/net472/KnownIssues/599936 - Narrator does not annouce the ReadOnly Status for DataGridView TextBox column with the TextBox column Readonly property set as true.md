# Narrator does not annouce the ReadOnly Status for DataGridView TextBox column with the TextBox column Readonly property set as true

## Symptoms
Narrator does not announce the value of the ReadOnly property of the System.Windows.Forms.DataGridViewTextBoxColumn. This is the case regardless of the value of the ReadOnly property. This could cause confusion for Narrator users when editing content in a DataGridViewTextBoxColumn.
## Cause
The issue is caused by changes to updates in .NET Framework 4.7.2 which improved the accessibility support of the DataGridView. That change caused Narrator to be unable to narrate the ReadOnly status of the TextBoxColumn regardless of the setting.

## Workaround 
There is no workaround for this issue.

## Resolution
A proper fix of the DataGridView AccessibleObject will ship in the coming versions of .NET Framework. This known issue will be updated with more details when that happens.


