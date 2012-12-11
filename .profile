# cd quickly 
alias ..='cd ..'
alias ...='cd ../..'

# xargs as I would expec
alias args="xargs -0"

# Modify the bashrc from anywhere
alias bashrc='vim ~/.bash_profile; check'

# Short alias for cd
alias c='cd'

# Check if the bashrc has been updated and updated it
alias check='source ~/.bash_profile'

# Get all of the merged local branches and remove them
# * Gets all merged branches
# TODO: Change this to find master instead
# * Searches for everything except the currently checked out branch
# * Removes leading whitespace
# * Deletes the branch
alias clean='git branch --merged | grep -v ^\* | sed "s/^ *//" | xargs -n 1 git accept'

# Get all of the merged remote branches and remove them
# * Gets all remote merged branches
# * Strips out prefix (gets just the branch name)
# * Removes master from the list
# * Deletes branch
alias cleanremote='git branch -r --merged | sed "s/.*origin\///" | grep -v ^master$  | xargs -n 1 git push origin --delete'

alias copy='cp -r'

# Enable feedback for cp
alias cp='cp -vi'

alias delete='rm -rvi'

# Short alias for grep
alias f="grep -rn -C 1"

alias g="git"

# Modify the gitconfig from anywhere
alias gitconfig='vim ~/.gitconfig'

alias goto='cd'

# Automatically highlight matches
alias grep="grep --color=auto"

alias gs="git status"

# Short alias for ls
alias l='ls'

# Automatically add color and slashes after directories
alias la='ls -FGa'

# Automatically add color and slashes after directories
alias ll='ls -FGls'

# List all files by relative path
alias lr="find . -type f | sed "s#^./##""

# Automatically add color and slashes after directories
alias ls='ls -FG'

# Enable feedback for mv
alias mv='mv -vi'

alias now='date'

# Check Internet connection
alias pingme="ping google.com"

# Start postgres
alias pgstart='pg_ctl -l $PGDATA/server.log start'

# Stop postgres
alias pgstop='pg_ctl stop -m fast'

# Register a python project on pypi
alias pypi="sudo python setup.py register sdist bdist_wininst upload"

# Enable feedback for rm and make it confirm before deleting
alias rm='rm -vi'

# Analogous to `whoami`
alias whereami='pwd'

alias v="vim"

# Modify the vimrc from anywhere
alias vimrc='vim ~/.vimrc'


# Rearrange default order of path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11R6/bin

# Enable syntastic to work with Haskell in Vim
export PATH=/Users/ceasarbautista/Library/Haskell/ghc-7.4.1/lib/ghc-mod-1.11.0/bin:$PATH

# Postgres stuff
export PGDATA='/usr/local/var/postgres'

# Check for the existence of a machine specific .profile file and source that
[ -r ~/.profile.local ] && source ~/.profile.local
