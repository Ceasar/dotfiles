# Variables that persist for the life of a terminal session.
# Applications running in the session access these variables when they need information about the user.
# To see a full list of environment variables use the `env` command.

export EDITOR="vi"

# Never type a command twice
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Get host name
export HOST="$(uname -n)"

# Set `ls` colors
unset LSCOLORS
# See man ls -> LSCOLORS for help

# The color designators are as follows:
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

# The order of the attributes are as follows:
# directory
# symbolic link
# socket
# pipe
# executable
# block special
# character special
# executable with setuid bit set
# executable with setgid bit set
# directory writable to others, with sticky bit
# directory writable to others, without sticky bit
for _this in \
    ex \
    fx \
    cx \
    dx \
    bx \
    eg \
    ed \
    ab \
    ag \
    ac \
    ad
do
    test -n "$LSCOLORS" && LSCOLORS="$LSCOLORS$_this" || LSCOLORS="$_this"
done
export LSCOLORS

# Get operating system
export OS="$(uname -s)"

# Set search path for executables
unset PATH
for _this in \
  ~/local/bin \
  ~/bin \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /usr/sbin \
  /usr/X11R6/bin
do
  test -d $_this && {
    test -n "$PATH" && PATH="$PATH:$_this" || PATH="$_this"
  }
done
export PATH

test -n "$UNAME" || export UNAME="$(uname)"

export VISUAL=$EDITOR
