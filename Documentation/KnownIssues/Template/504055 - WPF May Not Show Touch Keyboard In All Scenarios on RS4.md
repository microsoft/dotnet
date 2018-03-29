# WPF May Not Show Touch Keyboard In All Scenarios on Windows 10 RS4

## Symptoms
On Windows 10 RS4 running .NET Framework 4.7.2, WPF applications may not immediately show the touch keyboard in some specific scenarios.  

Generally, these involve variations of the following:

1. Tap a text box and note the touch keyboard shows.
2. Tap another text box.
3. Tap the 'X' on the touch keyboard to close it.
4. Tap the text box from step 1 and note the touch keyboard does not show.

## Cause
A WPF change in .NET Framework 4.7.2 is preventing WPF from requesting the touch keyboard show.  Due to this, the touch keyboard tracking algorithm in Windows 10 RS4 does not show the
keyboard in all scenarios.

## Resolution
This will be fixed in the first servicing release for Windows 10 RS4.

In the meantime, users can tap another text box within the application or they can explicitly tap the touch keyboard button on the start bar to ensure the keyboard shows.
