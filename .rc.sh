# machine and shell independent runcom

source ~/.configuration/environment.sh
source ~/.configuration/aliases.sh
source ~/.configuration/tools.sh

# Check for the existence of a machine specific .profile file and source that
test -f ~/.localrc && source ~/.localrc
