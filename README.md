# LaTeX Cheat

LaTeX information and cheatsheets.

If you are looking for a template, see <https://github.com/cirosantilli/latex-template>. It was used to make this repo.

Relies on the submodule <https://github.com/cirosantilli/latex-submodule> for boilerplate.

See the documentation of the submodule for additional installation instructions.

Most important files of this repo:

- [index.tex](index.tex): the main LaTeX cheat.
- [min.tex](min.tex):     minimal LaTeX file. Useful starting point for minimal examples.

## Standards

TODO where is LaTeX specified? Is it standardized by an organization, or just book based like early C?

### Versions

-   `LaTeX2e`: is the latest stable release of `LaTeX`, and as of 2014-03, this is what most people mean when they say `LaTeX`, and shall be the focus of this cheat.

    Documentation, including primitives, found at: <http://www.tex.ac.uk/ctan/info/latex2e-help-texinfo/latex2e.html>. No examples unfortunately.

-   `LaTeX3`: unstable new version, which promises to offer more built-in functionality through a standard library to rely less on plugins.

    Project website: <http://latex-project.org/latex3.html>

Useful SE questions:

- <http://tex.stackexchange.com/questions/13541/difference-between-latex-latex2e-latex3>
- <http://tex.stackexchange.com/questions/953/why-is-latex3-taking-so-long-to-come-out>

### TeX

Also called *plain TeX* to emphasize the difference from LaTeX.

One major design goal of LaTeX is to separate content from form, as TeX itself is very low level, and not very useful for end users.

TODO what is the exact relation between TeX and LaTeX?

<http://tex.stackexchange.com/questions/49/what-is-the-difference-between-tex-and-latex>

<http://www.tug.org/levels.html>

<http://tex.stackexchange.com/questions/41031/whats-the-difference-between-pdftex-and-pdflatex>

The LaTeX language is almost TeX language with libraries, but this is not exact: there are TeX commands that are not available in LaTeX: <http://ask.metafilter.com/55266/TeX-LaTeX>
TODO are there LaTeX commands that are not available in TeX?

LaTeX renames some TeX macros: <http://tex.stackexchange.com/questions/171873/which-primitives-does-latex2e-rename-move>, most of them by adding the @ prefix, e.g. `\@@input`.

This cheat shall focus on LaTeX from high level point of view, and mostly on differences between LaTeX and TeX. TeX specific stuff that works analogously in LaTeX will not be commented upon.

While you can get away with high level only for a while, you need to understand the low level stuff to do things like:

- understand error messages
- create your own libraries

For a TeX cheatsheet see: <https://github.com/cirosantilli/tex-cheat>

TODO what about output formats? Is it possible to do plain TeX to PDF?

## Distributions

The easiest way to get started with LaTeX is by using a distribution that packs up everything you need.

Some distributions also come with a package manager which automatically downloads sty files as needed.

### TeX Live

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

#### Internals

You can get the 14 GB source at:

    svn co svn://tug.org/texlive/trunk

It contains:

- 4 GB of precompiled binaries for many different architectures under `/bin`, including precompiled `tex` and `pdflatex`.
- the source code for many other utils that must be compiled such as `zip` and `wget`.

### MacTeX

Most popular Mac TeX distribution. TeX Live based, with Mac only additions.

### MiKTeX

Most popular Windows distribution.

### proTeXt

Includes MiKTeX and other things, such as the TeXstudio editor.

It used to contain the TeXnicCenter editor.

## Variants

LaTeX has spawned several closely related variant libraries / languages, mostly because in certain aspects it sucks hard. Despite it's shortcomings, LaTeX still seems to be the dominant variant, and has the best tool / community support.

Good info: <http://mactex-wiki.tug.org/wiki/index.php/TeX_Variants>

### eTeX

Extends TeX.

### XeTeX

<http://en.wikipedia.org/wiki/XeTeX>

Its main goal is tu support Unicode out of the box.

Comes in TeX Live full.

### LuaTeX

<http://en.wikipedia.org/wiki/LuaTeX>

Supports embedded Lua scripting.

Just great: part of the TeX community wants to replace Perl, it's traditional scripting language, with Lua. Huge improvement! Python, LSB and much more widely used, anyone?

Allows you to do stuff like:

    \documentclass{article}
    \begin{document}
    \edef\out{\directlua{
      j = io.popen(" ls -l")
      tex.write(j:read("*all"))
      j:close()
    }}
    \out
    \end{document}

which pastes Lua output into TeX.

Comes in TeX Live full.

### ConTeXt

<http://en.wikipedia.org/wiki/ConTeXt>

Comes in TeX Live full.

## Command line interface

Important options include:

- `-interaction=nonstopmode`: don't stop LaTeX on each error. This is useless since what we really want is to fix the source file in the editor. The problem then becomes that it is hard to find the error messages amidst all the noise. A possible solution is `texfot`.

## Utilities

### pdflatex

Compiles LaTeX files into PDFs directly, without going through DVI, thus allowing for better PDF specifics support.

TeX Live 2013 symlinks `latex` to it.

Some packages only work on `pdflatex`. TODO: how are those packages written? Does `pdflatex` have new primitives, or some other mechanism exists?

Some packages implement very PDF specific features, e.g.:

- forms: `hyperref` allows it: <http://tex.stackexchange.com/questions/14842/creating-fillable-pdfs>
- file embedding: <http://texdoc.net/texmf-dist/doc/latex/attachfile/attachfile.pdf>

### latexmk

Perl script that provides a very good CLI interface to LaTeX Implication: the default CLI interface is horrible.

This script is a life saver. **Use it**.

In TeX Live 2013.

Does important stuff like:

