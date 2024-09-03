# Use an official Python runtime as a parent image
FROM python:3.10-slim

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
COPY pyproject.toml ./
COPY poetry.lock* ./

# Install project dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Copy the Jupyter notebook
COPY how-to-iemap-mi.ipynb ./

# Create a directory for bind mount
RUN mkdir /app/host_files

# Expose the port Jupyter will run on
EXPOSE 8888

# Start Jupyter notebook with specific options
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.default_url=/notebooks/how-to-iemap-mi.ipynb"]