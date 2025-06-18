# Use python image with python installed
FROM python:3.11-slim

# Define where all of the next commands are gonna be run from
WORKDIR /app

# Copy all files of the current directory to /app
COPY . /app

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Launch the API on port 80
EXPOSE 80
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"] 
