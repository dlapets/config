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
# DISABLE_AUTO_TITLE="false"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git screen)

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

ulimit -n 9999

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
    if [ -d /usr/games ]; then
        export PATH="/usr/games:$PATH"
    fi
    if [ -d /usr/local/go/bin ]; then
        export PATH="/usr/local/go/bin:$PATH"
    fi
fi

if [ "$(uname)" = 'Darwin' ]; then
    # TODO check if it's actually there
    alias vim=/usr/local/opt/vim/bin/vim
    alias vi=/usr/local/opt/vim/bin/vim
fi

if type "fortune" > /dev/null; then
    # TODO reararnghe this
    alias fortune="echo -n '$COLOR_GREEN'; fortune $CONFIG_PATH/fortunes/*/fortune; echo -n '$COLOR_RESET'"
else
    alias fortune="echo '${COLOR_YELLOW_BRIGHT}fortune is not installed${COLOR_RESET}'"
fi


# Git
alias gfrb="git fetch && git rebase --keep-empty origin/master"
alias gfrbi="git fetch && git rebase --keep-empty -i origin/master"
alias glgg="git log --oneline --graph HEAD~10.. "
alias glggg="git log --oneline --graph"
alias gcd="d=\`git status -s|head -n1|sed -e 's/^...\(.*\)/\1/'\` && [[ -z \$d ]] || cd \`dirname \$d\`"
alias gti="git"

################################################################################
# Golang
################################################################################

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

GOTEST="go test"

alias got="fortune; echo; $GOTEST"

FUCK_YOU_AND_GOT="echo -n '$COLOR_RED_BRIGHT'; fortune -o; echo '$COLOR_RESET'; $GOTEST"
GOTS=(
    3got
    fgot
    g0ot
    g0t
    ghot
    giot
    go0t
    gog
    gogt
    goit
    goot
    gopt
    gort
    gotg
    gott
    goty
    gpot
    gto
    ogt
)
for spelling in ${GOTS}; do 
    alias $spelling=$FUCK_YOU_AND_GOT
done

alias gotf="$GOTEST --gocheck.f"
