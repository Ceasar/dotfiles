
export EDITOR="vi"

# Erase duplicate entries from history
export HISTCONTROL="erasedups"

# Get host name
export HOST="$(uname -n)"

# Get operating system
export OS="$(uname -s)"

# Rearrange default order of path
# TODO: Why?
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11R6/bin

# Enable syntastic to work with Haskell in Vim
# TODO: Only do this if Haskell is installed
export PATH=$HOME/Library/Haskell/ghc-7.4.1/lib/ghc-mod-1.11.0/bin:$PATH

test -n "$UNAME" || export UNAME="$(uname)"

export VISUAL=$EDITOR
