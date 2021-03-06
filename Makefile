
SOURCES = report.tex \
          pkgs.tex \
          defs.tex \
          titlepage.tex \
          exec.tex \
          budget.tex \
          narrative.tex \
          narrative/*.tex \
          refs.tex \
          products.tex \
          facilities.tex \
          personnel.tex \
          citations.bib

TIDY=*.lo[fgt] *.toc *.bbl *.blg *.ist *.glo *.aux *.acn *.out

default: report.pdf

report.pdf: ${SOURCES}
	pdflatex report.tex
	bibtex ref.aux
	bibtex articles.aux
	bibtex theses.aux
	bibtex software.aux
	bibtex presents.aux
	pdflatex report.tex
	pdflatex report.tex

force:
	pdflatex report.tex
	bibtex ref.aux
	bibtex articles.aux
	bibtex theses.aux
	bibtex software.aux
	bibtex presents.aux
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
