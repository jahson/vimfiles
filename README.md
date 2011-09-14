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

* ``<Leader>/`` - stop search highlighting
* ``<F2>`` - go over line numbering modes (numbers, relative numbers, none)
* ``<F3>`` - toggle NerdTree window
* ``<F4>`` - toggle TagList window
* ``<F5>`` - puts vim in 'paste' mode (used to paste text without formatting)
