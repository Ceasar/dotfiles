source ~/.git-completion.bash

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# To add colors to the shell prompt use the following export command syntax:
# '\e[x;ym'
#   where:
#     * '\e[' - Start color scheme
#     * 'x;y' - Color the pair to use (x;y)
#     * '\e[m' - Stop color scheme
# '\[' and '\]' should be put around color codes so that bash does not take
# them into account when calculating line wraps. They indicate the start and
# end of a sequence of non-printing characters.
# See: http://en.wikipedia.org/wiki/ANSI_escape_code
NONE="\[\e[0m\]"
DBLACK="\[\e[0;30m\]"
LBLACK="\[\e[1;30m\]"
DRED="\[\e[0;31m\]"
LRED="\[\e[1;31m\]"
DGREEN="\[\e[0;32m\]"
LGREEN="\[\e[1;32m\]"
DYELLOW="\[\e[0;33m\]"
LYELLOW="\[\e[1;33m\]"
DBLUE="\[\e[0;34m\]"
LBLUE="\[\e[1;34m\]"
DMAGENTA="\[\e[0;35m\]"
LMAGENTA="\[\e[1;35m\]"
DCYAN="\[\e[0;36m\]"
LCYAN="\[\e[1;36m\]"
DWHITE="\[\e[0;37m\]"
LWHITE="\[\e[1;37m\]"

export TERM="xterm-256color" # used for solarized

#command prompt
TIME="\t"
USERNAME="\u"
HOSTNAME="\h"
PROMPT="\$"
PWD="\w"
BRANCH="\$(__git_ps1)"
PS1="$DYELLOW$BRANCH $DCYAN$PWD:$NONE "

alias lcc='./lcc'


#ls aliases
alias dir='ls'
alias ls='ls -F'
alias l='ls' #since I accidentally type l instead of ls
alias lp='ls -dC !(*.pyc)' #hides all .pyc files
alias ..='cd ..'


#custom
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile; source ~/.bash_profile'
alias django='~/django'

alias eclipse='open ~/eclipse/eclipse'

shopt -s extglob

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

##
# Your previous /Users/ceasarbautista/.bash_profile file was backed up as /Users/ceasarbautista/.bash_profile.macports-saved_2012-04-29_at_20:51:52
##

# MacPorts Installer addition on 2012-04-29_at_20:51:52: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

