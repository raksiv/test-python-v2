FROM python:3.11-slim

# Install uv
RUN curl -Ls https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

# Copy only pyproject.toml first to leverage Docker layer caching
COPY pyproject.toml .

# Install dependencies from pyproject.toml
RUN uv pip install --system

# Copy the rest of the app
COPY . .

EXPOSE 4000

# Start FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4000"]
