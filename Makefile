all:	resume.html resume.pdf

%.html:	%.md
	pandoc -t html -o $@ $< -c resume.css
	git commit -m "update html via makefile" $@ $< Makefile README.md
	git push origin master

%.pdf:	%.md resume.css
	wkhtmltopdf -O Portrait -s Letter -L 0 -R 0 --no-background resume.html resume.pdf
	git commit -m "update pdf via makefile" $@ $< Makefile README.md
	git push origin master

clean:
	rm -f *~ *.html *.log *.pdf
