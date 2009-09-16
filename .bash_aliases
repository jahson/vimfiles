# reload bash to get new settings to work
alias reloadbash='source ~/.bash_profile'

# showa: to remind yourself of an alias (given some part of it)
showa() { grep -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' ; }

if [ "$OS" = "darwin" ]; then
	# locatemd: to search for a file using Spotlight's metadata
	function locatemd { mdfind "kMDItemDisplayName == '$@'wc"; }
fi

# Aliases
alias cls="clear"
if [ "$OS" = "linux" ]; then
	alias ls="ls --color=auto"
else
	alias ls="ls -hGF"
fi
alias ll="ls -lhF"
alias la="ls -a"
alias lla="ls -la"
alias ps?="ps waux |grep"
alias gi="grep -Ri"
alias targz="tar zxf"
alias e="vim"
alias se="sudo vim"
alias ..="cd .."
alias ...="cd .. ; cd .."
alias port="sudo port"
alias apt-get="sudo apt-get"

# count connections from ip
alias connip="netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"

# show most used commands
alias cmdprofile="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

#development aliases
ngle() {
    vim /usr/local/logs/nginx-$1-error.log
}

ngerr() {
    tail /usr/local/logs/nginx-$1-error.log
}

# History find
hf() {
    grep "$@" ~/.bash_history
}

#  vim: set ts=4 sw=4 noexpandtab : #
