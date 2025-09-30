# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Increase history size
export HISTSIZE=10000
export HISTFILESIZE=20000

# Don't duplicate commands in history
export HISTCONTROL=ignoredups:erasedups

# Append to history file, don't overwrite
shopt -s histappend

# Save multi-line commands as one entry
shopt -s cmdhist

# Enable history expansion with space
bind Space:magic-space

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

if [ -f /run/.containerenv ]; then
  export STARSHIP_CONFIG=~/.config/starship_container.toml
  eval "$(starship init bash)"
else
  # Use default starship config for host
  eval "$(starship init bash)"
fi

export ELECTRON_OZONE_PLATFORM_HINT=auto

# Directories

export REPOS="$HOME/dev/Repos"
export GITUSER="gburgers"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export EDITOR="nvim"

# Key bindings

#bindkey "^[[3~" delete-char

alias grp='cd $GHREPOS'

alias godev='toolbox enter go-dev'
alias cli='toolbox enter cli-tools'
alias lg='toolbox run -c cli-tools lazygit'

# Neovim from toolbox
# agrplias nvim='toolbox run -c cli-tools nvim'

# ls
alias ls='ls --color=auto'
alias la='ls -lathr'

alias sw='toolbox run -c cli-tools nvim /home/gerben/.config/sway/config'
alias eb='toolbox run -c cli-tools nvim /home/gerben/.bashrc'
alias sb='source /home/gerben/.bashrc'

# Other CLI tools if needed

alias v='toolbox run -c cli-tools nvim'
alias rg='toolbox run -c cli-tools rg'
alias fzf='toolbox run -c cli-tools fzf'
alias bat='toolbox run -c cli-tools bat'
alias tmux='toolbox run -c cli-tools tmux'
alias htop='toolbox run -c cli-tools htop'

# Quick screenshots
alias ss='grimshot save area'
# Screenshot + edit
alias sse='~/.local/bin/grimshot-pinta'
