# Identify OS
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`

if [ "$OS" = "darwin" ]; then
	# Macports
	export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH
	export MANPATH=/opt/local/share/man:$MANPATH
	export INFOPATH=/opt/local/share/info:$INFOPATH
fi

# Russian language support
unset LC_ALL
export LANG="ru_RU.UTF-8"
export LC_CTYPE="ru_RU.UTF-8"
export LC_NUMERIC="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"
export LC_MONETARY="ru_RU.UTF-8"
export LC_MESSAGES="ru_RU.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_NAME="ru_RU.UTF-8"
export LC_ADDRESS="ru_RU.UTF-8"
export LC_TELEPHONE="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_IDENTIFICATION="ru_RU.UTF-8"

source ~/.bashrc

# Hello message
echo -e "Kernel: " `uname -smr`
echo -ne "Uptime: "; uptime
echo -ne "Local date: "; date
echo -e ""
df -h
echo -e ""

# vim: set ts=4 sw=4 noexpandtab: #
