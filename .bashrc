# Colours
export CLICOLOR=1
set TERM xterm-256color; export TERM
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# java & tomcat
export CATALINA_HOME=/Users/jahson/sources/apache-tomcat-6.0.18-src/output/build
export JAVA_HOME=/usr

# other
export EDITOR=vim

# mysql prompt
export MYSQL_PS1="(\U) [\d]>\_"

if [ "$OS" = "darwin" ]; then
# PHP stuff - to resolve autoconf and autoheader problems
	export PHP_AUTOCONF='autoconf213'
	export PHP_AUTOHEADER='autoheader213'
fi

# completion
complete -o dirnames -d cd
if [ -f ~/.completion.git.sh ]; then
	source ~/.completion.git.sh
fi
if [ -f ~/.completion.svn.sh ]; then
	source ~/.completion.svn.sh
fi

# load aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# convert multiline commands to one line
shopt -s cmdhist

# check window size after each command - to change lines and columns accrodingly
shopt -s checkwinsize

# History tuning
shopt -s histappend
export HISTFILESIZE=3072
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla""]"
bind '"\e[B":history-search-forward'
bind '"\e[A":history-search-backward'

# Bash prompt tuning
case $(id -u) in
	0)
		# root
		export STARTCOLOUR='\[\e[1;31m\]';
		;;
	*)
		# user
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

if [ "$OS" = "linux" ]; then
	export LS_COLORS='di=93:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=91:*.rb=90'
else
	export LSCOLORS="dxfxcxdxbxegedabagacad"
fi

# vim: set ts=4 sw=4 noexpandtab: #
