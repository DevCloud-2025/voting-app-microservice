# Stage 1: Build stage
FROM python:3.9 AS builder

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# Stage 2: Production stage
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /install /usr/local
COPY . .

# Expose the application port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]