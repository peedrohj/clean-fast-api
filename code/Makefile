run-dev:
	pipenv install
	. ./.venv/bin/activate
	uvicorn src.main:app --reload --host=0.0.0.0 --port=5000

run-prod:
	pipenv install
	. ./.venv/bin/activate
	uvicorn src.main:app  --proxy-headers --host=0.0.0.0 --port=5000

build:
	pipenv install