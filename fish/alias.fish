########################################
# エイリアス
########################################
alias v="vim"
alias m="mkdir"
alias mkdir='mkdir -p'
alias l='ls -a -F'
alias ll='ls -l'
alias pwdc='pwd | pbcopy'

alias f='find ~ -name'
alias o='open'
# file open in GoogleChromeApp
alias chrome="open -a /Applications/Google\ Chrome.app"
alias s='source'

## tree cmd. for react.
alias tree='tree -IF "n*|pub*|pack*|READ*|yarn*|report*"'

## git
alias g='git'
alias gs='git status && git branch'
alias ga='git add .'
alias gc='git add . && git commit -m' 
alias gcl='git clone'
alias cl='git clone'
alias gc='git add . && git commit -m' 
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gl='git log --graph --all'
# alias gl='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
# alias gl='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
alias gb='git branch'
alias gco='git checkout'
alias gr='git remote -v' 
alias grv='git remote -v' 
alias gp='git push'

alias vs='VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args .'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
# ex) ps G rails
# alias -g L='| less'
# alias -g G='| grep'
