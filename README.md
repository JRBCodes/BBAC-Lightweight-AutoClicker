# BBAC Lightweight Auto Clicker
A Lightweight low-precision autoclicker for Windows.  
It only has 1 function, to automatically click.  

The only GUI it has is to modify the CPS in which it operates.

## Hotkeys
<table>
  <tr>
    <td><b>Hotkey</b></td>
    <td><b>Action</b></td>
  </tr>
  <tr>
    <td><b>Ctrl + Shift + C</b></td>
    <td>Toggle autoclick.</td>
  </tr>
  <tr>
    <td><b>Alt + m</b></td>
    <td>Open GUI which enables user to change default CPS.</td>
  </tr>
  <tr>
    <td><b>Alt+X</b></td>
    <td>Close script.</td>
  </tr>
</table>

## Limitations
CPS Precision is only **~15 ms** due to Window's default precision for Thread.Sleep().  
Fastest practical cps is **~67ms** it cannot click faster than that even if you put 999 ms in the settings.

## Installation
| Platform | Download |
|----------|----------|
| Windows    |[![Download Button](https://img.shields.io/badge/WINDOWS_EXE-v1.0.0-red?style=for-the-badge)](https://github.com/JRBCodes/BBAC-Lightweight-AutoClicker/releases/download/v1.0.0/bbac-v1.0.exe)|
- Or you can compile it yourself from source, I used AHK v2. (Beware of bad code)
