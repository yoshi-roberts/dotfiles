# Prompt
OMP=${XDG_DATA_HOME:-${HOME}/.local/bin}/oh-my-posh
[ ! -e $OMP ] && curl -s https://ohmyposh.dev/install.sh | bash -s

# Add ~/.local/bin to PATH
export PATH=$PATH:$HOME/.local/bin

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions.
autoload -U compinit && compinit

# Keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

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
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls="exa"
alias cat="batcat"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

# Mellow colors for fzf.
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#c9c7cd,bg:#161617,hl:#aca1cf --color=fg+:#c9c7cd,bg+:#2a2a2d,hl+:#aca0cf --color=info:#90b99f,prompt:#e29eca,pointer:#e29eca --color=marker:#e6b99d,spinner:#e29eca,header:#c9c7cd'

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
