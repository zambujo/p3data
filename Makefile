all: cleaning exploring slides
.PHONY: all 

cleaning:
	poetry run jupyter nbconvert --to notebook --inplace --execute notebooks/cleaning.ipynb

exploration:
	poetry run jupyter nbconvert --to notebook --inplace --execute notebooks/exploration.ipynb

slides:
	poetry run jupyter nbconvert --to notebook --inplace --execute notebooks/slide_deck.ipynb
	poetry run jupyter nbconvert notebooks/slide_deck.ipynb --to slides
	mv notebooks/slide_deck.slides.html docs/index.html
