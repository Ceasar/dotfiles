#aliases
alias dir='ls'

# Automatically add color and slashes after directories
alias ls='ls -FG'

# Enable feedback for rm
alias rm='rm -v'


# Automatically highlight matches
alias grep="grep --color=auto"
alias grepr="grep -r"
alias f="grep -r"

# Since I accidentally type l instead of ls
alias l='ls'

# ls, without .pyc files
alias lp='ls -dC !(*.pyc)'
alias ..='cd ..'
alias ...='cd ../..'


# Modify the vimrc from anywhere
alias vimrc='vim ~/.vimrc'

alias check='source ~/.bash_profile'

# Modify the bashrc from anywhere
alias bashrc='vim ~/.bash_profile; source ~/.bash_profile'

# Modify the gitconfig from anywhere
alias gitconfig='vim ~/.gitconfig'

# Update the bashrc
alias refresh="source ~/.bash_profile; clear"


alias django='~/django'
alias eclipse='open ~/eclipse/eclipse'


# Add colors to the terminal
export CLICOLOR=1
export TERM="xterm-256color" # used for solarized

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


# Set git autocompletion
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi


# Find all files with name match $1 in $2
function get {
    find $2 -name $1
}

# Replace word $1 with word $2 recursively in $3
function replace {
    perl -e "s/$1/$2/g;" -pi $(find $3 -type f)
}
