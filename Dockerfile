FROM python:3.7-alpine3.9

# Update the index of available packages
RUN apk update

# Install packages required for Python cryptography
RUN apk add --no-cache openssl-dev gcc libffi-dev musl-dev

# Install django-pyas2 with pip
RUN pip install django-pyas2

# Copy the files from the project directory to the container
WORKDIR /
COPY django_pyas2 django_pyas2
CMD ["/usr/local/bin/python", "/django_pyas2/manage.py", "runserver", "0.0.0.0:80"]

# AS2 Server
EXPOSE 80
