LaTeX information and cheatsheets.

Compiled output files found at: <http://cirosantilli.uphero.com/latex-cheat/>

If you are looking for a template, see <https://github.com/cirosantilli/latex-template>. It was used to make this repo.

Relies on the submodule <https://github.com/cirosantilli/latex-submodule> for boilerplate.

See the documentation of the submodule for additional installation instructions.

Most important files of this repo:

- [src/index.tex](src/index.tex): main cheat

# TeX

LaTeX is a TeX library.

This cheat shall focus on LaTeX from high level point of view.

For a TeX cheatsheet see: <https://github.com/cirosantilli/tex-cheat>

## Implementation

TeX source code location: <http://tex.stackexchange.com/questions/111332/how-to-compile-the-source-code-of-tex>

The original source was in the WEB language, <http://en.wikipedia.org/wiki/WEB>, created by Knuth himself, so compiling it is messy.

This has then been translated to C, and the C result is today called web2c, which is the basis for most LaTeX distributions.

# Standards

TODO where is LaTeX specified? Is it standardized by an organization, or just book based like early C?

## Versions

-   `LaTeX2e`: is the latest stable release of `LaTeX`, and as of 2014-03, this is what most people mean when they say `LaTeX`.

-   `LaTeX3`: unstable new version, which promises to offer more built-in functionality through a standard library to rely less on plugins.

    Project website: <http://latex-project.org/latex3.html>

Useful SE questions:

- <http://tex.stackexchange.com/questions/13541/difference-between-latex-latex2e-latex3>
- <http://tex.stackexchange.com/questions/953/why-is-latex3-taking-so-long-to-come-out>

# Distributions

The easiest way to get started with LaTeX is by using a distribution that packs up everything you need.

Some distributions also come with a package manager which automatically downloads sty files as needed.

## TeX Live

