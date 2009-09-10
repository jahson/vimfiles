# Macports
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export INFOPATH=/opt/local/share/info:$INFOPATH
export CATALINA_HOME=/Users/jahson/sources/apache-tomcat-6.0.18-src/output/build
export JAVA_HOME=/usr

# other
export EDITOR=vim

# completion
complete -o dirnames -d cd
complete -W 'master@trunk.qippo.com jahson.sellinday.ndev jahson.dating.ndev' ssh
source .completion.git.sh
source .completion.svn.sh

#aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# multiline commands -> one line commands
shopt -s cmdhist

# History tuning
shopt -s histappend
HISTFILESIZE=1024
HISTCONTROL=ignoreboth
bind '"\e[B":history-search-forward'
bind '"\e[A":history-search-backward'

set TERM xterm-256color; export TERM

# Bash prompt tuning
case $(id -u) in
	0)
		export STARTCOLOUR='\[\e[1;31m\]';
		;;
	*)
		export STARTCOLOUR='\[\e[0;32m\]';
		;;
esac
export ENDCOLOUR="\[\e[0m\]"


case $TERM in
	xterm*)
		export TITLEBAR='\[\e]0;\u@\h :: $PWD\a\]';
		;;
	*)
		export TITLEBAR="";
		;;
esac

PS1=$TITLEBAR'\[\e[0;36m\][\t] '$STARTCOLOUR'$PWD'$ENDCOLOUR' \$ ' 

# Colours in terminal
# Warning - using ls from /opt/local/bin/
#if [ "$TERM" != "dumb" ]; then
#	export LS_OPTIONS='--color=auto'
#	eval `dircolors ~/.dir_colours`
#fi

export LSCOLORS="dxfxcxdxbxegedabagacad"
