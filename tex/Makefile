INS = $(wildcard *.tex)
OUTS = $(patsubst %.tex,%.div,$(INS))

all: $(OUTS)

%.div: %.tex
	tex $<

clean:
	rm -f *.dvi *.log

view: all
	xdg-open main.dvi 
