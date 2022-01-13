FROM python:3.7

# Update the index of available packages
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
RUN apk update

# Install packages required for Python cryptography
RUN apk add --update \
  build-base \
  cairo \
  cairo-dev \
  cargo \
  freetype-dev \
  gcc \
  gdk-pixbuf-dev \
  gettext \
  jpeg-dev \
  lcms2-dev \
  libffi-dev \
  musl-dev \
  openjpeg-dev \
  openssl-dev \
  pango-dev \
  poppler-utils \
  postgresql-client \
  postgresql-dev \
  py-cffi \
  python3-dev \
  rust \
  tcl-dev \
  tiff-dev \
  tk-dev \
  zlib-dev
# Install django-pyas2 with pip
RUN pip install django-pyas2

# Copy the files from the project directory to the container
WORKDIR /
COPY django_pyas2 django_pyas2
CMD ["/usr/local/bin/python", "/django_pyas2/manage.py", "runserver", "0.0.0.0:80"]

# AS2 Server
EXPOSE 80
