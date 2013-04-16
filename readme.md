latex cheats and information

this contains submodules, so after clone you need:

    git submodule init
    git submodule update

to get the submodules

# how to install latex on ubuntu

texlive-full has enormous size (1Gb+) and lots of packages

this is the best works out of the box bet
while ubuntu latex has no package manager (windows has one...)

    #sudo aptitude install -y texlive
    sudo aptitude install -y texlive-full

# texmaker editor

easy to user latex editor:
    
    sudo aptitude install -y texmaker

# dirs

* media: everything that is not a tex file, such as an image or table
* _aux: auxiliary tex compilation files.
* _out: output files such as pdf

while using those two directories adds some complexity to compilation,
they clear up the main dir so much that I decided to use them anyways

# files

## main.sty

both cheatsheet and template for new projects

## table.ods

it is much easier to edit tables in [libreoffice](http://www.libreoffice.org/features/calc/)
or other spreadsheet applications since its much easier to keep things alligned

give a lable to every table, and then name the tables as label.ods so that 
corresponding tables can be found afterwards for further editing

# TODO

* how to add hrule after every environment

* how to create theorem environments with label (bold Theorem thing at beginning)
    given in source and not in definition

* how to center all rows in a tabular without specifying how many rows are there
    ([c] instead of [ccccc], which might change afterwards)
