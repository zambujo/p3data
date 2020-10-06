all: install update cleaning exploring slides
.PHONY: all 

install:
	poetry install
	poetry export -f requirements.txt --output requirements.txt

update:
	poetry run p3data P3_GrantExport.csv
	poetry run p3data P3_PersonExport.csv

cleaning:
	poetry run jupyter nbconvert --to notebook --inplace --execute notebooks/cleaning.ipynb

exploration:
	poetry run jupyter nbconvert --to notebook --inplace --execute notebooks/exploration.ipynb

slides:
	poetry run jupyter nbconvert --to notebook --inplace --execute notebooks/slide_deck.ipynb
	poetry run jupyter nbconvert notebooks/slide_deck.ipynb --to slides
	mv notebooks/slide_deck.slides.html docs/index.html
