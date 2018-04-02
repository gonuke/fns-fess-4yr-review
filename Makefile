
SOURCES = report.tex \
          pkgs.tex \
          defs.tex \
          titlepage.tex \
          exec.tex \
          budget.tex \
          narrative.tex \
          refs.tex \
          products.tex \
          facilities.tex \
          refs.bib

TIDY=*.lo[fgt] *.toc *.bbl *.blg *.ist *.glo *.aux *.acn *.out

report.pdf: ${SOURCES}
	pdflatex report.tex
	bibtex prod.aux
	bibtex ref.aux
	pdflatex report.tex
	pdflatex report.tex
	rm -f ${TIDY}

force:
	pdflatex report.tex
	bibtex prod.aux
	bibtex ref.aux
	pdflatex report.tex
	pdflatex report.tex

no-cite: ${SOURCES}
	pdflatex report.tex
	pdflatex report.tex
	rm -f ${TIDY}

check: report.pdf
	pdflatex report.tex | grep Citation | sort

tidy:
	rm -f ${TIDY}

clean: tidy
	rm -f report.pdf
