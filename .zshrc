# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export PATH="$HOME/dev/flutter/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/bin/helix"
export CHROME_EXECUTABLE='/usr/bin/chromium'

alias esa="~/work/EuroSkillsApp"

alias pacs="sudo pacman -S"
alias pacup="sudo pacman -Syu"
alias pacr="sudo pacman -Rns"
alias zj="zellij"
alias zjl="zellij --layout layout.kdl"
alias ip="ip --color=auto"
alias l="exa -l --icons"
alias ll="exa -l -a --icons"
alias cd="z"
alias ff="firefox"
alias esa="flutter run --flavor euroskillsDev --dart-define-from-file=dart_defines.json"
alias eshd="flutter run --dart-define-from-file=dart_defines.json --web-port=5001"
alias ga="git add"
alias gcm="git commit -m"
alias start_snx="sudo snx-rs -m command &"

alias docker="podman"

alias gff='git pull --ff-only upstream $(git branch --show-current)'

ZSH_THEME="af-magic"

# Completions
typeset -gaU fpath=($fpath ~/.local/share/zsh/completions)
autoload -U compinit; compinit
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/user/.opam/opam-init/init.zsh' ]] || source '/home/user/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
