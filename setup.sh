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

# Load GNOME settings
if command -v dconf >/dev/null; then
  dconf load /org/gnome/ <"$DOTFILES_DIR/gnome-settings.dconf"
fi

# Apply GRUB extensions (e.g., CyberGRUB-2077 theme)
if [ -d "$DOTFILES_DIR/grub-extras/CyberGRUB-2077" ]; then
  sudo mkdir -p /boot/grub/themes
  sudo cp -r "$DOTFILES_DIR/grub-extras/CyberGRUB-2077" /boot/grub/themes/
  # Update GRUB config to use the theme (adjust path as needed)
  sudo sed -i 's|^#GRUB_THEME=.*|GRUB_THEME="/boot/grub/themes/CyberGRUB-2077/theme.txt"|' /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Install Yay if not present
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
fi

# Install fastfetch if not present
if ! command -v fastfetch &>/dev/null; then
  yay -S --noconfirm fastfetch
fi

# Run other custom scripts (if included)
if [ -d "$DOTFILES_DIR/other-scripts" ]; then
  for script in "$DOTFILES_DIR/other-scripts"/*.sh; do
    if [ -f "$script" ]; then
      bash "$script"
    fi
  done
fi

echo "Setup complete! Run 'source ~/.zshrc' to reload Zsh."
