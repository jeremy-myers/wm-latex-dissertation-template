PROJ_NAME = main
TEX_FILES := $(wildcard *.tex)

.PHONY: $(PROJ_NAME).pdf all clean

all: pdf

pdf:	$(addsuffix .pdf, $(PROJ_NAME))

$(PROJ_NAME).pdf:	$(PROJ_NAME).tex refs.bib $(TEX_FILES)
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<
	pdflatex $<

clean:
	@rm -f *.aux *.bak *.bbl *.blg *.lof *.log *.lot *.tmp *.toc *.synctex.gz *.xwm *.out
	@rm -f *~ \#*\#
	@rm -f *.fls *.fdb_latexmk
	@rm -f *.synctex*

distclean: clean
	@rm -f $(addsuffix .pdf, $(PROJ_NAME)) $(addsuffix .ps, $(PROJ_NAME))
	@rm -f $(addsuffix .dvi, $(PROJ_NAME)) $(addsuffix .out, $(PROJ_NAME))
