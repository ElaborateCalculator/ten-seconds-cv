SHELL   = /bin/sh

FILE0   = cv-darren-rogers
TEX     = $(FILE0).tex
XDV     = $(FILE0).xdv
PDF     = $(FILE0).pdf
PDFOUT  = $(FILE0)-encrypted.pdf
PNG     = $(FILE0).png

all:
	make tex

tex:
	xelatex -no-pdf $(TEX)
	xelatex -no-pdf $(TEX)
	#xdvipdfmx.exe $(XDV)
	xelatex $(TEX)
	make clean
pw:
	pdftk $(PDF) output $(PDFOUT) owner_pw ownerpasswd user_pw userpasswd compress encrypt_128bit

image:
	gs -sDEVICE=png16m -r300 -dDownScaleFactor=4 -sOutputFile=${PNG} -dNOPAUSE -dBATCH -dQUIET -dLastPage=1 ${PDF}

help:
	echo "USAGE: make [all/tex/handout/pw/clean/image]"

clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.nav *.out *.snm *.xdv *.toc *.synctex.gz *~

