# History setup
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gerben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall




# FZF SETTINGS:

# FZF_DEFAULT_COMMAND
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
  
  

# --tmux [center|top|bottom|left|right][,SIZE[%]][,SIZE[%]]
#fzf --tmux center         # Center, 50% width and height
#fzf --tmux 80%            # Center, 80% width and height
#fzf --tmux 100%,50%       # Center, 100% width and 50% height
#fzf --tmux left,40%       # Left, 40% width
#fzf --tmux left,40%,90%   # Left, 40% width, 90% height
#fzf --tmux top,40%        # Top, 40% height
#fzf --tmux bottom,80%,40% # Bottom, 80% height, 40% height


# Aliases
alias sb="cd ~/second-brain"
alias dev="cd ~/dev"
alias down="cd ~/Downloads"
alias la="ls -lah"
alias lg="lazygit"
alias sd="cd ~ && cd \$(find * -type d | fzf)"

eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

bindkey "\e[3~" delete-char 

