all: slides preprocess explore
.PHONY: all 
slides:
	jupyter nbconvert slide_deck.ipynb --to slides
	mv slide_deck.slides.html docs/index.html

preprocess:
	jupyter nbconvert cleaning.ipynb --to html
	mv cleaning.html docs/

explore:
	jupyter nbconvert exploration.ipynb --to html
	mv exploration.html docs/