Most common Linux distribution and recommended on the [LaTeX website](http://latex-project.org/ftp.html). Also works on Windows and Mac OS X.

The main ways to install it are:

-   download ISO: Our recommended method, which overcomes all the difficulties of the others.

    This will do the full install:

        curl https://raw.github.com/cirosantilli/latex-cheat/master/install-texlive2013-ubuntu12.04.sh | bash 

    If you are doing it interactively, downloading via torrent which may be much faster (15 minutes vs 4 hours).

-   a package manager. Easiest method, but on Ubuntu, installs 2009 version, which is too outdated.

    `texlive-full` is the name of the Ubuntu repo for the TeX Live distro which contains the most packages.

        sudo aptitude install -y texlive-full

-   `install-tl` script. Has worked for us, but:

    - not very reliable, as it downloads packages one by one, and if one of them times out, the installation fails.
    - not very reproducible, as it may download different package versions from each mirror.

-   from source at:

    <https://www.tug.org/svn/texlive/trunk/>

The full install takes 3-4 hours, ~ 2.5GB on the compressed ISO. Some install methods can install many packages which install only parts of TeX Live, but we think its not worth it: just get the entire package and save yourself future headaches with missing packages later on.

### Internals

You can get the 14 GB source at:

    svn co svn://tug.org/texlive/trunk

It contains:

- 4 GB of precompiled binaries for many different architectures under `/bin`, including precompiled `tex` and `pdflatex`.
- the source code for many other utils that must be compiled such as `zip` and `wget`.

## MacTeX

Most popular Mac TeX distribution. TeX Live based, with Mac only additions.

## MiKTeX

Most popular Windows distribution.

## proTeXt

Includes MiKTeX and other things, such as the TeXstudio editor.

It used to contain the TeXnicCenter editor.

# Utilities

## pdflatex

Compiles LaTeX files into PDFs.

TeX Live 2013 symlinks `latex` to it.

### Error messages

**Very Important**!

LaTeX stdout default output is overly verbose and chaotic, making it very hard to find errors.

There however is a simple but non obvious at first sight convention:

> errors that prevent compilation are marked with an exclamation mark `!` at the beginning of the line, followed by `l.XXX` indicating the line.

For example if you forget to use a package with a line like:

    The command \asdfqwer is undefined, and this line is very very very very very very very long.

The error will look like:

    ! Undefined control sequence.
    l.266   The command \asdfqwer
                                is undefined, and this line is very very very ...

See how the line breaks at the column of the error.

So you know that the problem is at line 266, around `\asdfqwer`.

The line number does not need to be the line immediately following the exclamation point.

For example, if you forget to supply macro parameters:

    \label

The error will look something like:

    ! Paragraph ended before \label was complete.
    <to be read again>
                    \par
    l.267

meaning that the error occurred around line 267.

#### Filter only errors

- <http://tex.stackexchange.com/questions/27878/pdflatex-bash-script-to-supress-all-output-except-error-messages/165514#165514>
- <http://stackoverflow.com/questions/1037927/run-pdflatex-quietly>

Best no external dependencies one liner option:

    pdflatex a.tex | perl -0777 -ne 'print m/\n! .*?\nl\.\d.*?\n.*?\n/gs'

Best external dependencies option (TeX Live but not yet in 2013 ISO):

    http://mirror.ibcp.fr/pub/CTAN/support/texfot/

Basically a super advanced heuristic regex filtering script.

### Warning messages

- `<to be read again>`: TODO what is it?
- `overfull hbox`: a single word is too long for the line, and LaTeX does not know how to break it up, e.g.: `AVeryVeryVeryLongClassName`.

### sty search path

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

`texmf` stands for Tex Meta Fonts. My guess: an historical name that was a path for fonts which was extended to `.sty` files.

### Environment variables

- `TEXINPUTS`: colon separated list of directories under which LaTeX will search for all kinds of inputs, including LaTeX files and images.

Example:

    env TEXINPUTS=./media//:~/tex/:

Note that:

- you can give paths relative to the current directory with a dot as in: `./media//`
- you can give paths relative the home directory with a tilde as in: `~/tex/`
- a double trailing slash as in `./media//` means: search recursively under `./media/`
- a trailing colon at the end of the entire variable as in `~/.tex/:` means: append after the default search path.

## synctex

Allows forward and backward searches: give a TeX line, and find the corresponding PDF page to view it or the inverse.

It is quite painful to use it sometimes, and the docs are not very good, but it is the only solution.

Usage:

    synctex "$LINE:$COLUMN:$TEX_FILE" -o "$PDF_FILE"

Concrete example:

    synctex "10:1:rel/path/to/a.tex" -o "path/rel/to/a.pdf"

Sample output (in case of success):

    This is SyncTeX command line utility, version 1.2
    SyncTeX result begin
    Output:_build/index.pdf
    Page:8
    x:155.464050
    y:112.982956
    h:89.292244
    v:117.964276
    W:416.691071
    H:16.936472
    before:
    offset:0
    middle:
    after:
    Output:_build/index.pdf
    Page:8
    x:75.942314
    y:129.803223
    h:32.863045
    v:132.227466
    W:46.068058
    H:9.090909
    before:
    offset:0
    middle:
    after:
    SyncTeX result end

You must then parse that output to get the value you want.

POSIX sh example of how to parse to get the page:

    SYNCTEX_OUT="`synctex "$LINE:$COLUMN:$TEX_FILE" -o "$PDF_FILE"`"
    echo "SYNCTEX_OUT" | awk -F: '$1 ~/Page/ { print $2; exit }

## blatexml

Convert LaTeX to MathML.

## latexmk

Perl script that runs `latex` the right number of times to get references right, and other useful things.

Implication: the default CLI interface is horrible.

Make DIV:

    latexmk a.tex

Make PDF:

    latexmk -pdf a.tex

Clean all temporary files like `.aux` and `.log`, but not output files like `.pdf` or `.div`:

    latexmk -c

Same as `-c`, but also remove output files:

    latexmk -C

# HTML output

There are many tools that try to do LaTeX to HTML output, but it is not easy to get it right as it was not designed with reflowable content in mind.

The most realistic approach is to try convert only a subset of LaTeX, which is what <https://github.com/softcover/polytexnic> tries to do.

# Editors

## Texmaker

Easy to use open source cross platform LaTeX editor. Qt based. Good choice for beginners:

    sudo aptitude install -y texmaker

## TeXnicCenter

Popular Windows only open source editor, can use either MiKTeX or TeX Live.

Used to be included in the proTeXt distribution, but was recently replaced by 

# TODO

* how to add hrule after every environment

* how to create theorem environments with label (bold Theorem thing at beginning)
    given in source and not in definition

* how to center all rows in a tabular without specifying how many rows are there
    ([c] instead of [ccccc], which might change afterwards)
