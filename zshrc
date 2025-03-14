# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnosterzak"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &) # This runs the command in the background
# Hide shell job control messages
source ~/.cache/wal/colors-tty.sh

# Custom prompt_context with Arch icon and "chrome" only
prompt_context() {
    local arch_icon="%(?.%{$fg_bold[color4]%}.%{$fg_bold[color1]%})$(print -Pn "\uf303")"
    prompt_segment "$color0" "$color7" "$arch_icon chrome"
}

# Show directory after prompt_context
PROMPT='$(prompt_context)%{$reset_color%} %{$fg_bold[color2]%}%~%{$reset_color%} '
RPROMPT=''

# Set TERM to ensure fastfetch detects Kitty correctly
export TERM=xterm-kitty

# Run fastfetch on startup
fastfetch
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/home/chrome/.local/share/nvim/lazy-rocks/hererocks/bin"
export PATH="/home/chrome/.local/share/nvim/lazy-rocks/hererocks/bin:$PATH"
