# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables for Python (optional)
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the Pipfile and Pipfile.lock into the container
COPY requirements.txt /app/

# Install dependencies using pipenv
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port the application will run on
EXPOSE 8000

# Define the command to run your application (e.g., Django development server)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
