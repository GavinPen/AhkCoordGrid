# AhkCoordGrid
AutoHotkey code for Windows overlay grid allowing you to emulate mouse click at different points on the screen using keyboard shortcuts

When you press NumKeyEnter, this script builds then displays a 26*26 grid of buttons (actually AHK edit controls), labelled AA-ZZ, overlaying the whole screen.
You can then emulate a mouse-click (or a touchscreen 'touch') at any of those 676 locations by entering the coordinates, as displayed on each button, as keyboard shortcuts.
Pressing NumKeyEnter thereafter toggles the grid (it displays much faster after the first time, as it has already been built)

Inspired by the cVim chrome plugin's 'hints' - shortcut keys to most links / buttons on web pages.
Previously posted on the AutoHotkey forum, and includes code around timing of key presses by the user @scriptor on that forum.

This is quite a blunt instrument:
- you won't always be able to click on everything you need to
- on any given screen, most buttons will probably not be useful 
But as somebody who likes to avoid using the mouse, I already find it useful - I hope others will too.
