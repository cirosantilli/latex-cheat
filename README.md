Cheats and information on LaTeX.

Compiled output files found at: <http://cirosantilli.uphero.com/latex-cheat/>

If you are looking for a template, see <https://github.com/cirosantilli/latex-template>. It was used to make this repo.

This contains submodules, so clone with the recursive flags:

    git clone --recursive https://github.com/cirosantilli/latex-cheat

and if you forgot it do afterwards:

    git submodule init
    git submodule update

Most important files:

- [src/index.tex](src/index.tex): main cheat

#distributions

The easiest way to get started with LaTeX is by using a distribution that packs up everything you need.

Some distributions also come with a package manager which automatically downloads sty files as needed.

##TeX Live

Most common Linux distribution, also works on Windows and Mac OS X.

`texlive-full` is the name of the Ubuntu repo for the TeX Live distro which contains the most packages.

It has enormous size (1Gb+), but  this is the best works out-of-the-box bet while Ubuntu LaTeX has no package manager ( even windows miktex latex distro has one... ).

    sudo aptitude install -y texlive-full

If you really want TeX Live 2013:

    curl https://raw.github.com/cirosantilli/latex-cheat/master/install-texlive2013-ubuntu12.04.sh | bash 

The source:

    https://www.tug.org/svn/texlive/trunk/

Seems to be the only way to determine what is in or not.

#sty search path

For a single user first find:

    kpsewhich -var-value=TEXMFHOME

Commonly `~/texmf/` in Linux.

For multiple users use:

    kpsewhich -var-value=TEXMFLOCAL

Commonly `/usr/local/share/texmf/` in Linux.

Note that `TEXMFHOME` and `TEXMFLOCAL` are not regular environment variables.

The other paths which you should not touch are:

    kpsewhich -var-value=TEXMFMAIN
    kpsewhich -var-value=TEXMFDIST

Main being default stys, usually at `/usr/share/latex/texmf` and dist being the one managed by your distro (texlive), usually `/usr/share/latex/texmf-dist/`.

Under Ubuntu, those values are determined in the following settings file: `cat /usr/share/texmf/web2c/texmf.cnf`

Next, you should use the following subdir structure:

    "`kpsewhich -var-value=TEXMFHOME`"/tex/latex/NAME/NAME.sty
    "`kpsewhich -var-value=TEXMFLOCAL`"/tex/latex/NAME/NAME.sty

But I am not sure if the NAME subdir is imposed or not since putting the sty anywhere `tex/latex` worked for me. Only the basename of the seemed to matter.

So at the first usage you will want to:

    texmfhome="`kpsewhich -var-value=TEXMFHOME`"
    mkdir -p "$texmdfhome"
    mkdir -p "$texmdfhome"/tex/
    mkdir -p "$texmdfhome"/tex/latex/

And for every new sty you create (clone) a new dir there with the same name as the sty.

It may be necessary to update package database with:

    sudo texhash

texmf stands for Tex Meta Fonts. My guess: an historical name that was a path for fonts which was extended to `.sty` files.

#texmaker editor

Easy to user LaTeX editor:

    sudo aptitude install -y texmaker

#blatexml

Convert LaTeX to MathML.

#TODO

* how to add hrule after every environment

* how to create theorem environments with label (bold Theorem thing at beginning)
    given in source and not in definition

* how to center all rows in a tabular without specifying how many rows are there
    ([c] instead of [ccccc], which might change afterwards)
