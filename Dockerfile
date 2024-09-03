# Docker image for running a Jupyter notebook demonstrating iemap-mi Python module usage

# Build stage
FROM python:3.10-slim as builder

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="${PATH}:/root/.local/bin"

# Copy the pyproject.toml and poetry.lock (if available) files
COPY pyproject.toml poetry.lock* ./

# Install project dependencies, including iemap-mi and Jupyter
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-root

# Runtime stage
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy all installed packages and binaries from builder stage
COPY --from=builder /usr/local /usr/local

# Copy the Jupyter notebook demonstrating iemap-mi usage
COPY how-to-iemap-mi.ipynb ./

# Create a directory for bind mount (for user data and outputs)
RUN mkdir /app/host_files

# Ensure Jupyter is properly set up
RUN jupyter notebook --generate-config

# Expose the port Jupyter will run on
EXPOSE 8888

# Start Jupyter notebook with the iemap-mi demonstration notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.default_url=/notebooks/how-to-iemap-mi.ipynb"]