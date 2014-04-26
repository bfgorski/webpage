all : paper 
PAPER=surface_painting
EPSFILES = VRBunny1.eps basemesh.eps subdmesh.eps face.eps workbench.eps face1.eps

paper: $(PAPER).tex $(EPSFILES)
	-latex $(PAPER)
	-bibtex $(PAPER)
	-latex $(PAPER)
	dvips -o $(PAPER).ps $(PAPER).dvi
	ps2pdf $(PAPER).ps

sw : sp_student_workshop.tex $(EPSFILES)
	-latex sp_student_workshop
	-bibtex  sp_student_workshop 
	-latex sp_student_workshop
	dvips -o sp_student_workshop.ps sp_student_workshop.dvi
	ps2pdf sp_student_workshop.ps


.SUFFIXES : .rgb .eps

.rgb.eps:
	convert $< 'eps:-' > $*.eps 

VRBunny1.eps : VRBunny1.rgb
	convert $< -size 75x75 'eps:-' > $*.eps 

clean:
	-rm *.aux
	-rm *.blg
	-rm *.bbl
	-rm *.dvi
	-rm *.log
	-rm *.pdf
