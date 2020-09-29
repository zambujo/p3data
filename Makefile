all: slides
.PHONY: all 
slides:
	poetry run jupyter nbconvert notebooks/slide_deck.ipynb --to slides
	mv notebooks/slide_deck.slides.html docs/index.html

