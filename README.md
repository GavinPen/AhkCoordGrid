# AhkCoordGrid
AutoHotkey code for Windows overlay grid allowing you to emulate a mouse left-click at different points on the screen using keyboard shortcuts.

When you press NumKeyEnter, this script builds then displays a movable 26*26 grid of buttons (actually AHK edit controls), labelled AA-ZZ, overlaying the whole screen.
You can then move the grid using arrow keys, and you can emulate a mouse-click (or a touchscreen 'touch') at any of those 676 locations by entering the coordinates, as displayed on each button, as keyboard shortcuts.
Pressing NumKeyEnter thereafter toggles the grid (it displays much faster after the first time, as it has already been built).

Inspired by the cVim chrome plugin's 'hints' - shortcut keys to most links / buttons on web pages.
Previously posted on the AutoHotkey forum, and includes code around timing of key presses by the user @scriptor on that forum.

AhkCoordGrid goes some way towards helping realize WCAG 2.1 Success Criterion 2.1.1, which begins 'All functionality of the content is operable through a keyboard interface ...'

## RELEASE HISTORY

### 2/2/2019 v1.0

Initial release. Grid not movable.

### 27/11/2019 v2.0

Grid made movable, thanks to code contributed by SpeedMaster @ www.autohotkey.com/boards