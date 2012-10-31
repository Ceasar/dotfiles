#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Rearrange default order of path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11R6/bin
# Enable syntastic to work with Haskell in Vim
export PATH=/Users/ceasarbautista/Library/Haskell/ghc-7.4.1/lib/ghc-mod-1.11.0/bin:$PATH

# Postgres stuff
export PGDATA='/usr/local/var/postgres'
alias pgstart='pg_ctl -l $PGDATA/server.log start'
alias pgstop='pg_ctl stop -m fast'

alias pingme="ping google.com"
alias pypi="sudo python setup.py register sdist bdist_wininst upload"

alias git="g"
alias gs="git status"
alias v="vim"
alias c="cd"
alias ce="center"


# Automatically `ls` after each `cd`
function chpwd() {
    emulate -L zsh
        ls
}
