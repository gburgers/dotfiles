# .bashrc

set -o vi

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User bin location
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# # $GOPATH/bin voor Go tools: templ, gopls etc.
if ! [[ "$PATH" =~ "$HOME/go/bin:" ]]; then
  PATH="$HOME/go/bin:$PATH"
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
# bind Space:magic-space
if [[ $- == *i* ]]; then
    bind 'Space:magic-space'
fi

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
  if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi
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
# Go compiler (manual installation)
export PATH="/usr/local/go/bin:$PATH"
export PATH=$PATH:$HOME/data/ai/bin


# Env variable for Go development Slog LOG_LEVEL: INFO / DEBUG
export LOG_LEVEL=DEBUG

# Key bindings

#bindkey "^[[3~" delete-char

alias grp='cd $GHREPOS'

alias godev='toolbox enter godev_1_26_1'
alias cli='toolbox enter cli-tools'
alias ai='toolbox enter ai-tools'
alias oc='toolbox run -c ai-tools opencode'
alias cl='toolbox run -c ai-tools claude'
alias lg='toolbox run -c cli-tools lazygit'

# AI Agents in ~/data/ai/agents/coding/coding_mentor.json
# alias ai-code='toolbox run -c ai-tools opencode --agent "/home/gerben/data/ai/agents/coding/coding_agent.json" .'
alias ai-code='toolbox run -c ai-tools opencode --agent coding_mentor .'


# Neovim from toolbox
# agrplias nvim='toolbox run -c cli-tools nvim'

# ls
alias ls='ls --color=auto'
alias la='ls -lathr'

alias sw='toolbox run -c cli-tools nvim /home/gerben/.config/sway/config'
alias eb='toolbox run -c cli-tools nvim /home/gerben/.bashrc'
alias sb='source /home/gerben/.bashrc'

# Other CLI tools if needed

alias rg='toolbox run -c cli-tools rg'
alias fzf='toolbox run -c cli-tools fzf'
alias bat='toolbox run -c cli-tools bat'
alias htop='toolbox run -c cli-tools htop'

# Go-dev tools
alias code='toolbox run -c go-dev code'

# Quick screenshots
alias ss='grimshot save area'
# Screenshot + edit
alias sse='~/.local/bin/grimshot-pinta'

# Kubernetes
alias k='kubectl'
alias ka='kubectl apply -f'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kgs='kubectl get svc'
alias kgi='kubectl get ingress'
alias kgn='kubectl get nodes'
alias kl='kubectl logs -f'
alias ke='kubectl exec -it'

# Context & namespace (short & sweet)
alias kc='kubectx'
alias kn='kubens'
alias kwhere='kubectx -c && kubens -c' # "where the hell am I?"

# One-letter cluster switches (when you have k3s-vm and k3s-prod)
alias kdev='kubectx k3s-vm'
alias kprod='kubectx k3s-prod'

# Quick namespace switches
alias kpr='kubens liteshop-web-prod'
alias kst='kubens liteshop-web-staging'

# k9s (because you’ll live in it)
alias k9='k9s'

# Update all k8s tools in toolbox
alias k3s-update='toolbox enter kubernetes && sudo dnf update -y kubectl k9s && exit && echo "kubectl $(kubectl version --client --short) | k9s $(k9s version --short)"'

# Bonus: restart your app instantly (replace ls-app with your deployment name)
alias krestart='kubectl rollout restart deployment ls-app'

# Current project home dir, working on
alias qq='cd /home/gerben/dev/Repos/github.com/gburgers/liteshop-web'

v() {
  # If we're already inside toolbox, just run nvim directly
  if [ -n "${TOOLBOX_PATH:-}" ] || [ -f /run/.toolboxenv ]; then
    command nvim "$@"
  else
    toolbox run -c cli-tools nvim "$@"
  fi
}



# Kubernetes completion – works with toolbox-installed kubectl
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion bash)
fi

# Bonus: also complete the k alias
complete -F __start_kubectl k

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

#echo "Reminder! Are you on development? If not: git checkout development"

# opencode
export PATH=/home/gerben/.opencode/bin:$PATH

# fzf keybindings (Ctrl-T, Ctrl-R, Alt-C) – from cli-tools toolbox
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash


function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
