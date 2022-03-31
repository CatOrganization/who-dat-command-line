# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
  git osx aws zsh-autosuggestions kubectl
)

_log() {
	printf "[%s] %s\n" "$(date +"%T.%N")" "${@}"
}

_log "sourcing oh my"
source $ZSH/oh-my-zsh.sh

# User configuration
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)


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

export GOPATH="${HOME}"

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
  PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
fi
if [ -d /usr/local/opt/make/libexec/gnubin ]; then
  PATH="/usr/local/opt/make/libexec/gnubin:${PATH}"
fi
if [ -d /usr/local/opt/gnu-sed/libexec/gnubin ]; then
  PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
fi
if [ -d ~/bin ]; then
  PATH="${HOME}/bin:${PATH}"
fi


if [ -d /Users/rickybarillas/Library/Python/3.7/lib/python/site-packages ]; then
  PATH="/Users/rickybarillas/Library/Python/3.7/lib/python/site-packages:$PATH"
fi

PATH="${PATH}:${HOME}/.krew/bin"

alias krewoff="rm -rf ${HOME}/.krew"

krewon() {
  (
    set -x; cd "$(mktemp -d)" &&
    OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
    KREW="krew-${OS}_${ARCH}" &&
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
    tar zxvf "${KREW}.tar.gz" &&
    ./"${KREW}" install krew
  )


  kubectl krew install cert-manager
  kubectl krew install neat
  kubectl krew install view-secret
}

