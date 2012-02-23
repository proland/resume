all:	html

html:	resume.md
	pandoc -t html -o resume.html resume.md -c resume.css

upload: html 
	git commit -m "update via makefile" resume.css resume.pdf resume.html resume.md Makefile README.md
	git push origin master

clean:
	rm -f *~ *.html *.log *.pdf
