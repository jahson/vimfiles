# java & tomcat
export CATALINA_HOME=/Users/jahson/sources/apache-tomcat-6.0.18-src/output/build
export JAVA_HOME=/usr

# other
export EDITOR=vim

# completion
complete -o dirnames -d cd
complete -W 'master@trunk.qippo.com jahson.sellinday.ndev jahson.dating.ndev' ssh
source .completion.git.sh
source .completion.svn.sh

# load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# multiline commands to oneline commands
shopt -s cmdhist

# History tuning
shopt -s histappend
export HISTFILESIZE=3072
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla""]"
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

export LSCOLORS="dxfxcxdxbxegedabagacad"

# Hello message
echo -e "Kernel: " `uname -smr`
echo -ne "Uptime: "; uptime
echo -ne "Local date: "; date
