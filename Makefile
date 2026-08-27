.PHONY: test lint typecheck run-chaos report clean docker-up docker-down

test:
	source .venv/bin/activate && pytest -q

lint:
	source .venv/bin/activate && ruff check src tests scripts

typecheck:
	source .venv/bin/activate && mypy src

run-chaos:
	source .venv/bin/activate && python scripts/run_chaos.py --config configs/default.yaml --out reports/metrics.json

report:
	source .venv/bin/activate && python scripts/generate_report.py --metrics reports/metrics.json --out reports/final_report.md

docker-up:
	docker compose up -d

docker-down:
	docker compose down

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache reports/metrics.json reports/final_report.md
