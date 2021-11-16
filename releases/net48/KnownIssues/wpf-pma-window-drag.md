# Per-Monitor DPI-aware WPF applications position mouse cursor incorrectly when dragging between monitors

## Symptoms
A user running a WPF application that enables the Per-Monitor DPI awareness feature introduced in .NET Framework 4.7.2 may notice that the mouse cursor is in a different location relative to the window after dragging the window from one monitor to another.

## Cause
This issue is caused by a calculation error when resizing and placing the window after switching DPI.

## Resolution
This issue is being tracked at https://github.com/dotnet/wpf/issues/967.
