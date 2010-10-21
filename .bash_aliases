# reload bash to get new settings to work
alias reloadbash='source ~/.bash_profile'

# showa: to remind yourself of an alias (given some part of it)
showa() { grep -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' ; }
# show frequently used commands
alias cmdprofile="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Convenience {{{
alias cls="clear"
if [[ $OS == "linux" ]]
then
	alias ls="ls --color=auto"
else
	alias ls="ls -hGF"
fi
alias ll="ls -lhF"
alias la="ls -a"
alias lla="ls -la"
alias ps?="ps waux |grep"
alias gi="grep -Ri"
alias tgz="tar zxpf"
alias e="vim"
alias se="sudo vim"
alias ..="cd .."
alias ...="cd .. ; cd .."
alias rrf="rm -rf"
alias cpr="cp -r"
# auto-sudo for some commands {{{
alias port="sudo port"
alias pecl="sudo pecl"
alias pear="sudo pear"
alias apt-get="sudo apt-get"
#}}}
#}}}

# OS X aliases {{{
if [[ $OS == "darwin" ]]
then
	# Clean firefox profile
	alias cleanfirefox="find ~/Library/Application\ Support/Firefox/Profiles -name '*.sqlite' -exec sqlite3 {} VACUUM \;}"

	# Search for a file using Spotlight's metadata
	function locatemd { mdfind "kMDItemDisplayName == '$@'wc"; }

	# Clean "open with" menu in OS X 10.5+
	function cleanow {
		rm ~/Library/Preferences/com.apple.LaunchServices.*;
		/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r  -domain local -domain system -domain user
	}
fi
#}}}

# Development aliases {{{
ngev() {
	vim /usr/local/logs/nginx-$1-error.log
}

nget() {
	tail /usr/local/logs/nginx-$1-error.log
}

# count connections by ip
alias connip="netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
# }}}

# History find
hf() {
	grep "$@" ~/.bash_history
}

#  vim: set ts=4 sw=4 noexpandtab ft=sh fdm=marker: #
