.PHONY: all clean

CC := latexmk -pdf -interaction=nonstopmode -synctex=1

all:
	$(CC) main.tex
	$(CC) min.tex

clean:
	latexmk -C
	rm -f *.4ct *.4tc *.bbl *.css *.fls *.haux *.idv *.lg *.png *.png *.synctex.gz *.tmp *.xref

view: all
	xdg-open main.pdf
