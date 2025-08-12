neofetch 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Homebrew binary path:
export PATH="/opt/homebrew/bin:$PATH"


# O-M-Z path:
export ZSH="$HOME/.oh-my-zsh"

# zsh-theme:
ZSH_THEME="powerlevel10k/powerlevel10k"

# zsh-plugins:
plugins=(git zsh-autosuggestions zsh-syntax-highlighting macos)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# -------- Load exports/aliases ---------------
source ~/.exports.zsh
source ~/.aliases.zsh


DISABLE_MAGIC_FUNCTIONS="true "
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"


# ------------ FZF --------------
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden  --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# -----------------------------


# Path for clang++ compiler
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Path for postgresql
export PATH="$(brew --prefix postgresql@17)/bin:$PATH"

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh
