#!/usr/bin/env bash
pkgs="pandas requests typer mypy fastapi black zxpy awscli polars matplotlib pytest seaborn pandas-stubs ruff"
poetry add $pkgs
