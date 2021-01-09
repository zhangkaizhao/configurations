# Wayfire

2020-01-08

Try Wayfire 0.6.0 on Arch Linux.

https://wayfire.org/

## packages

See `wayfire.txt`.

## configuration files

* `wayfire.ini` : `~/.config/wayfire.ini`
* `wf-shell.ini` : `~/.config/wf-shell.ini`
* `wofi/config` : `~/.config/wofi/config`

## common global key shortcuts

* <super> : workspaces overview
* <super> BTN_LEFT : drag window by holding down Super and left mouse button
* <super> KEY_ENTER : start a terminal (alacritty by default)
* <super> KEY_ESC : show logout menu (wlogout)
* <super> KEY_Q (or: <alt> KEY_F4): quit current window

* <super> <shift> KEY_ENTER : launcher (wofi by default)
* <super> <shift> KEY_ESC : screen locker (swaylock by default)

* <ctrl> <super> KEY_LEFT : switch to left workspace
* <ctrl> <super> KEY_RIGHT : switch to right workspace

* <alt> KEY_ESC : fast switch to next window (without boring animation)

* KEY_MUTE (e.g. KEY_Fn KEY_F10): volume up (amixer master toggle by default)
* KEY_VOLUMEDOWN (e.g. KEY_Fn KEY_F11): volume down (amixer master - 5% by default)
* KEY_VOLUMEUP (e.g. KEY_Fn KEY_F12): volume up (amixer master + 5% by default)

* KEY_BRIGHTNESSDOWN (e.g. KEY_Fn KEY_F5): brightness down (light -U 5 by default)
* KEY_BRIGHTNESSUP (e.g. KEY_Fn KEY_F6): brightness up (light -A 5 by default)

## known issues

wayfire core issues:

* the whole wayfire session crashes while closing a window if `animate` plugin is disabled
  (so `animate` plugin can not be disabled now)
* there are no buttons for window actions for gtk2 applications if `decoration` plugin is disabled
  (instead `<super> KEY_Q` or `<alt> KEY_F4` can be used to close current window)

applications do not work:

* goldendict (failed to start, coredump)
* zeal (failed to start, coredump)
