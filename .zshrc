export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

eval "$(/opt/homebrew/bin/brew shellenv)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-completions/tree/master/src
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets (https://github.com/ohmyzsh/ohmyzsh/wiki/plugins)
zinit snippet OMZP::sudo
zinit snippet OMZP::git
zinit snippet OMZP::docker

# Load zsh-completions
autoload -Uz compinit && compinit

# MUST BE AT THE END OF zinit COMMANDS
zinit cdreplay -q

# Keybindings
bindkey -e # emux mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias nvim='nvim'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# MUST BE AT THE END OF THE FILE (https://github.com/starship/starship)
eval "$(starship init zsh)"

