Cheats and information on latex.

Compiled output files found at: <http://cirosantilli.uphero.com/latex-cheat/>

If you are looking for a template, see <https://github.com/cirosantilli/latex-template>.
It was used to make this repo.

This contains submodules, so clone with the recursive flags:

    git clone --recursive https://github.com/cirosantilli/latex-cheat

and if you forgot it do afterwards:

    git submodule init
    git submodule update

# how to install latex on ubuntu

texlive is a latex distribution: it packages lots of .sty files and utilities.

texlive-full is the name of the ubuntu repo for the texlive distro which contains the most packages.
it has enormous size (1Gb+), but  this is the best works out-of-the-box bet
while ubuntu latex has no package manager ( even windows miktex latex distro has one... )

    sudo aptitude install -y texlive-full

# sty search path

for a single user first find:

    kpsewhich -var-value=TEXMFHOME

commonly `~/texmf/` in linux.

for multiple users use:

    kpsewhich -var-value=TEXMFLOCAL

commonly `/usr/local/share/texmf/` in linux.

note that `TEXMFHOME` and `TEXMFLOCAL` are not regular enviroment variables.

FYI: the other paths which you should not touch are:

    kpsewhich -var-value=TEXMFMAIN
    kpsewhich -var-value=TEXMFDIST

main being default stys, usually at `/usr/share/latex/texmf` and dist being the one
managed by your distro (texlive), usually `/usr/share/latex/texmf-dist/`.

under ubunutu, those values are determined in the following settings file: `cat /usr/share/texmf/web2c/texmf.cnf`

Next, you should use the following subdir structure:

    "`kpsewhich -var-value=TEXMFHOME`"/tex/latex/NAME/NAME.sty
    "`kpsewhich -var-value=TEXMFLOCAL`"/tex/latex/NAME/NAME.sty

but I am not sure if the NAME subdir is imposed or not since putting
the sty anywhere `tex/latex` worked for me.
Only the basename of the seemed to matter.

so at the first usage you will want to:

    texmfhome="`kpsewhich -var-value=TEXMFHOME`"
    mkdir -p "$texmdfhome"
    mkdir -p "$texmdfhome"/tex/
    mkdir -p "$texmdfhome"/tex/latex/

and for every new sty you create (clone) a new dir there with the same name as the sty.

and it may be necessary to update package database with:

    sudo texhash

FYI: texmf stands for Tex Meta Fonts. My guess: an historical name
that was a path for fonts which was extended to .sty files.

# texmaker editor

easy to user latex editor:

    sudo aptitude install -y texmaker

# TODO

* how to add hrule after every environment

* how to create theorem environments with label (bold Theorem thing at beginning)
    given in source and not in definition

* how to center all rows in a tabular without specifying how many rows are there
    ([c] instead of [ccccc], which might change afterwards)
