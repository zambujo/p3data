all:	slides

slides:
	jupyter nbconvert slide_deck.ipynb --to slides
	mv slide_deck.slides.html docs/index.html

clean :
	rm -f *.html
