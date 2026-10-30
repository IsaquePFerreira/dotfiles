# Custom prompt
export PS1='\[\e[91m\]:\[\e[92m\][\W]\$\[\e[0m\] '
# export PS1='[\u@\h \W]\$ '

# Add '~/.local/bin' to the $PATH
if [[ -d ~/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Define some env vars
export TERM="xterm-256color"
export TERMCMD="sakura"
export SHELL="/bin/bash"
export EDITOR="vim"
export PAGER="less"

# Aliases
# ls
alias ls="ls --color=auto"
alias l="ls -al"
# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
# others
alias wget="wget -c"
alias ips="ip -c -br a"
alias t="tree -L 2 -a"
alias cls="clear"
alias g="git"
alias vi="nvim"

# Ignore case in BASH completion
bind "set completion-ignore-case on"
# Enable some BASH options
shopt -s autocd
shopt -s expand_aliases

