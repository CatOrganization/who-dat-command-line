# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "avit" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git brew osx aws zsh-autosuggestions
)

echo "sourcing oh my"
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

IS_ZSH=true
if [[ "$(uname -s)" == "Darwin" ]]; then
    MAC=true
elif [ "$(uname -s)" == "Linux" ]; then
    LINUX=true
fi

# export GOPATH="${HOME}"

if [ $MAC ] && [ -d ~/homebrew ]; then
	PATH="${HOME}/homebrew/bin:${PATH}"
fi

if [ -d ~/homebrew ]; then
	PATH="${HOME}/bin:${PATH}"
fi

if [ -d ~/bin ]; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d ~/Library/Python/3.7/bin ]; then
	PATH="${PATH}:${HOME}/Library/Python/3.7/bin"
fi

if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

if [ -d /usr/local/opt/make/libexec/gnubin ]; then
  PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
fi


# PATH="{PATH}:/usr/local/bin"
export GOPATH=$(go env | grep -i gopath | cut -d'=' -f 2 | sed 's/"//g') # fucking hell
if [ -d "${GOPATH}" ]; then
	PATH="${PATH}:${GOPATH}/bin"
fi

# personal is my whatever computer this is
if [ -f ~/.personal_spec ]; then
  . ~/.personal_spec
fi

# Aliases
alias dockerRM='docker rm -f $(docker ps -a -q)'
alias cp="cp -iv"
alias mv="mv -iv"
alias src='echo -n "Sourcing ~/.zshrc..."; source ~/.zshrc; echo "DONE";'
# Github

alias gco="git checkout"
alias gp="git push"
alias gpu="git push -u"
alias gpl="git pull"
alias gstat="git status -uno"
alias gstata="git status"
alias gadu="git add -u"
alias gcom="git commit"
alias gcomm="git commit -m"
# alias gcomaa="git commit -a --amend" # equivalent to 'gadu;gcomm "f";git rebase -i HEAD~2'
alias gpfl="git push --force-with-lease"

gcomaa () {
    # equivalent to 'gadu;gcomm "f";git rebase -i HEAD~2'
    message=$(git log -1 --format=%s)
    git commit -a -m "${message}" --amend
}

# Kubernetes

alias kgc="kubectl config get-contexts"
alias katl="kubectl config use-context polygon-atl"
alias kny2="kubectl config use-context polygon-ny2"

IVR_HOME="~/ivr-auth"
APOLLO_HOME="bin/apollo.sh"

PATH="/Users/rbarillas/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# Ops
alias opss="${IVR_HOME}/${APOLLO_HOME} ops staging"
alias opsp="${IVR_HOME}/${APOLLO_HOME} ops prod"
alias opsp="${IVR_HOME}/${APOLLO_HOME} ops pre-prod"

alias ls="ls --color=auto"

# Completions
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

compinit
source "${HOME}/Library/Python/3.7/bin/aws_zsh_completer.sh"

source <(kubectl completion zsh)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/Users/rbarillas/homebrew/opt/sphinx-doc/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rbarillas/homebrew/bin/terraform terraform


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rickybarillas/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rickybarillas/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rickybarillas/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rickybarillas/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
