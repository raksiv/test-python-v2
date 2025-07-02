#!/bin/sh
source .venv/bin/activate
export PYTHONPATH=src
uvicorn main:app --host 0.0.0.0 --port 4000
