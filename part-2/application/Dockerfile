# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask application
COPY app.py .

# Make port 8002 available to the world outside this container
EXPOSE 8002

# Run the app using gunicorn instead of the Flask's development server
CMD ["gunicorn", "-w 4", "-b :8002", "app:app"]