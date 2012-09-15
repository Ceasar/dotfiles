

Config Files
============

Config files for the various programs I use. Namely,

*   [Fish](http://ridiculousfish.com/shell/) (shell). Fish is fast, has awesome
    command-line completion, color, and a more refined scripting language than
    Bash. Also considered zsh, but Fish was dead simple to install.
*   [Vim](http://www.vim.org/download.php) (file editing). Somewhat archaic,
    Vim is still my text editor of choice because it offers superior typing
    speed and is easily accesible from the command line. Combined with the
    right plugins, it can match any text editor out there.
*   Git (source control)

Also has config files for programs I no longer use including:

*   Bash (replaced by Fish)


Setup
=====

General
-------
*   Clone this repository to the home directory.

iTerm
-----
*   Download [iTerm](http://code.google.com/p/iterm2/).
*   Download [Solarized](http://ethanschoonover.com/solarized) and then from iTerm preferences, go to Colors
    choose import and then select the colors from the solarized directory.

tmux
----
*   `brew install tmux`

Vim
---
*   Install [Pathogen](https://github.com/tpope/vim-pathogen) for Vim.
*   Install each plugin in `.vim/bundle`.

node
----
*   Download [node.js](http://nodejs.org/#download).

coffeescript
------------
*   Download [coffeescript](http://coffeescript.org/#installation).

heroku
------
*   Download [heroku toolbelt](https://toolbelt.heroku.com/).
*   Login. (`heroku login`)
*   Set up [ssh keys](https://devcenter.heroku.com/articles/keys) (`heroku keys:add`).
