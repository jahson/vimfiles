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
echo -e "There are some pretty useful keyboard shortcuts for editing in bash:"
echo -e "   * Ctrl + a => Return to the start of the command you're typing"
echo -e "   * Ctrl + e => Go to the end of the command you're typing"
echo -e "   * Ctrl + u => Cut everything before the cursor to a special clipboard"
echo -e "   * Ctrl + k => Cut everything after the cursor to a special clipboard"
echo -e "   * Ctrl + y => Paste from the special clipboard that Ctrl + u and Ctrl + k save their data to"
echo -e "   * Ctrl + t => Swap the two characters before the cursor"
echo -e "   * Ctrl + w => Delete the word / argument left of the cursor"
echo -e "   * Ctrl + l => Clear the screen"

# vim: set ts=4 sw=4 noexpandtab: #
