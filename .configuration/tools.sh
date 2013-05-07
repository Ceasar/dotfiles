
HAVE_GIT=$(command -v git 2>/dev/null)
HAVE_PYTHON=$(command -v python 2>/dev/null)
HAVE_TMUX=$(command -v tmux 2>/dev/null)
HAVE_VIM=$(command -v vim 2>/dev/null)
HAVE_VIRTUALENVWRAPPER=$(pip freeze | grep virtualenvwrapper)

test -n "$HAVE_GIT" && {
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

    # Short alias
    alias g="git"

    # Modify the gitconfig from anywhere
    alias gitrc='$EDITOR ~/.gitconfig'

    # Short alias
    alias gs="git status"
}

test -n "$HAVE_TMUX" && {
    # Make tmux source each time it's run
    alias tmux="tmux source-file ~/.tmux.conf && tmux"

    # Modify the tmux.conf from anywhere
    alias tmuxrc='$EDITOR ~/.tmux.conf'
}

test -n "$HAVE_PYTHON" && {
    PYTHONSTARTUP=~/.pythonrc.py
    export PYTHONSTARTUP
}

test -n "$HAVE_VIM" && {
    export EDITOR="vim"
    export VISUAL=$EDITOR
    # Enable syntastic to work with Haskell in Vim
    export PATH=$PATH:$HOME/Library/Haskell/ghc-7.4.1/lib/ghc-mod-1.11.0/bin

    # Modify the vimrc from anywhere
    alias vi='vim'

    # Modify the vimrc from anywhere
    alias vimrc='$EDITOR ~/.vimrc'
}

test -n "$HAVE_VIRTUALENVWRAPPER" && {
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Devel
    source /usr/local/bin/virtualenvwrapper.sh
    # workon local
    # Quick-Start
    # 1. `workon`
    # 2. A list of environments, empty, is printed
    # 3. `mkvirtualenv temp`
    # 4. A new environment, temp, is created and activated
    # 5. `workon`
    # 6. This time, the `temp` environment is included
}