- run `latex` and `bibtex` the right number of times to get references right
- preview, build on save
- clean only the generated files

I can't wait for it to incorporate `texfot`.

Make DIV:

    latexmk a.tex

Make PDF:

    latexmk -pdf a.tex

Clean all temporary files like `.aux` and `.log`, but not output files like `.pdf` or `.div`:

    latexmk -c

Same as `-c`, but also remove output files:

    latexmk -C

`-pv`: preview: open output in viewer

`-pvc` (preview continuously): watch and build mode (compile on save with inotify)

Almost any options that `pdflatex` LaTeX and friends accept can be passed to `latexmk` and will be forwarded to `pdflatex`. Some of those may trigger special effects on `latexmk` in addition to being forwarded. The exact list of options can be found with:

    latemk -showextraoptions

#### Error messages

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

##### texfot

##### Filter only errors

- <http://tex.stackexchange.com/questions/27878/pdflatex-bash-script-to-supress-all-output-except-error-messages/165514#165514>
- <http://stackoverflow.com/questions/1037927/run-pdflatex-quietly>

Good no external dependencies one liner option:

    pdflatex a.tex | perl -0777 -ne 'print m/\n! .*?\nl\.\d.*?\n.*?\n/gs'

Best external dependencies option. In TeX Live but not yet in 2013 ISO:

    http://mirror.ibcp.fr/pub/CTAN/support/texfot/

Basically a super advanced heuristic regex filtering script.

#### Warning messages

- `<to be read again>`: TODO what is it?
- `overfull hbox`: a single word is too long for the line, and LaTeX does not know how to break it up, e.g.: `AVeryVeryVeryLongClassName`.

#### sty search path

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

#### Environment variables

- `TEXINPUTS`: colon separated list of directories under which LaTeX will search for all kinds of inputs, including LaTeX files and images.

Example:

    env TEXINPUTS=./media//:~/tex/:

Note that:

- you can give paths relative to the current directory with a dot as in: `./media//`
- you can give paths relative the home directory with a tilde as in: `~/tex/`
- a double trailing slash as in `./media//` means: search recursively under `./media/`
- a trailing colon at the end of the entire variable as in `~/.tex/:` means: append after the default search path.

### SyncTeX

Allows forward and backward searches: give a TeX line, and find the corresponding PDF page to view it or the inverse.

It is quite painful to use it sometimes, and the docs are not very good, but it is the only solution.

First you must make the compiler produce SyncTeX information with the `-synctex=1` option. This only needs to be done once on the last pass, and can be done through `latexmk`:

    latexmk -synctex=1 main.tex

This will generate a `main.synctex.gz` files which contains the mappings between lines and PDF positions.

Call Synctex with:

    synctex "$LINE:$COLUMN:$TEX_FILE" -o "$PDF_FILE"

Concrete example:

    synctex "10:1:rel/path/to/a.tex" -o "path/rel/to/a.pdf"

Make sure that the output file (PDF) is in the same directory as the `.synctex.gz`: I have not been able to get it to work otherwise: <http://tex.stackexchange.com/questions/109292/how-to-put-synctex-file-in-different-directory-than-pdf-without-segmentation-fau>

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

TODO what does each field mean? I think `x` and `y` are positions in the page, `h` and `v` the actual rectangle corresponding to the line (tools like Texmaker highlight a rectangle inteligently, not just a point).

You must then parse that output to get the value you want.

POSIX `sh` example of how to parse to get the page:

    SYNCTEX_OUT="`synctex "$LINE:$COLUMN:$TEX_FILE" -o "$PDF_FILE"`"
    echo "SYNCTEX_OUT" | awk -F: '$1 ~/Page/ { print $2; exit }

Okular can call SyncTeX and parse it's output for you if you give it a special input path of the form:

    okular --unique '/path/to/main.pdf#src:123/path/to/main.tex'

where `123` is the current line number. TODO where is documented?

Highlight exact point in output page for the given input input line on forward searches: not yet possible, feature request at: <https://bugs.kde.org/show_bug.cgi?id=240315>

### texdoc

Command line tool to access LaTeX documentation files.

Searches some path (TODO which), and opens a compiled PDF output documentations.

The advantage of having PDFs over in terminal man pages is that it is then possible for the manual to contain live examples.

Documents both LaTeX internals and packages.

Get documentation for a package:

    texdoc hyperref

There are also documentation on LaTeX in general:

    texdoc source2e
    texdoc latex2e
    texdoc tex

In TeX Live 2013.

### blatexml

Convert LaTeX to MathML.

## HTML output

There are many tools that try to do LaTeX to HTML output, but it is not easy to get it right as it was not designed with reflowable content in mind.

The most realistic approach is to try convert only a subset of LaTeX, which is what <https://github.com/softcover/polytexnic> tries to do.

## Editors

### Texmaker

Easy to use open source cross platform LaTeX editor. Qt based. Good choice for beginners:

    sudo aptitude install -y texmaker

### TeXnicCenter

Popular Windows only open source editor, can use either MiKTeX or TeX Live.

Used to be included in the proTeXt distribution, but was recently replaced by 

## Lint tools

<http://tex.stackexchange.com/questions/163/is-there-a-program-equivalent-to-lint-for-latex>

- ChkTeX: <http://www.ctan.org/tex-archive/support/chktex>. Executable: `chktex`.
- lacheck: <http://www.ctan.org/tex-archive/support/lacheck>

## TODO

-   how to add an `hrule` after every environment of a type?
-   how to create theorem environments with label (bold Theorem thing at beginning) given in source and not in definition
-   how to center all rows in a tabular without specifying how many rows are there (`[c]` instead of `[ccccc]`, which might change afterwards)
