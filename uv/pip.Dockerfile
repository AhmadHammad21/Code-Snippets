# Python 3.12 slim base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy requirements first (better Docker layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy application code
COPY src ./src
COPY README.md ./

# Run Script
CMD ["uv", "run", "python", "-m", "src.main"]