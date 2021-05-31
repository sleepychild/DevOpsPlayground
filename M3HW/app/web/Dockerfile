FROM python:3.9.5-alpine3.13

RUN apk update && apk upgrade

RUN apk add --no-cache \
build-base \
jpeg-dev \
zlib-dev \
libffi-dev \
mariadb-dev \
python3-dev \
py3-pip \
py3-mysqlclient

ENV LIBRARY_PATH=/lib:/usr/lib

WORKDIR /usr/src/app

COPY . .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "./pyweb.py"]
