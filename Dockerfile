# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install uv
RUN pip install uv

# Copy the dependencies file to the working directory
COPY pyproject.toml ./

# Install any needed dependencies specified in pyproject.toml
RUN uv pip install --system -r pyproject.toml --no-cache

# Copy the rest of the application's code to the working directory
COPY . .

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
