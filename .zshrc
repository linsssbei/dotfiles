export JAVA_HOME=/Users/lshi/workspace/java/openjdk_11.0.22.0.101_11.71.14_aarch64
# If you come from bash you might have to change your $PATH.
export PATH=$JAVA_HOME/bin:$HOME/bin:/usr/local/bin:/Users/lshi/Library/Python/3.9/bin:$PATH:/Users/lshi/.local/bin
export WORKON_HOME=/Users/lshi/workspace/virtualenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export ANTHROPIC_BASE_URL="http://127.0.0.1:3456"
export ANTHROPIC_AUTH_TOKEN="dummy-token"
# export SSL_CERT_FILE="/Users/lshi/.config/pip/cert.pem"
# export REQUESTS_CA_BUNDLE="/Users/lshi/.config/pip/cert.pem"

#requeste to use uip_client
#export FUNCTIONAL_DOMAIN="uip"
#export FALCON_INSTANCE="aws-esvc1-useast2"


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
source $HOME/.oh-my-zsh/oh-my-zsh.sh
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--height 55% --layout reverse --border --tmux --color=fg:#d0d0d0,bg:#121212,hl:#5f87af --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff --color=marker:#87ff00,spinner:#af5fff,header:#87afaf"

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
alias docker-compose="docker compose"
alias oc="opencode"
alias server-headless="$HOME/workspace/scripts/server-headless"
alias server-gui="$HOME/workspace/scripts/server-gui"
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
DEFAULT_USER=$USER

# Added by Antigravity
export PATH="/Users/lshi/.antigravity/antigravity/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH

# opencode
export PATH=/Users/lshi/.opencode/bin:$PATH

eval "$(ssh-agent -s)"
ssh-add --apple-load-keychain || true


# pnpm
export PNPM_HOME="/Users/lshi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY="1"

export ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro-max-thinking,deepseek-v4-pro"
export ANTHROPIC_DEFAULT_OPUS_MODEL="minimax-m2.7-max-thinking,minimax-m2.7"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash,deepseek-v4-flash"
export ANTHROPIC_SMALL_FAST_MODEL="deepseek-v4-flash,deepseek-v4-flash"
export ANTHROPIC_CUSTOM_MODEL_OPTION="minimax-m2.7-regular,minimax-m2.7"
export ANTHROPIC_CUSTOM_MODEL_OPTION_NAME="MiniMax M2.7 Regular"
export ANTHROPIC_CUSTOM_MODEL_OPTION_DESCRIPTION="Routed through CCR to LiteLLM on 127.0.0.1:4001"

# Reset enhanced keyboard reporting if an SSH/TUI session exits unexpectedly.
autoload -Uz add-zsh-hook
_fix_stale_keyboard_protocol() {
  printf '\e[<u\e[=0u' > /dev/tty
}
add-zsh-hook precmd _fix_stale_keyboard_protocol
