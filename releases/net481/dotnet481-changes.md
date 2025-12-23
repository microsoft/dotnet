# .NET Framework 4.8.1 Release Notes

.NET Framework release notes describe product improvements grouped by product area. 

## Native support for Arm64

* Add native Arm64 support to the .NET Framework family to leverage the benefits of running workloads natively on Arm64 for better performance when compared to running x64 code emulated on Arm64.

## Accessible Tooltips

* tooltips now comply with the guidelines set forth in the [WCAG2.1 content on Hover or Focus](https://www.w3.org/WAI/WCAG21/Understanding/content-on-hover-or-focus.html) guidance. The requirements for tooltips require the following:
- Tooltips must display either via mouse hover or by keyboard navigation to the control.
- Tooltips should be **dismissable**. That is, a simple keyboard command like the ESC key should dismiss the tooltip.
- Tooltips should be **hoverable**. Users should be able to place their mouse cursor over the tooltip. This enables scenarios like using magnifier to be able to read the tooltip for low-vision users.
- Tooltips should be **persistent**. Tooltips should not automatically disappear after a certain time has elapsed. Rather, the tooltips should be dismissed by the user moving their mouse to another control, or by dismissing the tooltip as described above.

## Windows Forms

* Added support for the UIA Text Pattern to enable assistive technology to traverse the content of a TextBox or similar text-based control letter by letter.
* Fixed high contrast issues in several controls and have changed the contrast ratio of selection rectangles to be darker and more visible.
* Fixed several DataGridView issues: 
- Updated the scrollbar names for consistency.
- Fixed an issue where Narrator was unable to focus on empty DataGridView cells.
- Enabled developers to set the localized control type property for Custom DataGridView cells. 
- Updated the link color for DataGridViewLink cells to have better contrast with the background.