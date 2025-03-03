#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

# Symlink configs
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/oh-my-zsh" "$HOME/.oh-my-zsh"
ln -sf "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
ln -sf "$DOTFILES_DIR/fastfetch" "$HOME/.config/fastfetch"
ln -sf "$DOTFILES_DIR/neofetch" "$HOME/.config/neofetch"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/wallpapers" "$HOME/Wallpapers"

# Load GNOME settings (if GNOME is installed)
if command -v dconf >/dev/null; then
  dconf load /org/gnome/ <"$DOTFILES_DIR/gnome-settings.dconf"
fi

echo "Setup complete! Run 'source ~/.zshrc' to reload Zsh."
