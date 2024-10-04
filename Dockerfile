FROM ubuntu:latest

WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user and switch to it
RUN useradd -ms /bin/bash appuser

# Create virtual environment
RUN python3 -m venv /app/venv

COPY requirements.txt requirements.txt
RUN /app/venv/bin/pip install -r requirements.txt

COPY app.py /opt/

# Set environment variables
ENV PATH="/app/venv/bin:$PATH"
ENV FLASK_APP=/opt/app.py

# Change ownership of the /app directory to the non-root user
RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser

# Expose the app
EXPOSE 5000

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
