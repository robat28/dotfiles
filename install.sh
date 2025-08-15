#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# ──────────────────────────────  Helpers  ────────────────────────────────────
info()  { printf "\033[38;5;117m➜ %s\033[0m\n" "$*"; }   # cyan
warn()  { printf "\033[38;5;214m⚠  %s\033[0m\n" "$*"; }  # orange
error() { printf "\033[38;5;196m✖  %s\033[0m\n" "$*"; }  # red

# ──────────────────────────────  dotfiles  ─────────────────────────────

DOTFILES_DIR="$(pwd)"
if [[ $(basename "$DOTFILES_DIR") != "dotfiles" ]]; then
  error "Please run this script from your dotfiles directory (~/dotfiles)."
  exit 1
fi

# ──────────────────────────────  Homebrew  ──────────────────────────────────

if ! command -v brew &>/dev/null; then
  info "Installing Homebrew…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  info "Homebrew already installed."
fi

# Put Apple-silicon Homebrew in PATH _for this script run_ (shell re-opens use your .zshrc)
eval "$(/opt/homebrew/bin/brew shellenv)"

# ────────────────────────  Brew packages & casks  ───────────────────────────

if [[ -f Brewfile ]]; then
  info "Using Brewfile to install packages…"
  brew bundle
else
  info "Installing required packages individually…"
  brew install \
    git stow zsh bat fd lsd fzf yazi zoxide eza node lua neovim fastfetch
  brew install --cask ghostty aerospace firefox raycast rectangle aldente alt-tab caffeine visual-studio-code 
fi

# ──────────────────  Make Zsh the default login shell  ──────────────────────

BREW_ZSH="$(brew --prefix)/bin/zsh"

if ! grep -qx "$BREW_ZSH" /etc/shells; then
  info "Adding $BREW_ZSH to /etc/shells (requires sudo)…"
  echo "$BREW_ZSH" | sudo tee -a /etc/shells >/dev/null
fi

if [[ "$SHELL" != "$(command -v zsh)" ]]; then
  info "Setting zsh as the default shell…"
  chsh -s "$(command -v zsh)"
fi

# ─────────────────────────  Oh My Zsh & plugins  ────────────────────────────

# Install Oh My Zsh (non-interactive, keep existing .zshrc)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "Installing Oh My Zsh…"
  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  info "Oh My Zsh already installed."
fi

# Clone plugins/themes into $ZSH_CUSTOM
export ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
mkdir -p "${ZSH_CUSTOM}/plugins" "${ZSH_CUSTOM}/themes"

clone_or_pull () {
  local url="$1" dest="$2"
  if [[ -d "$dest/.git" ]]; then
    info "Updating $(basename "$dest")…"
    git -C "$dest" pull --ff-only
  else
    info "Cloning $(basename "$dest")…"
    git clone --depth=1 "$url" "$dest"
  fi
}

clone_or_pull https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"
clone_or_pull https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
clone_or_pull https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"

# ────────────────────────────────  fzf  ─────────────────────────────────────
if command -v fzf &>/dev/null; then
  info "Installing fzf key-bindings & completions…"
  "$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc
fi

# ──────────────────────────────  Stow files  ────────────────────────────────
info "Symlinking dotfiles with GNU Stow…"
mkdir -p "$HOME/.config"

cd "$DOTFILES_DIR" 

# 1. top-level dot-files (zsh)
stow --restow --target "$HOME" zsh

# 2. XDG-style configs (bat, ghostty, yazi, …)
stow --restow --target "$HOME/.config" config

info "✨ All done"

