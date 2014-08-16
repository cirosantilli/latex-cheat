.PHONY: all clean

all:
	latexmk -pdf main.tex
	latexmk -pdf min.tex

clean:
	latexmk -C
	rm -f *.4ct *.4tc *.bbl *.css *.fls *.haux *.idv *.lg *.png *.png *.tmp *.xref

view: all
	xdg-open main.pdf
