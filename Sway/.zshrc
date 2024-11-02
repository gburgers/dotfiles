# Created by newuser for 5.9

# Environment Variables

set -o vi
export TERM=xterm-256color

# Directories

export REPOS="$HOME/Repos"
export GITUSER="gburgers"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"


# Key bindings

bindkey "^[[3~" delete-char


# Path configuration

setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $SCRIPTS
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# History

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# Prompt (pure prompt) 

PURE_GIT_PULL=0

fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure


# Aliases

# repos
alias scripts='cd $SCRIPTS'
alias c="clear"
alias dot='cd $REPOS/dotfiles'
alias rp='cd $REPOS'
alias grp='cd $GHREPOS'
#alias gr='ghrepos'

# ls
alias ls='ls --color=auto'
alias la='ls -lathr'

alias sw="nvim /home/gerben/.config/sway/config"
alias code="code --enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto"
alias ez="nvim /home/gerben/.zshrc"
alias sz="source /home/gerben/.zshrc"
alias down="cd /home/gerben/Downloads"
alias ts="sudo -E timeshift-launcher"
alias hl="cd /home/gerben/dev/homelab"
alias dev="cd /home/gerben/dev"

# git
alias lg='lazygit'

# lynx
#alias lynx='/home/gerben/bin/lynx'
alias '?'=duck
alias '??'=google
alias '???'=bing

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
