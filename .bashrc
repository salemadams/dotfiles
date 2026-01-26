#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

export SUDO_EDITOR="/usr/bin/nvim"

alias ls='eza --icons=auto --color=auto'
alias la='eza -a --icons=auto --color=auto'
alias ll='eza -l --icons=auto --color=auto'
alias l='eza -F --icons=auto --color=auto'
alias lt='eza --tree --icons=auto --color=auto'

alias nv='nvim'
alias snv='sudoedit'

alias grep='grep --color=auto'

alias cl='clear'

PS1='[\u@\h \W]\$ '
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias lgdot='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'
