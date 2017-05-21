# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bindkey -v
export GOPATH=$HOME/go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"

if [ "$(uname)" = 'Darwin' ]; then
    alias vim=/usr/local/opt/vim/bin/vim
    alias vi=/usr/local/opt/vim/bin/vim
fi

if [ "$(uname)" = 'Linux' ]; then
    # shitty hack for my go setup
    export PATH="/usr/local/go/bin:$PATH"
fi

alias got="fortune; echo; go test"
alias gotf="got --gocheck.f"

alias gfrb="git fetch && git rebase origin/master"
alias gfrbi="git fetch && git rebase -i origin/master"
alias glgg="git log --oneline --graph HEAD~10.. "

alias gcd="d=\`git status -s|head -n1|sed -e 's/^...\(.*\)/\1/'\` && [[ -z \$d ]] || cd \`dirname \$d\`"

alias gut="echo DUMBASS; git"
alias poopd="echo Learn to type shitbitch; popd"

# need for deploy to not break or somethign
ulimit -n 512

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
#

if [ -e $HOME/config/zshaliases ]; then
    source $HOME/config/zshaliases 
fi

if [ -e $HOME/google-cloud-sdk/completion.zsh.inc ]; then
    source $HOME/google-cloud-sdk/completion.zsh.inc
fi

if [ -e $HOME/google-cloud-sdk/completion.zsh.inc ]; then
    source $HOME/google-cloud-sdk/path.zsh.inc 
fi
