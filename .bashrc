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

export PATH="$PATH:/home/hellia/.local/bin"

export EDITOR='vim'
export VISUAL='vim'

neofetch

eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() {
				fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
				fd --type=d --hidden --exclude .git . "$1"
}
source ~/git/fzf-git.sh/fzf-git.sh
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {} ; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
_fzf_comprun() {
				local command=$1
				shift
				case "$command" in
								cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
								export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
								ssh) fzf --preview 'dig {}' "$@" ;;
								*) fzf --preview "$show_file_or_dir_preview" "$@" ;;
				esac
}

alias cat='bat --paging=never'
alias ls='eza --git --icons=always'

eval $(thefuck --alias)
eval $(thefuck --alias fk)

eval "$(zoxide init bash)"
