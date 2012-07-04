# aliases
# =======

# Enable feedback for rm
alias rm='rm -v'

# Enable feedback for mv
alias mv='mv -v'

# Short alias for grep
alias f="grep -rn"

# xargs as I would expec
alias args="xargs -0"

# cd quickly 
alias ..='cd ..'
alias ...='cd ../..'

# Since I accidentally type l instead of ls
alias l='ls'

# Automatically add color and slashes after directories
alias ls='ls -FG'

# Automatically highlight matches
alias grep="grep --color=auto"

# Check if the bashrc has been updated and updated it
alias check='source ~/.bash_profile'


# dotfiles
# ========


# Modify the vimrc from anywhere
alias vimrc='vim ~/.vimrc'

# Modify the bashrc from anywhere
alias bashrc='vim ~/.bash_profile; check'

# Modify the gitconfig from anywhere
alias gitconfig='vim ~/.gitconfig'


# colors
# ======


# Add colors to the terminal
export CLICOLOR=1
export TERM="xterm-256color" # used for solarized

# Automatically add color and slashes after directories
alias ls='ls -FG'

# Automatically highlight matches
alias grep="grep --color=auto"

# The color designators are as follows:
# 
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# x     default foreground or background
# Capitalize to make bold
# See man ls -> LSCOLORS for help
directory="gx"
symlink="fx"
socket="hx"
pipe="hx"
executable="ex"
others="hxhxhxhxhxhx"

export LSCOLORS=$directory$symlink$socket$pipe$executable$others


# To add colors to the shell prompt use the following export command syntax:
# '\e[x;y;zm'
#   where:
#     * '\e[' - Start color scheme
#     * x - Attribute code
#       * 0 - none
#       * 1 - bold
#       * 4 - underscore
#       * 5 - blink
#       * 7 - reversed
#       * 8 - concealed
#     * y - Foreground color (30-37)
#       * 0 - black
#       * 1 - red
#       * 2 - green
#       * 3 - yellow
#       * 4 - blue
#       * 5 - magenta
#       * 6 - cyan
#       * 7 - white
#     * z - Background color (40-47)
#       * 0 - black
#       * 1 - red
#       * 2 - green
#       * 3 - yellow
#       * 4 - blue
#       * 5 - magenta
#       * 6 - cyan
#       * 7 - white
#     * '\e[m' - Stop color scheme
# '\[' and '\]' should be put around color codes so that bash does not take
# them into account when calculating line wraps. They indicate the start and
# end of a sequence of non-printing characters.
# See:
# * http://en.wikipedia.org/wiki/ANSI_escape_code
# * http://webhome.csc.uvic.ca/~sae/seng265/fall04/tips/s265s047-tips/bash-using-colors.html
NONE="\[\e[0m\]"
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
MAGENTA="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"

#command prompt
TIME="\t"
USERNAME="\u"
HOSTNAME="\h"
PROMPT="\$"
PWD="\w"
BRANCH="\$(__git_ps1)"
PS1="$YELLOW$BRANCH $CYAN$PWD$PROMPT$NONE "


# Set up git autocompletion
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi


# functions
# =========


# Find all files with name match $1 in $2
# $ get foo.py src/
function get {
    find $2 -type f -name $1
}

# Replace word $1 with word $2 recursively in $3
# $ replace foo bar templates/
function replace {
    perl -e "s/$1/$2/g;" -pi $(find $3 -type f)
}


# mac-specific functions
# ----------------------

# Spawn a new terminal window and run the command $1
# $ spawn ls
function spawn {
osascript <<END 
    tell app "Terminal" to do script "$1" 
END
}

# Read a string using a computerized voice
function say {
osascript <<END 
    say "$*" 
END
}


# Reposition the current window to (x, y) (offset from top-left corner)
function position {
osascript <<END 
    tell application "Terminal" to set the position of window 1 to {$2, $3}
END
}


# Resize the current window to (width, height)
function resize {
osascript <<END 
    tell application "Terminal" to set the size of window 1 to {$1, $2}
END
}


# Get the bounds of the screen
function bounds {
osascript <<END 
    tell application "Finder" to get the bounds of the window of the desktop
END
}


# notes
# =====

# * Cmd + Tab to switch applications
# * Cmd + Tab + shift to switch applications (reverse)
# * Cmd + W to close a window
# * Cmd + ` to switch windows within an application
