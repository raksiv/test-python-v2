# Project Setup and Installation when using Test PyPI

This project uses stable dependencies from the official PyPI and a custom package `veetwo-client` published on TestPyPI (the Python test package index). To avoid installation issues caused by incomplete packages on TestPyPI, follow these steps:

## Step 1: Create and activate a virtual environment using `uv`

```bash
uv venv
source .venv/bin/activate
````

## Step 2: Upgrade build tools (optional with `uv`, but included for completeness)

```bash
uv pip install --upgrade pip setuptools wheel
```

## Step 3: Install stable dependencies from PyPI

```bash
uv pip install fastapi uvicorn grpcio grpcio-tools
```

## Step 4: Install `veetwo-client` from TestPyPI

```bash
uv pip install --index-url https://test.pypi.org/simple veetwo-client
```

## Step 5: Run your application

```bash
export PYTHONPATH=src
uvicorn main:app --host 0.0.0.0 --port 4000
```

```
script: ./dev.sh   
```

## Step 6: Testing

```bash
curl -X POST http://localhost:4000/write/test-object.txt \
  -H "Content-Type: text/plain" \
  --data "Hello from curl!"

curl http://localhost:4000/read/test-object.txt
```