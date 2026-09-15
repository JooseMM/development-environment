#!/bin/zsh

# create an config folder if needed and cd into it
mkdir -p /root/.config && cd /root/.config

# clone configuration files from github
git clone https://www.github.com/JooseMM/nvim.git
git clone https://www.github.com/JooseMM/starship.git

# Setup Tmux
git clone https://www.github.com/JooseMM/tmux.git
cd tmux/plugins && rm ./* -rf
git clone https://github.com/tmux-plugins/tpm

# cd into user directory and clone zsh configuration file
cd /root

# Write configuration to .zshrc safely
cat << 'EOF' > /root/.zshrc
export LANG=en_US.UTF-8

autoload -U colors && colors

# Modern CLI tools
alias ls='eza'
alias cat='bat'
alias pacman='pacman --color=always'
alias tmux='tmux -u'

# The only EDITOR
export EDITOR='nvim'

# Vim motions in terminal
set -o vi

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Highlight command syntax (with fallback check)
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting.zsh
fi
EOF

# create history file
touch /root/.zsh_history

echo "✨ Configuration completed successfully"
