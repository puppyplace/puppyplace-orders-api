clean: clean-build
	@find . -iname '*.pyc' -delete
	@find . -iname '*.pyo' -delete
	@find . -iname '*~' -delete
	@find . -iname '*.swp' -delete
	@find . -iname '__pycache__' -delete

clean-build:
	@rm -fr build/
	@rm -fr dist/
	@rm -fr *.egg-info

install-deps:
	pip install poetry
	poetry install

run:
	poetry run python manage.py runserver

test:
	poetry run pytest -x -s

pyformat:
	isort . && blue .

check-dead-fixtures:
	poetry run pytest --dead-fixtures

migrate:
	poetry run python manage.py migrate