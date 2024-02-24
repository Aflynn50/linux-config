# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# The theme is at ~/.oh-my-zsh/themes/aflynn.zsh-theme
ZSH_THEME="aflynn"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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

# Stop displaying annoying omz update prompt
export DISABLE_UPDATE_PROMPT=true
export DISABLE_AUTO_UPDATE=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git shrink-path)

source $ZSH/oh-my-zsh.sh

source /usr/share/doc/fzf/examples/key-bindings.zsh

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


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Use nvim for vim
alias vim="nvim"
alias v="nvim"

# Some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# easy and quick go test
alias got='go test ./... -check.v'
alias gotv='go test -v ./... -check.vv'

alias gpom='git checkout main && git pull origin main && git checkout -'

# alias jhack='python3 /home/aflynn50/Canonical/jhack/jhack/main.py'
#
alias gt='gnome-terminal'


export GOPATH=$HOME/go
# Prepend
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# This is where the go website reccomends we install it
# export PATH=$PATH:/usr/local/go/bin

export PATH=$PATH:$HOME/.cargo/bin

# Put python virtual env on the path to use it as normal
export PATH=/home/aflynn/pythonenv/bin:$PATH

# Juju
# Ignore tests that fail in make static-analysis
export STATIC_ANALYSIS_JOB=test_static_analysis_go
# kill all controllers
alias jkc='juju list-controllers --format=json | jq ".controllers | keys | .[]" | xargs -I% juju kill-controller --no-prompt -t 0s %'
# Watch status
alias jw='watch -c juju status --color'
alias jwr='watch -c juju status --color --relations'
# debug log
alias jdb='juju debug-log -m controller --replay'
alias jdc='juju destroy-controller --no-prompt'
# Juju binary
alias j='/snap/bin/juju'
alias jt='PATH="/home/aflynn/Canonical/juju/_deps/musl-amd64/output/bin:$PATH" CC="musl-gcc" CGO_CFLAGS="-I/home/aflynn/Canonical/juju/_deps/dqlite-deps-amd64/include" CGO_LDFLAGS="-L/home/aflynn/Canonical/juju/_deps/dqlite-deps-amd64 -luv -lraft -ldqlite -llz4 -lsqlite3" CGO_LDFLAGS_ALLOW="(-Wl,-wrap,pthread_create)|(-Wl,-z,now)" LD_LIBRARY_PATH="/home/aflynn/Canonical/juju/_deps/dqlite-deps-amd64" CGO_ENABLED="1" go test -mod="readonly" -tags="libsqlite3,dqlite" -ldflags "-s -w -linkmode 'external' -extldflags '-static' -X github.com/juju/juju/version.GitCommit=4f05189fe8849b2cf5fb4e9dea7caf7edcbb438b -X github.com/juju/juju/version.GitTreeState=clean -X github.com/juju/juju/version.build= -X github.com/juju/juju/version.GoBuildTags=libsqlite3,dqlite"'
