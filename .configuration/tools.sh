
HAVE_GIT=$(command -v git 2>/dev/null)
HAVE_TMUX=$(command -v tmux 2>/dev/null)
HAVE_VIM=$(command -v vim 2>/dev/null)

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
    # Modify the tmux.conf from anywhere
    alias tmuxrc='$EDITOR ~/.tmux.conf'
}

test -n "$HAVE_VIM" && {
    export EDITOR="vim"
    export VISUAL=$EDITOR

    # Modify the vimrc from anywhere
    alias vi='vim'

    # Modify the vimrc from anywhere
    alias vimrc='$EDITOR ~/.vimrc'
}
