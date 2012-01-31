all:	html pdf

html:	resume.md
	pandoc -t html -o resume.html resume.md -c resume.css

pdf:	resume.html resume.md resume.css
	wkhtmltopdf -O Portrait -s Letter -L 0 -R 0 --no-background resume.html resume.pdf

upload: html pdf
	git commit -m "update via makefile" resume.css resume.pdf resume.html resume.md Makefile README.md
	git push origin master

clean:
	rm -f *~ *.html *.log *.pdf