# PATH="{PATH}:/usr/local/bin"
export GOPATH=$(go env | grep -i gopath | cut -d'=' -f 2 | tr -d \'\") # fucking hell
if [ -d "${GOPATH}" ]; then
	PATH="${PATH}:${GOPATH}/bin"
fi


# personal is my whatever computer this is
if [ -f ~/.personal_spec ]; then
  _log "sourcing personal spec"
  . ~/.personal_spec
fi

_log "done sourcing personal spec"
# Aliases
alias dockerRM='docker rm -f $(docker ps -a -q)'
alias cp="cp -iv"
alias mv="mv -iv"
alias src='_log "Sourcing ~/.zshrc..."; exec zsh; echo "DONE";'

# Github

alias gco="git checkout"
alias gs="git switch"
alias gp="git push || gpsup"
alias gpu="git push -u"
alias gpl="git pull"
alias gstat="git status -uno"
alias gstata="git status"
alias gadu="git add -u"
alias gcom="git commit"
alias gcomm="git commit -m"
alias gam="git add -u && git commit -m"
# alias gcomaa="git commit -a --amend" # equivalent to 'gadu;gcomm "f";git rebase -i HEAD~2'
alias gpfl="git push --force-with-lease"

ghrelease () {
  gh release create $(prod-release-tag) -t $1
}

ghreleasecomponent () {
  gh release create $(prod-release-component-tag $1) -t $2
}

ghreadymerge() {
  gh pr checks --watch && gh pr ready && gh pr merge --auto --squash --delete-branch=false
}

gcomaa () {
    # equivalent to 'gadu;gcomm "f";git rebase -i HEAD~2'
    message=$(git log -1 --format=%s)
    git commit -a -m "${message}" --amend
    # could also do git commit -a --amend --no-edit
}

gdb () {
  branch="$(git branch --show-current)"
  git branch -D delete-me || echo ""
  git branch -m delete-me
  git fetch
  gco -b ${branch} origin/master

  git cherry-pick delete-me
}

# Misc

alias watchup="watch \"!!\""

# Kubernetes

alias kgc="kubectl config get-contexts"
alias katl="kubectl config use-context polygon-at4"
alias kny2="kubectl config use-context polygon-ny2"
alias kny5="kubectl config use-context polygon-ny5"
alias kset="kubectl config set-context --current --namespace"
alias klf="kubectl logs -f"

IVR_HOME="~/ivr-auth"
APOLLO_HOME="bin/apollo.sh"

PATH="/Users/rbarillas/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# Ops
alias opss="${IVR_HOME}/${APOLLO_HOME} ops staging"
alias opsp="${IVR_HOME}/${APOLLO_HOME} ops prod"
alias opsp="${IVR_HOME}/${APOLLO_HOME} ops pre-prod"

alias ls="ls --color=auto"
alias less="less -R"

alias gmt="go mod tidy"
alias gmv="go mod vendor"
gmreplace() {
  go mod edit -replace github.com/polygon-io/${1}=../${1}
}


getAccountByEmailProd() {
  curlProdAccountServices /accounts --data-urlencode "email=${1}" -G
}

getAccountByEmailStaging() {
  curlStagingAccountServices /accounts --data-urlencode "email=${1}" -G
}

getKeyByStringProd() {
  curlProdAccountServices /keys --data-urlencode "key=${1}" -G
}

getKeyByStringStaging() {
  curlStagingAccountServices /keys --data-urlencode "key=${1}" -G
}

getProductsForAccountProd() {
  curlProdAccountServices /accounts/"${1}" | jq -rc '.results.products[]' | xargs -I{} curlProdAccountServices /products/{} | jq '.results | [.id, .name, .asset_type]'
}

getProductsForAccountStaging() {
  curlStagingAccountServices /accounts/"${1}" | jq -rc '.results.products[]' | xargs -I{} curlStagingAccountServices /products/{} | jq '.results | [.id, .name, .asset_type]'
}

# TODO doesn't work. Not enough permissions
setDefaultInvoiceSettings() {
  customer_id="${1?First arg is customer ID}"
  stripe customers update "${customer_id}" \
    -d "invoice_settings[default_payment_method]"="$(stripe customers retrieve ${customer_id} --live | jq -rc '.default_source')" \
    --api-key="${2}"
}



getTerraformLockID() {
  key_prefix="${1:-terraform}"
  workspace="$(terraform workspace show)"
  if [[ "${workspace}" != "default" ]]; then
    key_prefix="env:/${workspace}/${key_prefix}"
  fi
  AWS_PAGER="" aws dynamodb get-item --table-name=tf.lock --key="{\"LockID\":{\"S\":\"polygonio-tf-state/${key_prefix}.tfstate\"}}" | jq -rc '.Item.Info.S | fromjson | .ID'
}

lastHistoryLine() {
  cat ~/.zsh_history | tail -n2 | sort -k3 -r | tail -n1 | awk -F ";" '{print $2}' >> $1
}

onLoop() {
  while true; do date; bash -c "${@}"; sleep 2; done
}


_log "creating completions"

# Completions
mkdir -p ~/.zsh/completion
fpath=(~/.zsh/completion $fpath)
autoload bashcompinit && bashcompinit

complete -C "/usr/local/bin/aws_completer" aws

autoload -Uz compinit && compinit -i

if [ ! -f ~/.zsh/completion/_docker ]; then
  curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
fi

source <(kubectl completion zsh)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/Users/rbarillas/homebrew/opt/sphinx-doc/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rbarillas/homebrew/bin/terraform terraform


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rickybarillas/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rickybarillas/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rickybarillas/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rickybarillas/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# _log "pgon init"
# export PGON_DISABLE_AUTO_UPDATE=0
# eval "$(/Users/rickybarillas/src/github.com/polygon-io/tool-pgon/bin/pgon init -)"
set +x

# Prompt

_log "sourcing kube-ps1"
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(k8s_ps1)'$PS1
KUBE_PS1_SYMBOL_USE_IMG='true'
KUBE_PS1_SEPARATOR=''
KUBE_PS1_CTX_COLOR='yellow'
cluster_func() {
  t=$(echo "${1}" | cut -d '-' -f2)
  if [[ "${t}" == "ny5" ]]; then
    t="%{%F{1}%}${t}%{%f%}"
  fi
  echo "${t}"
}
KUBE_PS1_CLUSTER_FUNCTION=cluster_func

_log "done sourcing kube-ps1"

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -f '/usr/local/etc/bash_completion.d/az' ]]; then . '/usr/local/etc/bash_completion.d/az'; fi

complete -o nospace -C /usr/local/bin/mc mc

complete -o nospace -C /usr/local/bin/terraform terraform
complete -o nospace -C /Users/rickybarillas/bin/terraform terraform

_log "last line"
