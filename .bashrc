#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cd='z'
PS1='[\u@\h \W]\$ '

# Import colorscheme from wal asynchronously
(cat ~/.cache/wal/sequences &)
# Add support for TTYs
source ~/.cache/wal/colors-tty.sh

# Created by `pipx` on 2024-03-30 00:58:21
export PATH="$PATH:/home/hellia/.local/bin"

export EDITOR="vim"
export VISUAL="vim"

neofetch

eval "$(zoxide init bash)"
