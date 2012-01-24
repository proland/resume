all:	resume.html resume.pdf

%.html:	%.md
	pandoc -t html -o $@ $< -c resume.css
	git commit -m "update html via makefile" $@ $< Makefile README.md
	git push origin master

%.pdf:	%.md
	markdown2pdf --template=resume-template.tex --xetex $<
	git commit -m "update pdf via makefile" $@ $< Makefile README.md
	git push origin master

clean:
	rm -f *~ *.html *.log *.pdf
