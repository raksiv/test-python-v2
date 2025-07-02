FROM python:3.11-slim

# Install uv
RUN curl -Ls https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.cargo/bin:$PATH"

WORKDIR /app

# Copy pyproject.toml first (for caching)
COPY pyproject.toml .

# Install dependencies using uv
RUN uv pip install -r <(uv pip compile --generate-hashes)

# Copy the rest of the app
COPY . .

EXPOSE 4000

# Start FastAPI using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4000"]
