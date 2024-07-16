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

eval "$(starship init bash)"


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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gerben/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gerben/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gerben/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gerben/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
