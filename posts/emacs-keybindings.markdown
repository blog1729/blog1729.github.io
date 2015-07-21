---
title: Emacs like keybindings
date: 2015-07-21
---

I like GNU Emacs and prefer to have Emacs like Keybindings in other applications, mainly Firefox.
I found out that applications that use gtk (Firefox uses gtk) can be configured to have
emacs like keybinding.

To do this, add the line `gtk-key-theme-name = "Emacs"` in your gtk configuration file.
This will partially implement Emacs keybindings in Firefox.
Apart from that, there is a Firefox extension named [Firemacs](https://addons.mozilla.org/en-us/firefox/addon/firemacs/) by which more Emacs keybindings can be made to work.

