# Project Setup and Installation when using PyPI

## Step 1: Create and activate a virtual environment using `uv`

```bash
uv venv
source .venv/bin/activate
uv sync
````

## Step 2: Run your application

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