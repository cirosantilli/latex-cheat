latex cheats and information

# dependencies

this contains submodules, so after clone you need:

    git submodule init
    git submodule update

to get the submodules.

this also depends on the following sty files:

- https://github.com/cirosantilli/latex-shared-presentation-sty/tree/c5e44ed4677e644f360c9ff4c34dec85e326739c
- https://github.com/cirosantilli/latex-shared-sty/tree/dafc1feef09056637c2b55e887bbdfbf90613158

which you should put in your sty search path as explained in [sty-search-path](#sty-search-path)

# how to install latex on ubuntu

texlive-full is a latex distribution: it packages lots of .sty files and utilities.

it has enormous size (1Gb+) and lots of packages.

this is the best works out of the box bet
while ubuntu latex has no package manager (windows has one...)

    #sudo aptitude install -y texlive
    sudo aptitude install -y texlive-full

# sty search path

for a single user first find:

    kpsewhich -var-value=TEXMFHOME

commonly `~/texmf/` in linux and then place the files as:

`TEXMFHOME` is not an enviroment variable.

next, you *must* use the following subdir structure.

    `kpsewhich -var-value=TEXMFHOME`/tex/latex/NAME/NAME.sty

AFAIK the the dirname must match the basename exactly, so you can only
have one file per directory. TODO: confirm.

and it may be necessary to update package database with:

    sudo texhash

# texmaker editor

easy to user latex editor:
    
    sudo aptitude install -y texmaker

# TODO

* how to add hrule after every environment

* how to create theorem environments with label (bold Theorem thing at beginning)
    given in source and not in definition

* how to center all rows in a tabular without specifying how many rows are there
    ([c] instead of [ccccc], which might change afterwards)
