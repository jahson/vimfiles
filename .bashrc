# Executed for every interactive shell.

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]
then
	# Shell is non-interactive.  Be done now!
	return
fi

# Preferred editor
export EDITOR=vim

# mySql prompt tuning
export MYSQL_PS1="(\U) [\d]>\_"

# convert multiline commands to one line
shopt -s cmdhist

# check window size after each command - to change lines and columns accrodingly
shopt -s checkwinsize

# OS X specific {{{
if [[ $OS == "darwin" ]]
then
	# Java & Tomcat settings
	export CATALINA_HOME=/Users/jahson/sources/apache-tomcat-6.0.18-src/output/build
	export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
	# PHP stuff - to resolve autoconf and autoheader problems
	export PHP_AUTOCONF='autoconf213'
	export PHP_AUTOHEADER='autoheader213'
fi
#}}}

# Load completion scripts {{{
complete -o dirnames -d cd
if [[ -f ~/.completion.git.sh ]]
then
	source ~/.completion.git.sh
fi
if [[ -f ~/.completion.svn.sh ]]
then
	source ~/.completion.svn.sh
fi
#}}}

# Load aliases script {{{
if [[ -f ~/.bash_aliases ]]
then
	. ~/.bash_aliases
fi
#}}}

# Allow access to history from another window {{{
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTFILESIZE=4096
export HISTCONTROL=ignoreboth
# do not write following commands in history
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla""]"
#}}}

# Colours
export CLICOLOR=1
set TERM xterm-256color; export TERM
# coloured grep output
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# Bash prompt tuning {{{
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

PS1='\[\e[0;36m\][\t] \[\e[0;37m\]\u@\h:'$STARTCOLOUR'$PWD'$ENDCOLOUR' \[\e[0;35m\]$(__git_ps1 "(%s)") \[\e[0m\]\$ ' 
#}}}

# Directory colours {{{
if  [[ $OS == "linux" ]]
then
	export LS_COLORS='di=93:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=91:*.rb=90'
else
	export LSCOLORS="dxfxcxdxbxegedabagacad"
fi
#}}}

# vim: set ts=4 sw=4 noexpandtab fdm=marker: #
