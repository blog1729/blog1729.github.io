---
title: Gitit wiki
date: 2015-07-23
---
[Gitit](http://gitit.net/) is a wiki that is backed by git version control.
I use gitit as a personal wiki, and often copies articles from the internet as a ready reference.
For example, I have copies of articles from Arch Linux Wiki that I plan to read.
One advantage gitit provides is that you can compose pages in the format you prefer.
Thus I could directly copy-paste the whole page from Arch Wiki or Wikipedia (mediawiki format), or copy paste from LaTeX source file, or compose in Emacs's Org-mode.


You can install Gitit either from your OS's package manager or using `cabal-install`, as this is written in Haskell!
Once you have this installed, you may start gitit by typing gitit in terminal.
Note that this will generate the required files in the current path, but if required files are already generated, it doesn't generate those again.
I have created a directory specifically to have my wiki files at `~/Documents/wiki/`, so that I could edit pages via Emacs.
Again note that changes are only 'made' after you commit them.

I've setup a systemd service that starts up my wiki on boot, here is the service file.

```
[Unit]
Description=Start gitit wiki

[Service]
Type=oneshot
ExecStart=/home/your-username/.scripts/gitit.sh

[Install]
WantedBy=multi-user.target
```

The `gitit.sh` script in `~/.scripts` is listed below:

```bash
#!/bin/sh
(cd /home/your-username/Documents/wiki/ && /home/your-username/.cabal/bin/gitit)
```

Now you may enable the service by the command `systemctl enable gitit.service`.


