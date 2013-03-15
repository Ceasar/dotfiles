
# cd quickly 
alias ..='cd ..'

# cd quickly 
alias ...='cd ../..'

# more intuitive xargs
alias aliases="alias"

# more intuitive xargs
alias args="xargs -0"

# Short alias
alias c='cd'

# Long alias
alias copy='cp -r'

# Prevent accidentally overwriting files
alias cp='cp -i'

# show what an alias actually is
alias dealias="alias"

# Long alias
alias delete='rm'

# Short alias
alias e="$EDITOR"

# Sorted env
alias env="env | args | sort"

# Grep recursively. Show line numbers and one line of context on either side.
alias f="grep -rn -C 1"

# find name...
alias fn="find . -name"

# Long alias
alias goto='cd'

# Automatically highlight matches
alias grep="grep --color=auto"

# Short alias
alias l='ls'

# Show hidden files
alias la='ls -a'

# Show metadata and where symlinks point to
alias ll='ls -l'

# List filenames by relative path
alias lr='find . -type f | sed "s#^./##"'

# Add color
alias ls='ls -G'

# Synonym
alias now='date'

# Tell me what OS this is
alias os="uname -srm"

# Check Internet connection
alias pingme="ping google.com"

# Modify this file from anywhere easily
alias rc='$EDITOR ~/.rc.sh; source ~/.rc.sh'

# reload bash config
alias reload="source ~/.rc.sh"

# Analogous to `whoami`
alias whereami='pwd'

# Short alias
alias v="$EDITOR"
