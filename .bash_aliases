# showa: to remind yourself of an alias (given some part of it)
showa() { grep -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' ; }

# locatemd: to search for a file using Spotlight's metadata
function locatemd { mdfind "kMDItemDisplayName == '$@'wc"; }

# Aliases
alias cls="clear"
alias ls="ls -hGF"
alias ll="ls -lhF"
alias la="ls -a"
alias lla="ls -la"
alias ps?="ps waux |grep"
alias grepi="grep -Ri"
alias targz="tar zxf"
alias e="vim"

#development aliases
ngle() {
    vim /usr/local/logs/nginx-$1-error.log
}
alias ngle=ngle

ngerr() {
    tail /usr/local/logs/nginx-$1-error.log
}
alias ngerr=ngerr
