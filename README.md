love-minor-mode-v2
==================

This project adds a minor mode for [GNU Emacs][emacs] that adds tools
to help developing [games using the LÖVE engine][love].  This minor
mode works in conjunction with and requires [lua-mode][luamode].

It is a fork of [love-minor-mode][loveminormode], that has been
unmantained for 3 years.



Features
========

LÖVE minor mode provides the following features:

**Note:** All key sequences have the format `C-c C-o <key>` to avoid
conflicts with lua-mode.


Creating New Projects
---------------------

The command `C-c C-o p` will help create a new project by creating a
`conf.lua` file in a given directory.  The mode will automatically
create the `love.conf()` function the LÖVE engine uses.  It will also
fill in the name and identity, important attributes that LÖVE uses for
things such as determining where to save game data.


Browsing Documentation
----------------------

Pressing `C-c C-o d` will open up your browser with LÖVE documentation.
Two customizable variables determine what page the command opens:

1. `love-local-documentation-path`: A path to a local copy of the LÖVE
documentation which is available for download from the LÖVE website.

2. `love-wiki-url`: The URL to the official LÖVE wiki.

`C-c C-o d` will first attempt to open any local documentation if you
have it.  Failing that, it will browse to the online wiki.


Search the Forums
-----------------

By pressing `C-c C-o f` you can search [the LÖVE forums][forums] for any
topics.  The variable `love-forum-url` contains the URL for the
forums.  You can change it if you want, but you should never need to
do so.


Playtesting
-----------

Playtest your game-in-progress by pressing `M-p`. It will launch the
LÖVE executable defined in the `love-exe` variable with the
directory of the file you are currently editing. Output will be
recorded in the `*love-output*` buffer for easy inspection.

You can also launch the game from the drop-down menu.

Note that the file you are editing must be in the top level of the
game directory for this to work.

Command Menu
------------

The features above are available through a menu by clicking on `LÖVE`
on the mode line.



Reporting Bugs
==============

When reporting bugs for LÖVE minor mode please include the value of
`love-minor-mode-v2-version-number` in your bug report.



Contributors
============

1. [Jose A. del Val](https://github.com/josedvm95)



License
=======

[GNU General Public License 3][gpl]



[gpl]: http://www.gnu.org/copyleft/gpl.html
[emacs]: http://www.gnu.org/software/emacs/
[love]: https://www.love2d.org/
[luamode]: https://github.com/immerrr/lua-mode
[forums]: https://love2d.org/forums/
[loveminormode]: https://github.com/ejmr/love-minor-mode
