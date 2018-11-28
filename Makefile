all: main

CLASSNAME=$(shell basename $(CURDIR))
PDFDIR=../../pdf
CODDIR=../../cod

main:
	pdflatex main.tex
	bibtex main
	bibtex main
	pdflatex main.tex
	@cp main.pdf $(CLASSNAME).pdf
	evince $(CLASSNAME).pdf
	rm *~ *.aux *.dvi *.bbl *.blg *.log *.lot *.lof *.toc *.out *.nav *.snm *.vrb main.pdf

deploy: 
	# $(shell cp $(CLASSNAME).pdf $(DROPBOXDIR))
	cp $(CLASSNAME).pdf $(PDFDIR)
	zip -r $(CLASSNAME)-cod.zip src
	cp $(CLASSNAME)-cod.zip $(CODDIR)

clean:
	rm *~ *.aux *.dvi *.bbl *.blg *.log *.lot *.lof *.toc *.out *.nav *.snm *.vrb main.pdf main.synctex.gz
