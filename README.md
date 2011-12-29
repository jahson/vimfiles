vimfiles
=======
This is my vim config that I use in my everyday work.

Installation
------------

There are two ways of installing vimfiles - through git or by downloading source.

### Git way
    cd ~
    git clone git://github.com/jahson/vimfiles.git
    vimfiles/install

### Download way
    cd ~
    *download [name].tar.gz from GitHub*
    tar zxpf [name].tar.gz
    mv [name] vimfiles
    vimfiles/install

Update to latest version
------------------------

That simple (git required).

    cd ~
    vimfiles/update

Mappings
--------
Note that my mapleader is ``,``.

* ``<Esc><Esc>`` - stop search highlighting
* ``<F2>`` - go over line numbering modes (numbers, relative numbers, none)
* ``<F3>`` - toggle NerdTree window
* ``<F4>`` - toggle TagList window
* ``<F5>`` - puts vim in 'paste' mode (used to paste text without formatting)
* ``<Leader>.`` - go to next buffer
* ``<Leader>m`` - go to previous buffer
* ``<Leader>2`` - switch indent to 2 spaces
* ``<Leader>4`` - switch indent to 4 spaces
* ``<Leader>f`` - display all lines with word under cursor and ask which one to jump to
* ``<Leader>a`` - run ack in current directory with word under cursor as argument
* ``<Leader>b`` - unload and delete current buffer
* ``<Leader>w`` - exit saving changes
* ``<Leader>s`` - save changes (also force readonly files)
* ``<Leader>q`` - exit without saving
* ``<Leader>h`` - vertically split current window
* ``<Leader>v`` - horizontally split current window
* ``<Leader>c`` - close current window
* ``<Leader>fc`` - find merge conflict markers
* ``<Leader>ev`` - edit .vimrc
* ``<Leader>e`` - open an edit command with the path of currently edited file filled in
* ``<Leader>ml`` - append modeline to the end of file
* ``<Leader><Space>`` - clear whitespace with confirmation
* ``<Leader>df`` - clear ^M from dos file format
* ``ctrl + h`` - Normal Mode: move cursor to window left of current one; Insert Mode: move cursor left
* ``ctrl + j`` - Normal Mode: move cursor to window below of current one; Insert Mode: move cursor down
* ``ctrl + k`` - Normal Mode: move cursor to window above of current one; Insert Mode: move cursor up
* ``ctrl + l`` - Normal Mode: move cursor to window right of current one; Insert Mode: move cursor right
* ``gf`` - open file under cursor in new window
