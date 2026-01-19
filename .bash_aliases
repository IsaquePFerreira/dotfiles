# Customiza prompt do BASH
export PS1='\[\e[91m\]:\[\e[92m\][\W]\$\[\e[0m\] '
# export PS1='[\u@\h \W]\$ '

# Adiciona '~/.local/bin' à variável $PATH
if [[ -d ~/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Define algumas variáveis de ambiente
export TERM="xterm-256color"
#export TERMCMD="sakura"
export SHELL="/bin/bash"
export EDITOR="nvim"
export PAGER="less"

# Aliases
# ls
alias ls="ls --color=auto"
alias l="ls -al"
# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
# Outros
alias wget="wget -c"
alias ips="ip -c -br a"

# Habilita o autocomplete do BASH a ignorar maiúsculas e maiúsculas
bind "set completion-ignore-case on"
# Habilita algumas opções do BASH
shopt -s autocd
shopt -s expand_aliases

