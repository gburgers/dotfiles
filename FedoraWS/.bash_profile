# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
