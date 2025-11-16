#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add Cargo's bin directory
if [ -d "${HOME}/.cargo/bin" ]; then
    PATH="${HOME}/.cargo/bin:${PATH}"
fi

export PATH

# If starship is installed do:
if command -v starship > /dev/null; then
    eval "$(starship init bash)"
fi

# If fzf is installed do:
if command -v fzf > /dev/null; then
    eval "$(fzf --bash)"
fi

# If zoxide is installed do:
if command -v zoxide > /dev/null; then
    eval "$(zoxide init bash)"
fi

EDITOR=nvim

# Tmux aliases
alias tns="tmux new -s"
alias tls="tmux ls"
alias tat="tmux attach -t"
alias tatt="tmux attach -t"
alias tks="tmux kill-server"

# Git aliases
#
alias g=git
#
# Log
alias gtree="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
alias g3="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
# 
# Init and remote
alias gnt='git init'
alias gini='git init'
alias ginit='git init'
alias grv='git remote -v'
alias gra='git remote add'
#
# Push, pull and fetch
alias gpull='git pull'
alias gpl='git pull'
alias gpush='git push'
alias gph='git push'
alias gfa='git fetch --all'
alias gt='git tag'
#
# Diff, restore and status
alias gdf='git diff'
alias gdiff='git diff'
alias gre='git restore'
alias grte='git restore'
alias gss='git status'
#
# Add, commit and reset
alias gad='git add'
alias gadd='git add'
alias gcm='git commit -m'
alias gct='git commit -m'
alias gcom='git commit -m'
alias gcmam='git commit --amend'
alias gctam='git commit --amend'
alias gcomam='git commit --amend'
alias grt='git reset'
alias greset='git reset'
#
# Branch and checkout
alias gb='git branch'
alias gba='git branch -a'
alias gck='git checkout'
alias gckb='git checkout -b'
#
# Git TUI 
alias gc=git-crypt
alias gg=lazygit

alias ls='ls -h --color=auto'
alias la='ls -ah --color=auto'
alias ll='ls -ahl --color=auto'
alias grep='grep --color=auto'
alias bye='sudo poweroff'
alias see='sudo reboot'

PS1='[\u@\h \W]\$ '
