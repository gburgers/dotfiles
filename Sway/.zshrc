# Created by newuser for 5.9

# Environment Variables

set -o vi
# export TERM=xterm-256color
export TERM=tmux-256color

# for kubectl completion error
autoload -Uz compinit
compinit

# Directories

export REPOS="$HOME/dev/Repos"
export GITUSER="gburgers"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export EDITOR="nvim"

# Key bindings

bindkey "^[[3~" delete-char


# Path configuration

setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/go/bin/
    $HOME/.local/bin
    $SCRIPTS
    /usr/local/go/bin
    $HOME/.npm-global/bin
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
alias c='clear'
alias dot='cd $REPOS/dotfiles'
alias rp='cd $REPOS'
alias grp='cd $GHREPOS'
#alias gr='ghrepos'
alias lab='cd $GHREPOS/lab/'
alias hl='cd $GHREPOS/homelab'

# ls
alias ls='ls --color=auto'
alias la='ls -lathr'

alias v='nvim'
alias sw='nvim /home/gerben/.config/sway/config'
alias code='code --enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
alias ez='nvim /home/gerben/.zshrc'
alias sz='source /home/gerben/.zshrc'
alias down='cd /home/gerben/Downloads'
alias ts='sudo -E timeshift-launcher'
alias dev='cd /home/gerben/dev'
alias ev='nvim /home/gerben/.config/nvim/init.lua'
alias sb='cd /home/gerben/dev/Repos/second-brain/3_Resources/Development/'

# git
alias lg='lazygit'

# lynx
#alias lynx='/home/gerben/bin/lynx'
alias '?'=duck
alias '??'=duck
alias '???'=bing

# ssh
alias godev="ssh godev"

# kubectl
alias k='kubectl'
alias kgp='kubectl get pod'
alias kc='kubectx'
alias kn='kubens'
alias kcs='kubectl config use-contex xxx_staging'
alias kcp='kubectl config use-contex xxx_production'

# namespaces
#
# Current namespace
alias kns='kubectl config view --minify -o jsonpath="{..namespace}"'
# Switch namespace
alias ksn='kubectl config set-context --current --namespace'
# List all namespaces
alias kgns='kubectl get namespaces'
# Get pods in all namespaces
alias kgpa='kubectl get pods --all-namespaces'

# Current project home dir, working on 
alias qq='cd $GHREPOS/gopherhacks/cmd/app/'

# kubectl completion
source <(kubectl completion zsh)

# flux completion
. <(flux completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
