---
layout: post
title: Fixed some problems with Ubuntu
comments: True
---

Recently, I had some problems on my laptop running on Ubuntu 14.10. By checking out the [system-process monitor](https://apps.ubuntu.com/cat/applications/precise/gnome-system-monitor/) I found that the problem was caused by evince thumbnailer. It did surprise me after I google-searched "evince thumbnailer"--the whole of first page was links to how to fix the problem of evince-thumbnailer eating up CPU. I did solve (hopefully) the problem and in the meanwhile learned some things.

###Restarting the GUI
Press `Ctrl+Alt+F1` to go to the 1st [Virtual Console](http://en.wikipedia.org/wiki/Virtual_console). Type the following command to restart [lightDM](http://freedesktop.org/wiki/Software/LightDM/).

<blockquote><div> `sudo service lightdm restart`</div></blockquote>

This techniche is handy if your GUI hangs but you have acess to the virtual console.

###Killing a process
Open terminal (`Ctrl+Alt+T`), you may either use 
<blockquote><div> `kill PID` </div></blockquote>

to kill the process, provided that you know the PID of the process. To find `PID`, you may use the following command: 
<blockquote><div>`ps -aux|grep "name-of-the-program"` </div></blockquote>

If you want to kill a process which has an open window, you can use `xkill` and then click on that window of the process you wish to kill.

###Creating a custom shortut
This can easily be done using the GUI, go to `all settings` &gt; `keyboard` &gt; `shortcuts` &gt;  `Custom Shortcuts`. Using this, I created a handy shorcut to `xkill`.