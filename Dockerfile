FROM python:3.9-slim

# set workdir inside container
WORKDIR /app

# copy only requirements first (for layer caching)
COPY backend/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

# copy project
COPY backend/ /app/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
