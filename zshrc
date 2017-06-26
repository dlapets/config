################################################################################
# oh-my-zsh
################################################################################

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git)

source $ZSH/oh-my-zsh.sh

################################################################################
# Shell settings
################################################################################

bindkey -v

if [ -e $HOME/config/zshaliases ]; then
    source $HOME/config/zshaliases 
fi

if [ -e $HOME/google-cloud-sdk/completion.zsh.inc ]; then
    source $HOME/google-cloud-sdk/completion.zsh.inc
fi

if [ -e $HOME/google-cloud-sdk/path.zsh.inc ]; then
    source $HOME/google-cloud-sdk/path.zsh.inc 
fi

# TODO consider changing?
ulimit -n 512

################################################################################
# Local settings or whatever
################################################################################

SOURCE=${(%):-%N}
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
CONFIG_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


# TODO make some kinda color picker instead of this poo
COLOR_BLACK="\e[30m"
COLOR_BLACK_BRIGHT="\e[30;1m" # hell yeah
COLOR_RED="\e[31m"
COLOR_RED_BRIGHT="\e[31;1m"
COLOR_GREEN="\e[32m"
COLOR_GREEN_BRIGHT="\e[32;1m"
COLOR_YELLOW="\e[33m"
COLOR_YELLOW_BRIGHT="\e[33;1m"
COLOR_BLUE="\e[34m"
COLOR_BLUE_BRIGHT="\e[34;1m"
COLOR_MAGENTA="\e[35m"
COLOR_MAGENTA_BRIGHT="\e[35;1m"
COLOR_CYAN="\e[36m"
COLOR_CYAN_BRIGHT="\e[36;1m"
COLOR_WHITE="\e[37m"
COLOR_WHITE_BRIGHT="\e[37;1m"

COLOR_RESET="\e[39;49m\e[0m"

################################################################################
# Paths and aliases
################################################################################

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$CONFIG_PATH/utils:$PATH" # TODO maybe there's a better way

if [ "$(uname)" = 'Linux' ]; then
    export PATH="/usr/games:$PATH"
    export PATH="/usr/local/go/bin:$PATH"
fi

if [ "$(uname)" = 'Darwin' ]; then
    # TODO check if it's actually there
    alias vim=/usr/local/opt/vim/bin/vim
    alias vi=/usr/local/opt/vim/bin/vim
fi

# Git
alias gfrb="git fetch && git rebase origin/master"
alias gfrbi="git fetch && git rebase -i origin/master"
alias glgg="git log --oneline --graph HEAD~10.. "
alias gcd="d=\`git status -s|head -n1|sed -e 's/^...\(.*\)/\1/'\` && [[ -z \$d ]] || cd \`dirname \$d\`"

################################################################################
# Golang
################################################################################

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

GOTEST="go test"

# TODO fix this, it doesn't like when you pass params to it
GOTESTWITHSUB="if [ -d test ]; then $GOTEST ./...; else $GOTEST; fi"

alias got="fortune; echo; $GOTESTWITHSUB"

FUCK_YOU_AND_GOT="echo -n '$COLOR_RED_BRIGHT'; fortune -o; echo '$COLOR_RESET'; $GOTESTWITHSUB"
GOTS=(
    3got
    fgot
    g0ot
    g0t
    giot
    go0t
    gog
    gogt
    goit
    gort
    gotg
    gott
    goty
    gto
)
for spelling in ${GOTS}; do 
    alias $spelling=$FUCK_YOU_AND_GOT
done

alias gotf="$GOTEST --gocheck.f"

#TODO port ot zsh
###############################################
### gocd -- navigate Go packages in $GOPATH ###
###############################################

#function gocd() {
#  cd "$GOPATH/src/$1"
#}
#
#function __gocd_complete() {
#  COMPREPLY=()
#
#  local cur="${COMP_WORDS[COMP_CWORD]}"
#  
#  COMPREPLY=( $(for pkg in $( echo "${GOPATH[@]}/src/$cur*/" ); do echo ${pkg#$GOPATH/src/}; done) )
#
#  return 0
#}

#complete -o nospace -F __gocd_complete gocd

### End of gocd ###
