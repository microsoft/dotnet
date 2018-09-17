# WPF May Not Show Touch Keyboard In All Scenarios on Windows 10 April 2018 Update 

## Symptoms
In the .NET Framework 4.7.2 running on Windows 10 April 2018 Update, WPF applications may not immediately show the touch keyboard in some specific scenarios.  Generally, these involve variations of the following.

1. Tap a text box and note the touch keyboard shows.
2. Tap another text box.
3. Tap the 'X' on the touch keyboard to close it.
4. Tap the text box from step 1 and note the touch keyboard does not show.

## Cause
A WPF change in .NET Framework 4.7.2 is preventing WPF from requesting the touch keyboard show.  Due to this, the touch keyboard tracking algorithm in Windows 10 April 2018 Update does not show the
keyboard in all scenarios.

## Resolution
A fix for this issue is available in [KB4103721](https://support.microsoft.com/en-us/help/4103721/windows-10-update-kb4103721).
